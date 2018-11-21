package com.project.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.ComponentScan;


@ComponentScan(basePackages= {"com.project.*"})
@Entity
@Table(name="TUSERID")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="USERID_PK")
	private int userId;
	@Column(name="USERID")
	private String userName;
	@Column(name="TEMP_PK")
	private int tempPK;
	@Column(name="password")
	private String password;
	@Column(name="role")
	private String role;
	@Column(name="enabled")	
	private int enabled;
	


	public User(){
	
	}

	public User(User user) {
		this.userId = user.userId;
		this.userName = user.userName;
		this.tempPK=user.tempPK;
		this.password = user.password;
		this.role=user.role;
		this.enabled=user.enabled;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
    }	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getTempPK() {
		return tempPK;
	}
	public void setTempPK(int tempPK) {
		this.tempPK = tempPK;
    }	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	
} 