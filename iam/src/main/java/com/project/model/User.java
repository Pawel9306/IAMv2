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
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="USERID_PK")
	private int userId;
	@Column(name="USERID")
	private String userName;
	@Column(name="password")
	private String password;
	@Column(name="enabled")	
	private short enabled;
	
	public User(){
	
	}

	public User(User user) {
		this.userId = user.userId;
		this.userName = user.userName;
		this.password = user.password;
		this.enabled=user.enabled;
	}
	
	public int getUserid() {
		return userId;
	}
	public void setUserid(int userid) {
		this.userId = userid;
    }	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public short getEnabled() {
		return enabled;
	}
	public void setEnabled(short enabled) {
		this.enabled = enabled;
	}
} 