package com.project.model;

import javax.persistence.*;

@Entity
@Table(name="user_roles")
public class UserRole {

@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name="user_role_id")
private int userroleid;

@Column(name="userid")
private int  userid;

@Column(name="role")
private String role; 

public String getRole() {
return role;
}

public void setRole(String role) {
this.role = role;
}

public int getUserid() {
return userid;
}

public void setUserid(int userid) {
this.userid = userid;
}

public int getUserroleid() {
return userroleid;
}

public void setUserroleid (int userroleid) {
	this.userroleid = userroleid;

}

}
