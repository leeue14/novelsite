package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Admin;

public interface AdminService {
	
	/**
	 * 增加管理员
	 */
	void insertAdmin(Admin admin);
	
	/**
	 * 删除管理员
	 */
	void deleteAdmin(@Param("adminId")Long adminId);
	
	/**
	 * 查找管理员
	 */
	Admin findAdmin(@Param("email")String email);
	
	/**
	 * 修改管理员权限
	 */
	void editAdminPower(Admin admin);
	
	/**
	 * 查找所有的管理员
	 * @return
	 */
	List<Admin> findAdmins();
}
