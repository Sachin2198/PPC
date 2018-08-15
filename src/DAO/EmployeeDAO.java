package DAO;
import model.MySession;
import model.MyTask;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Order;

import model.Employee;
import model.Login;

public class EmployeeDAO {

	/*........................ Employee ................................*/
	
	public void addEmployee(Employee emp) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.persist(emp);
		transaction.commit();
		session.close();
		System.out.println("Added");
	}
		
	
	
	public void removeEmployee(String userId) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		
		LoginDAO ldao = new  LoginDAO();
		Employee emp =  (Employee) session.get(Employee.class, userId);
		Login login =ldao.findUserByNAme(emp.getName());
		if(emp.getRole().equals("planningManager"));
			{
				OrderDAO odao = new OrderDAO();
				List<Order> ords=odao.allOrdersOfManager(userId);
				if(ords.size()!=0)
					for(Order x:ords) {
						x.setManagerId(null);
						x.setAllocated("No");
						session.update(x);
					}
			}
			if(emp.getRole().equals("supervisor"));
			{
				OrderDAO odao = new OrderDAO();
				List<Order> ords=odao.allOrdersOfManager(userId);
				if(ords.size()!=0)
					for(Order x:ords) {
						x.setSupervisor(null);
						x.setAllocated("No");
						session.update(x);
					}
			}
		session.delete(login);
		session.delete(emp);
		transaction.commit();
		session.close();
	}
	
	public List<Employee> getAllEmployees(){
		 Session session = MySession.getSession();
		 Criteria cr = session.createCriteria(Employee.class);
		 List<Employee> emplist = cr.list();
		 session.close();
		 return emplist;
		 
	}
	
	public Employee findSupUserIdByName(String userName) {
		Session session = MySession.getSession();
		Query query = session.createQuery("select emp from Employee emp where emp.name=:name");
		query.setString("name",userName);
		List<Employee> emplist =query.list(); 
		session.close();
		if(emplist.size()==1)
			return emplist.get(0);
		return null;
	}
	
	public void modifyEmployee(Employee emp) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		session.update(emp);
		transaction.commit();
		session.close();
		System.out.println("updated");
	}
	
	
}
