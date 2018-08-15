package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javafx.beans.property.ReadOnlyBooleanProperty;
import model.Machine;
import model.MySession;
import model.RawMaterials;
import model.Report;


public class ReportDAO {


	
	
	/*........................................................................................................*/
	/*........................................................................................................*/
	public boolean checkExistingMachineReport(String machineNo) {
		
		int matched=0;
		Session session = MySession.getSession();
		Criteria cr = session.createCriteria(Report.class);
		List<Report> replist = cr.list();

		for(Report x:replist) {
			if(x.getMachineNo()==machineNo)
				matched=1;
		    }
		session.close();
		
		 if(matched==1)
			 return true;
		 else
			 return false;
		
	}
	
	public List<RawMaterials> getAllRawMaterialsByOrderId(String orderId) {
		Session session = MySession.getSession();
		Query query = session.createQuery("select rw from RawMaterials rw where rw.orderId=:orderId");
		query.setParameter("orderId",orderId );
		List<RawMaterials> rwlist =query.list(); 
		session.close();
		return rwlist;
	}
	
	
	public List<Machine> findMachineReportTable(String orderId) {
		Session session = MySession.getSession();
		List<Report> rplist =findMachineReportByOrderId(orderId) ;
		List<Machine> maclist= new ArrayList<Machine>();
		for(Report x:rplist) {
			
			MachineDAO mdao = new MachineDAO();
			Machine machine =mdao.findMachineByMachineNo(x.getMachineNo());
			maclist.add(machine);
		}
		/*for(Machine x: maclist)
			System.out.println(x.toString());*/
		
		session.close();
		return maclist;
	}
	
	
	public List<Report> findMachineReportByOrderId(String orderId) {
		Session session = MySession.getSession();
		Query query = session.createQuery("select rp from Report rp where rp.orderId=:orderId");
		query.setParameter("orderId",orderId );
		List<Report> rplist =query.list(); 
		session.close();
		/*for(Report x: rplist)
			System.out.println(x.toString());*/
		
		return rplist;
	}
	
	public void removeMachineReport(String orderId) {
		Session session = MySession.getSession();
		Transaction transaction= session.beginTransaction();
		List<Report> rps=findMachineReportByOrderId(orderId);
		if(rps !=null) {
			for(Report x: rps)
				session.delete(x);
		}
		transaction.commit();
		session.close();
	}
	
	/*public static void main(String args[]) {
		ReportDAO rdao = new   ReportDAO();
		rdao.findMachineReportTable("o_12345736");
		
	}*/
	
	
}
