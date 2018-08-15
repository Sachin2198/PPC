package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;


@Entity
@Table(name="mytask")
public class MyTask {
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	int taskId;
	@Column
	String taskName;
	@Column
	Date startDate;
	@Column
	Date endDate;
	@Column
	String machineNo;
	@Column
	String orderId;
	@Transient
	SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
	
		
	public MyTask() {
		super();
	}





	public MyTask( int taskId,String machineNo,SimpleDateFormat sdf,String orderId, String startdate, String enddate)
	{	this.taskId=taskId;
		taskName = machineNo + " : " + orderId;
		
//		
		this.machineNo = machineNo;
		this.orderId = orderId;
		 try {
				this.startDate=sdf.parse(startdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 try {
				this.endDate=sdf.parse(enddate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		this.sdf =sdf;
		
		
	}


	


	public int getTaskId() {
		return taskId;
	}


	public void setTaskId(int taskId) {
		this.taskId =taskId;
	}


	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getStartDate() {
		return sdf.format(startDate);
	}

	public void setStartDate(String startDate) {
		try {
			this.startDate =sdf.parse(startDate);
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
			this.endDate =sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}





	@Override
	public String toString() {
		return "MyTask [taskId=" + taskId + ", taskName=" + taskName + ", startDate=" + startDate + ", endDate="
				+ endDate + ", machineNo=" + machineNo + ", orderId=" + orderId + ", sdf=" + sdf + "]";
	}


	
}
