	package DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Employee;
import model.Login;
import model.MySession;
import model.MyTask;
import model.Order;
import model.RawMaterials;
import model.Report;

public class OrderDAO {
	public List<Order> getAllOrders() {
			 Session session = MySession.getSession();
			 Criteria cr = session.createCriteria(Order.class);
			 List<Order> odrlist = cr.list();
			 session.close();
			 return odrlist;
			 
	}
	public void addOrder(Order ord) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		
		Order existingOrd = findOrdreByOrderId(ord.getOrderId());
		
		if(existingOrd != null) 
			session.update(ord);
		else
			session.persist(ord);
		
		transaction.commit();
		session.close();
		System.out.println("Added");
	}
	


	public void removeOrder(String orderId) {
		
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		
		MyTaskDAO mdao = new MyTaskDAO();
		MyTask mt =mdao.getTaskOfOrder(orderId);
		if(mt!=null)
			session.delete(mt);
		
		RawMaterialsDAO rdao = new  RawMaterialsDAO();
		List<RawMaterials> rlist= rdao.getRawData(orderId);
		if(rlist!=null)
		{
			for(RawMaterials x:rlist)
				session.delete(x);
		}
		
		ReportDAO rpdao= new  ReportDAO();
		List<Report> rplist = rpdao.findMachineReportByOrderId(orderId);
		if(rplist != null)
			for(Report r:rplist)
				session.delete(r);
		
		Order ord =(Order) session.get(Order.class, orderId);
		session.delete(ord);
		transaction.commit();
		session.close();
	}
	
	public Order findOrdreByOrderId(String orderId) {
		
		Session session = MySession.getSession();
		Query query = session.createQuery("select odr from Order odr where odr.orderId=:orderId");
		query.setString("orderId",orderId );
		List<Order> lg= query.list();
		Order u= null;
		if(lg.size()==1)
			u = lg.get(0);
		return u;
	}
	
	public void modifyOrder(Order ord) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.update(ord);
		transaction.commit();
		session.close();
		System.out.println("updated");
	}
	public List<Order> allOrdersOfManager(String managerId){
		List<Order> orders=null;
		Session session = MySession.getSession();
		Query query = session.createQuery("select odr from Order odr where odr.managerId=:managerId");
		query.setString("managerId",managerId );
		orders= query.list();
		return orders;
	}
	
}
