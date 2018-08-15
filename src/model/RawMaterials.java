package model;

import javax.persistence.*;


@Entity
@Table(name="rawMaterial")
public class RawMaterials {
	
@Id
@GeneratedValue(strategy= GenerationType.AUTO)
int rawId;
@Column
String rawNo;
@Column
String rawName;
@Column
int rawQuantity;
@Column
String rawUnit;
@Column
String orderId;

public RawMaterials() {
	super();
}

public RawMaterials(int rawId, String rawNo, String rawName, int rawQuantity, String rawUnit, String orderId) {
	super();
	this.rawId = rawId;
	this.rawNo = rawNo;
	this.rawName = rawName;
	this.rawQuantity = rawQuantity;
	this.rawUnit = rawUnit;
	this.orderId = orderId;
}

public RawMaterials(String rawNo, String rawName, int rawQuantity, String rawUnit, String orderId) {
	super();
	this.rawNo = rawNo;
	this.rawName = rawName;
	this.rawQuantity = rawQuantity;
	this.rawUnit = rawUnit;
	this.orderId = orderId;
}

public int getRawId() {
	return rawId;
}




public void setRawId(int rawId) {
	this.rawId = rawId;
}




public String getRawNo() {
	return rawNo;
}




public void setRawNo(String rawNo) {
	this.rawNo = rawNo;
}

public String getRawName() {
	return rawName;
}

public void setRawName(String rawName) {
	this.rawName = rawName;
}


public int getRawQuantity() {
	return rawQuantity;
}

public void setRawQuantity(int rawQuantity) {
	this.rawQuantity = rawQuantity;
}


public String getRawUnit() {
	return rawUnit;
}


public void setRawUnit(String rawUnit) {
	this.rawUnit = rawUnit;
}


public String getOrderId() {
	return orderId;
}

public void setOrderId(String orderId) {
	this.orderId = orderId;
}

}

