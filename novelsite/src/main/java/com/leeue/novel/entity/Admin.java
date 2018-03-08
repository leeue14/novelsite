package com.leeue.novel.entity;

/**
 * 管理员实体
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月28日 下午9:14:28
 */
public class Admin {
	private Long adminId;
	private String adminName;
	private String password;
	private int power;//
	private String email;
	public Long getAdminId() {
		return adminId;
	}
	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
