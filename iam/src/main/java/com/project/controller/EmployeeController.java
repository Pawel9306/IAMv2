package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.Employee;
import com.project.model.System;
import com.project.model.User;
import com.project.service.EmployeeService;
import com.project.service.SystemService;
import com.project.service.UserService;

@Controller
@RequestMapping(value="/employee")
@ComponentScan(basePackages= {"com.project.*"})
public class EmployeeController {

 @Autowired
 EmployeeService employeeService;
 
 @Autowired
 SystemService systemService;
 
 @Autowired
 UserService userService;
 
 
//Login

	@GetMapping("/login")
	public ModelAndView login() {
	    ModelAndView view1 = new ModelAndView();
	    view1.setViewName("login");
	    return view1;
     }
	
	@GetMapping("/403")
	public ModelAndView error() {
	    ModelAndView view2 = new ModelAndView();
	    view2.setViewName("403");
	    return view2;
     }
	
	@GetMapping("/home")
	public ModelAndView view3() {
	    ModelAndView view3 = new ModelAndView();
	    view3.setViewName("home");
	    return view3;
     }
	
	@GetMapping("/hello")
	public ModelAndView view5() {
	    ModelAndView view5 = new ModelAndView();
	    view5.setViewName("hello");
	    return view5;
     }
		
	
 //Zarządzanie pracownikami
	
 @RequestMapping(value="/list", method=RequestMethod.GET)
 public ModelAndView list() {
  ModelAndView model = new ModelAndView("employee_list");
  List<Employee> employeeList = employeeService.getAllEmployees();
  model.addObject("employeeList", employeeList);
  
  return model;
 }
 
 @RequestMapping(value="/addEmployee/", method=RequestMethod.GET)
 public ModelAndView addEmployee() {
  ModelAndView model = new ModelAndView();
  
  Employee employee = new Employee();
  model.addObject("employeeForm", employee);
  model.setViewName("employee_form");
  
  return model;
 }
 //MOJE
 @RequestMapping("/account")
 public ModelAndView account(Principal principal) {
	 ModelAndView model =new ModelAndView();
	 String userName=principal.getName();
	 model.addObject("employeeForm",employeeService.getEmployeeById(userService.findByUserName(userName).getUserid()));
	 model.setViewName("employee_me");
	 return model;
 }
 
 @RequestMapping("/account/edit")
 public ModelAndView accountEdit(Principal principal) {
	 ModelAndView model =new ModelAndView();
	 String userName=principal.getName();
	 model.addObject("employeeForm",employeeService.getEmployeeById(userService.findByUserName(userName).getUserid()));
	 model.setViewName("employee_me_edit");
	 return model;
 }
 
 @RequestMapping("/accout/edit/password")
 public ModelAndView accountEditPassword(Principal principal) {
	 ModelAndView model =new ModelAndView();
	 String userName=principal.getName();
	 User userOld=userService.findByUserName(userName);
	 User userNew=new User();
	 userNew.setUserid(userOld.getUserid());
	 userNew.setUserName(userOld.getUserName());
	 userNew.setEnabled(userOld.getEnabled());
	 model.addObject("userOldObject",userOld);
	 model.addObject("userNewObject",userNew);
	 model.setViewName("employee_me_edit_password");
	 return model;
 }
 
 @RequestMapping(value="/me", method=RequestMethod.GET)
 public ModelAndView employeeMe(Employee employee) {
	 ModelAndView model=new ModelAndView();
	 
	 //Employee employee = employeeService.getEmployeeById(employeeId);
	 model.addObject("employeeForm", employee);
	 model.setViewName("employee_me");
	  
	 return model;	 
 }
 //wyświetl dane zalogowanego pracownika
 @RequestMapping(value="/me/{employeeId}", method=RequestMethod.GET)
 public ModelAndView employeeMe2(@PathVariable("employeeId") int employeeId) {
	 ModelAndView model=new ModelAndView();
	 
	 Employee employee = employeeService.getEmployeeById(employeeId);
	 model.addObject("employeeForm", employee);
	 model.setViewName("employee_me");
	  
	 return model;	 
 }
 
 @RequestMapping(value="/user/{employeeId}", method=RequestMethod.GET)
 public ModelAndView employeeInfo(@PathVariable("employeeId") int employeeId) {
	 ModelAndView model=new ModelAndView();
	 
	 Employee employee = employeeService.getEmployeeById(employeeId);
	 model.addObject("employeeForm", employee);
	 model.setViewName("employee_info");
	  
	 return model;	 
 }
 
 //KONIEC MOJEGO
 
 @RequestMapping(value="/updateEmployee/{employeeId}", method=RequestMethod.GET)
 public ModelAndView editArticle(@PathVariable int employeeId) {
  ModelAndView model = new ModelAndView();
  
  Employee employee = employeeService.getEmployeeById(employeeId);
  model.addObject("employeeForm", employee);
  model.setViewName("employee_form");
  
  return model;
 }
 
 @RequestMapping(value="/saveEmployee", method=RequestMethod.POST)
 public ModelAndView save(@ModelAttribute("employeeForm") Employee employee) {
	 employeeService.saveOrUpdate(employee);
  
  return new ModelAndView("redirect:/employee/list");
 }
 
 @RequestMapping(value="/deleteEmployee/{employeeId}", method=RequestMethod.GET)
 public ModelAndView delete(@PathVariable("employeeId") int employeeId) {
	 employeeService.deleteEmployee(employeeId);
  
  return new ModelAndView("redirect:/employee/list");
 }
 
 //Zarządzanie systemami
 
 @RequestMapping(value="/systemList", method=RequestMethod.GET)
 public ModelAndView systemList() {
  ModelAndView model = new ModelAndView("system_list");
  List<System> systemList = systemService.getAllSystems();
  model.addObject("systemList", systemList);
  
  return model;
 }
 
 @RequestMapping(value="/addSystem/", method=RequestMethod.GET)
 public ModelAndView addSystem() {
  ModelAndView model = new ModelAndView();
  
  System system = new System();
  model.addObject("systemForm", system);
  model.setViewName("system_form");
  
  return model;
 }
 
 @RequestMapping(value="/updateSystem/{sysId}", method=RequestMethod.GET)
 public ModelAndView editSystem(@PathVariable int sysId) {
  ModelAndView model = new ModelAndView();
  
  System system = systemService.getSystemById(sysId);
  model.addObject("systemForm", system);
  model.setViewName("system_form");
  
  return model;
 }
 
 @RequestMapping(value="/saveSystem", method=RequestMethod.POST)
 public ModelAndView save(@ModelAttribute("systemForm") System system) {
	 systemService.saveOrUpdate(system);
  
  return new ModelAndView("redirect:/employee/systemList");
 }
 
 @RequestMapping(value="/deleteSystem/{sysId}", method=RequestMethod.GET)
 public ModelAndView deleteSystem(@PathVariable("sysId") int sysId) {
	 systemService.deleteSystem(sysId);
  
  return new ModelAndView("redirect:/employee/systemList");
 }
 
 
 @RequestMapping(value="/accessSystem/{sysId}", method=RequestMethod.GET)
 public ModelAndView accessSystem(Principal principal, @PathVariable("sysId") int sysId) {
	 ModelAndView model =new ModelAndView();
	 String userName=principal.getName();
	 model.addObject("employeeForm",employeeService.getEmployeeById(userService.findByUserName(userName).getUserid()));
	 model.addObject("systemForm",systemService.getSystemById(sysId));
	 model.setViewName("access_system");
	 return model;
 }

 @RequestMapping(value="/accessSubmit", method=RequestMethod.POST)
 public ModelAndView saveAcces() {
  
  return new ModelAndView("redirect:/employee/systemList");
 }
 
}
