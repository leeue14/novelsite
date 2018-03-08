package com.leeue.novel.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Category;

public class CategoryDaoTest extends BaseTest{
	@Autowired
	CategoryDao categoryDao;
	
	@Test
	public void testQueryCategory(){
		
		List<Category> categories = categoryDao.queryCategory(1L);
		for(int i = 0; i < categories.size(); i++){
			System.out.println((categories.get(i).getCategoryName()));
		}
	}
}
