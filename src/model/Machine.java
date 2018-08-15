package model;

import javax.persistence.*;
@Entity
@Table(name="MachineInfo")
public class Machine {
	@Id 
	@GeneratedValue (strategy=GenerationType.AUTO)
	int id;
	@Column
	String machineNo;
	@Column
	String nameOfMachine;
	@Column
	int quantityOfMachine;
	
	
	
	
	@Override
	public String toString() {
		return "Machine [id=" + id + ", machineNo=" + machineNo + ", nameOfMachine=" + nameOfMachine
				+ ", quantityOfMachine=" + quantityOfMachine + "]";
	}
	public Machine() {
		super();
	}
	public Machine(String machineNo, String nameOfMachine, int quantityOfMachine) {
		super();
		this.machineNo = machineNo;
		this.nameOfMachine = nameOfMachine;
		this.quantityOfMachine = quantityOfMachine;
	}
	public Machine(int id, String machineNo, String nameOfMachine, int quantityOfMachine) {
		super();
		this.id = id;
		this.machineNo = machineNo;
		this.nameOfMachine = nameOfMachine;
		this.quantityOfMachine = quantityOfMachine;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameOfMachine() {
		return nameOfMachine;
	}
	public void setNameOfMachine(String nameofMachine) {
		this.nameOfMachine = nameofMachine;
	}
	
	public int getQuantityOfMachine() {
		return quantityOfMachine;
	}

	public void setQuantityOfMachine(int i) {
		this.quantityOfMachine = i;
	}
	public String getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(String machineNo) {
		this.machineNo = "m_"+machineNo+(int) (Math.random()*999);
	}
	
	
}
