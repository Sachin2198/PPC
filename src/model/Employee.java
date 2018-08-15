package model;


import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="UserDetails")
public class Employee {
	@Column(unique=true)
	private String name ;
	@Column
	private String gender;
	@Column
	private Date dob;
	@Column
	private String addr;
	@Column
	private String email;
	@Column
	private String phoneNo;
	@Column
	public String role;
	@Id
	protected String userId;
	
	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public Employee()
	{
		
		 super();
	}
	
	
	

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId=userId;
	}

	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getDob() {
		return sdf.format(dob);
	}


	public void setDob(String dob) {
		try {
			this.dob = sdf.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(String l) {
		this.phoneNo = l;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Employee(String n,String gen,String dob,String addr,String email,String phone,String role ,SimpleDateFormat sdf)
	{
		 this();
		 this.name =n ;
		 this.gender=gen;
		 try {
			this.dob=sdf.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 this.addr=addr;
		 this.email=email;
		 this.phoneNo=phone;
	     this.role=role;
	     this.sdf=sdf;
			
	}
	
	@Override
	public String toString() {
		return "PlanningManager [name=" +getName()+ ", gender=" + getGender() + ", dob=" + getDob() + ", addr=" + getAddr() + ", email="
				+ getEmail() + ", phoneNo=" + getPhoneNo() + ", role=" + getRole() + ", userId=" + getUserId() + "]";
	}
	
	
}
