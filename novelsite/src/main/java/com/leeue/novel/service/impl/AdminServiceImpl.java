package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.AdminDao;
import com.leeue.novel.entity.Admin;
import com.leeue.novel.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	@Transactional
	public void insertAdmin(Admin admin) {
		adminDao.insertAdmin(admin);
		
	}

	@Transactional
	public void deleteAdmin(Long adminId) {
		adminDao.deleteAdmin(adminId);
		
	}

	@Override
	public Admin findAdmin(String email) {
		
		return adminDao.findAdmin(email);
	}

	@Transactional
	public void editAdminPower(Admin admin) {
		
		adminDao.editAdminPower(admin);
	}

	@Override
	public List<Admin> findAdmins() {
	
		return adminDao.findAdmins();
	}

}
