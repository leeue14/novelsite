package com.leeue.novel.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Admin;

/**
 * 后台系统管理员dao
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月28日 下午9:13:32
 */
public interface AdminDao {
	
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
