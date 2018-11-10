package com.project.service;

import java.util.List;

import com.project.model.System;

public interface SystemService {

 public List<System> getAllSystems();
 
 public System getSystemById(int sysId);
 
 public void saveOrUpdate(System system);
 
 public void deleteSystem(int sysId);
}
