package DAO;
import java.util.List;

import org.apache.commons.digester.plugins.strategies.FinderFromClass;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Machine;
import model.MySession;
import model.MyTask;
import model.Order;
import model.Report;

public class MyTaskDAO {
	
	public void addTask(MyTask mt) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.persist(mt);
		
		Report rp = new  Report();
		MachineDAO mdao = new MachineDAO();
		
		rp.setMachineNo(mt.getMachineNo());
		rp.setOrderId(mt.getOrderId());
		Machine machine=mdao.findMachineByMachineNo(mt.getMachineNo());
		if(machine!=null) {
			rp.setMachineId(machine.getId());
			ReportDAO rdao = new ReportDAO();
			if(rdao.checkExistingMachineReport(mt.getMachineNo())==false)
				session.persist(rp);
		}
		
		transaction.commit();
		session.close();
		
	}
	public List<MyTask> getAllocatedTask(String machineNo) {
		Session session = MySession.getSession();
		Query query = session.createQuery("select tk from MyTask tk where tk.machineNo=:machineNo");
		query.setString("machineNo",machineNo );
		List<MyTask> mtlist =query.list(); 
		session.close();
		return mtlist;
		
	}
	public MyTask getTaskOfOrder(String orderId) {
	
		Session session = MySession.getSession();
		Query query = session.createQuery("select tk from MyTask tk where tk.orderId=:orderId");
		query.setString("orderId",orderId );
		List<MyTask> mtlist =query.list();
		session.close();
		if(mtlist.size()==1)
			return mtlist.get(0);
		return null;
	}
	
	public void removeTask(int taskId) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		MyTask mt =  (MyTask) session.get(MyTask.class, taskId);
		
		OrderDAO odao = new  OrderDAO();
		Order ord = odao.findOrdreByOrderId(mt.getOrderId());
		
		ord.setAllocated("No");
		session.update(ord);
		
		session.delete(mt);
		transaction.commit();
		session.close();
	}
	
	public List<MyTask> getAllTasks(){
		 Session session = MySession.getSession();
		 Criteria cr = session.createCriteria(MyTask.class);
		 List<MyTask> mtlist = cr.list();
		 session.close();
		 return mtlist;
	}
}
