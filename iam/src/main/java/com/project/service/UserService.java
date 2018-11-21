package com.project.service;

import java.util.List;

import com.project.model.*;

public interface UserService {
	
	

	public User findByUserName(String userName);
 //public List<Employee> getAllEmployees();

	User getUserById(int userId);

	void saveOrUpdate(User user);

	String passEncoder(String pass);
 
 //public Employee getEmployeeById(int employeeId);
 
 //public void saveOrUpdate(Employee employee);
 
 //public void deleteEmployee(int employeeId);



}
