package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.model.System;
import com.project.repository.SystemRepository;

@Service
@Transactional
public class SystemServiceImpl implements SystemService {
 
 @Autowired
 SystemRepository SystemRepository;

 @Override
 public List<System> getAllSystems() {
  return (List<System>) SystemRepository.findAll();
 }

 @Override
 public System getSystemById(int sysId) {
  return SystemRepository.findById(sysId).get();
 }

 @Override
 public void saveOrUpdate(System system) {
	 SystemRepository.save(system);
 }

 @Override
 public void deleteSystem(int sysId) {
	 SystemRepository.deleteById(sysId);
 }

}
