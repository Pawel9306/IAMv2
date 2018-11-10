package com.project.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.model.Employee;

public interface EmployeeRepository extends CrudRepository<Employee, Integer> {


}
