package com.leeue.novel.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Admin;


public class AdminDaoTest extends BaseTest{
	
	
	@Autowired
	AdminDao admindao;
	
	@Test
	public void insertTest(){
		Admin admin = new Admin();
		admin.setAdminName("966琴");
		admin.setEmail("1547894563@qq.com");
		admin.setPassword("123456789");
		admin.setPower(1);
		admindao.insertAdmin(admin);
	}
	
	@Test
	public void testFindAdmin(){
		System.out.println(admindao.findAdmin("1264308633@qq.com"));
	}
	@Test
	public void testEditAdminPower(){
		Admin admin = new Admin();
		admin.setAdminId(2L);
		admin.setAdminName("许嵩");
		admin.setEmail("1264307633@qq.com");
		admin.setPassword("123456789");
		admin.setPower(2);
		admindao.editAdminPower(admin);
	}
}
