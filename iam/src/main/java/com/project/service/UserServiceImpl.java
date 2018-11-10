package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.model.Employee;
import com.project.model.User;
import com.project.repository.EmployeeRepository;
import com.project.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	
@Autowired
UserRepository userRepository;

@Override
public User getUserById(int userId) {
 return userRepository.findById(userId).get();
}


@Override
public User findByUserName(String userName) {
	User user=userRepository.findByUserName(userName);
	
	return getUserById(user.getUserid());
}
 /*
 @Autowired
 EmployeeRepository employeeRepository;

 @Override
 public List<Employee> getAllEmployees() {
  return (List<Employee>) employeeRepository.findAll();
 }

 @Override
 public Employee getEmployeeById(int employeeId) {
  return employeeRepository.findById(employeeId).get();
 }

 @Override
 public void saveOrUpdate(Employee employee) {
	 employeeRepository.save(employee);
 }

 @Override
 public void deleteEmployee(int employeeId) {
	 employeeRepository.deleteById(employeeId);
 }
 */

}
