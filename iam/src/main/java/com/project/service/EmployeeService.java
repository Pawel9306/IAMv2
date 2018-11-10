package com.project.service;

import java.util.List;

import com.project.model.*;

public interface EmployeeService {

 public List<Employee> getAllEmployees();
 
 public Employee getEmployeeById(int employeeId);
 
 public void saveOrUpdate(Employee employee);
 
 public void deleteEmployee(int employeeId);


}
