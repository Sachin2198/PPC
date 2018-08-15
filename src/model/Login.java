package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class Login {
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	int id;
	@Column
	String UserName;
	@Column
	String password;
	@Column
	String roleName;
	
	public Login() {
		super();
	}
	
	
	public Login(String userName, String password, String roleName) {
		super();
		UserName = userName;
		this.password = password;
		this.roleName = roleName;
	}

	public Login(int id, String userName, String password, String roleName) {
		super();
		this.id = id;
		UserName = userName;
		this.password = password;
		this.roleName = roleName;
	}
	
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		this.UserName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	
}
