package DAO;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.MySession;

import model.RawMaterials;
import model.Request;

public class RawMaterialsDAO {

	public String OrderId;
	String rawno;
	String selectedid;
	
	public boolean currentOrderId(String OrderId){
	boolean bool=false;	
	if(OrderId!=null){
	this.OrderId=OrderId;
	bool=true;
	}
	else bool=false;
	return bool;
	} 
	
	
	public void setRawData(RawMaterials rws) {
		
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.persist(rws);
		
		transaction.commit();
		session.close();
	   
	}
	
	
	public List<RawMaterials> getRawData(String orderId){
		Session session = MySession.getSession();
		Query query = session.createQuery("select rw from RawMaterials rw where rw.orderId=:orderId");
		query.setParameter("orderId",orderId );
		List<RawMaterials> rwlist =query.list(); 
		session.close();
		return rwlist;
	}
	
	public List<RawMaterials> getAllRaws(){
		 Session session = MySession.getSession();
		 Criteria cr = session.createCriteria(RawMaterials.class);
		 List<RawMaterials> rawlist = cr.list();
		 session.close();
		 return rawlist;
		 
	}
	public void removeRaw(int rawId) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		RawMaterials raw =  (RawMaterials) session.get(RawMaterials.class,rawId);
		session.delete(raw);
		transaction.commit();
		session.close();
	}
}
