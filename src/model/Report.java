package model;

import javax.persistence.*;

@Entity
@Table(name="usedmachines")
public class Report {
	@Id
	@GeneratedValue (strategy= GenerationType.AUTO)
	int usedId;
	@Column
	String MachineNo;
	@Column 
	int machineId;
	@Column
	String orderId;
	
	
	
	@Override
	public String toString() {
		return "Report [usedId=" + usedId + ", MachineNo=" + MachineNo + ", machineId=" + machineId + ", orderId="
				+ orderId + "]";
	}
	public Report() {
		super();
	}
	public Report(String machineNo, int machineId, String orderId) {
		super();
		MachineNo = machineNo;
		this.machineId = machineId;
		this.orderId = orderId;
	}
	public Report(int usedId, String machineNo, int machineId, String orderId) {
		super();
		this.usedId = usedId;
		MachineNo = machineNo;
		this.machineId = machineId;
		this.orderId = orderId;
	}
	public int getUsedId() {
		return usedId;
	}
	public void setUsedId(int usedId) {
		this.usedId = usedId;
	}
	public String getMachineNo() {
		return MachineNo;
	}
	public void setMachineNo(String machineNo) {
		MachineNo = machineNo;
	}
	public int getMachineId() {
		return machineId;
	}
	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	
	
}
