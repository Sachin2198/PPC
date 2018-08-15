package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="Requests")
public class Request {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)	
	int id;
	@Column
	String orderId;
	@Column
	String senderId;
	@Column
	String receiverId;
	@Column
	String message;
	@Column
	Date onDate;
	@Column
	int addressed;
	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
	public Request() {
		super();
	}


	public Request(int id, String orderId, String senderId, String receiverId, String message, String onDate,
			int addressed, SimpleDateFormat sdf) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.message = message;
		try {
			this.onDate = sdf.parse(onDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.addressed = addressed;
		this.sdf = sdf;
	}


	public Request(String orderId, String sender, String receiver, String message, String onDate, int addressed,SimpleDateFormat sdf) {
		
		this.orderId = orderId;
		this.senderId = sender;
		this.receiverId = receiver;
		this.message = message;
		try {
			this.onDate = sdf.parse(onDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.addressed = addressed;
		this.sdf = sdf;
	}
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}



	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getOnDate() {
		return sdf.format(onDate);
	}
	public void setOnDate(String onDate) {
		try {
			this.onDate = sdf.parse(onDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getAddressed() {
		return addressed;
	}
	public void setAddressed(int addressed) {
		this.addressed = addressed;
	}


	@Override
	public String toString() {
		return "Request [Id=" + id + ", OrderId=" + getOrderId() + ", senderId=" + senderId + ", receiverId=" + receiverId
				+ ", message=" + message + ", onDate=" + onDate + ", addressed=" + getAddressed() + ", sdf=" + sdf + "]";
	}
	

}
