package com.project.iam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class })
@ComponentScan("com.project.*")
@EntityScan("com.project.model")
@EnableJpaRepositories("com.project.repository")
public class IamApplication {

	public static void main(String[] args) {
		SpringApplication.run(IamApplication.class, args);
		
	}
	
	@RequestMapping("/employee/list")
	public String employee_list(){
	    return "employee_list";
	}

	@RequestMapping("/employee/addEmployee")
	public String employee_form(){
	    return "employee_form";
	}
}
