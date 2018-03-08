package com.leeue.novel.entity;

import java.util.Date;

/**
 * 读者实体类
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月16日 上午12:30:31
 */
public class Reader {
	private Long readerId;
	private String nickName;
	private String createTime;
	private String email;
	private String password;
	private int sex; //  0 表示女 1 表示男
	private String shortInfo;
	private int recommendTicket;
	private Date lastLoginTime;
	private int grade;//用户等级
	private int fansCount;//粉丝值
	private int point;//积分
	private int status;//0 表示不可用 1表示可用
	public Long getReaderId() {
		return readerId;
	}
	public void setReaderId(Long readerId) {
		this.readerId = readerId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getShortInfo() {
		return shortInfo;
	}
	public void setShortInfo(String shortInfo) {
		this.shortInfo = shortInfo;
	}
	public int getRecommendTicket() {
		return recommendTicket;
	}
	public void setRecommendTicket(int recommendTicket) {
		this.recommendTicket = recommendTicket;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getFansCount() {
		return fansCount;
	}
	public void setFansCount(int fansCount) {
		this.fansCount = fansCount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Reader [readerId=" + readerId + ", nickName=" + nickName
				+ ", createTime=" + createTime + ", email=" + email
				+ ", password=" + password + ", sex=" + sex + ", shortInfo="
				+ shortInfo + ", recommendTicket=" + recommendTicket
				+ ", lastLoginTime=" + lastLoginTime + ", grade=" + grade
				+ ", fansCount=" + fansCount + ", point=" + point + ", status="
				+ status + "]";
	}
	
	
}
