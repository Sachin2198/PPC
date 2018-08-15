package DAO;
import java.util.List;
import java.sql.SQLException;
import model.Request;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.MySession;

public class RequestDAO {
	
	public void sendRequest(Request req) 
	{	
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.persist(req);
		transaction.commit();
		session.close();
	}
	
	public List<Request> receiveRequest(String receiverId) 
	{
	 Session session = MySession.getSession();
	 Criteria cr = session.createCriteria(Request.class,receiverId);
	 List<Request> reqlist = cr.list();
	 session.close();
	 return reqlist;
	 
	}
	
	public void updateRequest(Request req) throws SQLException
	{	
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.update(req);
		transaction.commit();
		session.close();
	}
	public List<Request> getAllRequests() {
		 Session session = MySession.getSession();
		 Criteria cr = session.createCriteria(Request.class);
		 List<Request> reqlist = cr.list();
		 session.close();
		 for(Request x:reqlist)
			 System.out.println(x.toString());
		 return reqlist;
	}
	
	public void removeRequest(int id) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		Request req =  (Request) session.get(Request.class, id);
		session.delete(req);
		transaction.commit();
		session.close();
	}
}
