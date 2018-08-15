package DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Employee;
import model.Machine;
import model.MySession;
import model.MyTask;
import model.Order;

public class MachineDAO {

	public void addMachine(Machine mac ) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.persist(mac);
		transaction.commit();
		session.close();
	}
		
	
	public void removeMachine(int id) {
		
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		
		Machine mac =  (Machine) session.get(Machine.class, id);
		MyTaskDAO mdao= new  MyTaskDAO();
		List<MyTask> mt =mdao.getAllocatedTask(mac.getMachineNo());
	
		if(mt != null)
			for(MyTask x:mt) {
				OrderDAO odao = new OrderDAO();
				Order ord=odao.findOrdreByOrderId(x.getOrderId());
				ord.setAllocated("No");
				
				session.update(ord);
				session.delete(x);
			}

		
		session.delete(mac);
		transaction.commit();
		session.close();
	}
	
	public List<Machine> getAllMachines(){
		 Session session = MySession.getSession();
		 Criteria cr = session.createCriteria(Machine.class);
		 List<Machine> maclist = cr.list();
		 session.close();
		 return maclist;
		 
	}
	
	public Machine findMachineById(int id) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		Machine machine =(Machine) session.get(Machine.class, id);
		transaction.commit();
		session.close();
		return machine;
	}
	
	public Machine findMachineByMachineNo(String machineNo) {
		Session session = MySession.getSession();
		Query query = session.createQuery("select mac from Machine mac where mac.machineNo=:machineNo");
		query.setString("machineNo",machineNo);
		List<Machine> maclist =query.list(); 
		session.close();
		if(maclist.size()==1)
			return maclist.get(0);
		return null;
	}
}
