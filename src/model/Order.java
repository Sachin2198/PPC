package model;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;
@Entity
@Table(name="Orders")
public class Order {
	@Column
	String managerId;
	@Id
	String orderId;
	@Column
	String nameOfProject;
	@Column
	Date startDate;
	@Column
	Date endDate;
	
	@Column
	String company;
	@Column
	int quantity;
	@Column
	String supervisor;
	@Column
	String allocated;
	@Column
	int manpower;
	@Column
	Date deadline;
	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public Order() {
		super();
		
	}

	
	
	public Order(String managerId, String orderId, String nameOfProject, String startDate, String endDate, String company,
			int quantity, String supervisor, String allocated, int manpower, String deadline,SimpleDateFormat sdf) {
		super();
		this.managerId = managerId;
		this.orderId ="o_"+ orderId;
		this.nameOfProject = nameOfProject;
		try {
			this.startDate = sdf.parse(startDate);
			this.endDate =  sdf.parse(endDate);
			this.deadline =  sdf.parse(deadline);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.company = company;
		this.quantity = quantity;
		this.supervisor =supervisor;
		this.allocated = allocated;
		this.manpower = manpower;
		
	}


	

	/*public void setOrders(String managerId,String orderId,String allocated,String nameOfproject,String endDate,String company,int quantity,String unit,String suprervisorId,int manpower) throws ParseException
	{
		this.managerId=managerId;
		this.orderId=orderId;
		this.nameOfProject=nameOfproject;
		this.company=company;
		this.quantity=quantity;
		this.unit=unit;
		this.supervisor=suprervisorId;
		this.allocated=allocated;
		this.manpower=manpower;
	}*/


	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId ="o_"+ orderId+(int)(Math.random()*999);
	}
	public String getNameOfProject() {
		return nameOfProject;
	}
	public void setNameOfProject(String nameOfProject) {
		this.nameOfProject = nameOfProject;
	}
	public String getStartDate() {
		return sdf.format(startDate);
	}
	public void setStartDate(String startDate) {
		try {
			this.startDate = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getEndDate() {
		return sdf.format(endDate);
	}
	public void setEndDate(String endDate) {
		try {
			this.endDate = sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	public String getAllocated() {
		return allocated;
	}
	public void setAllocated(String allocated) {
		this.allocated = allocated;
	}
	public int getManpower() {
		return manpower;
	}
	public void setManpower(int manpower) {
		this.manpower = manpower;
	}
	public String getDeadline() {
		return sdf.format(deadline);
	}
	public void setDeadline(String deadline) {
		try {
			this.deadline = sdf.parse(deadline);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		
}
