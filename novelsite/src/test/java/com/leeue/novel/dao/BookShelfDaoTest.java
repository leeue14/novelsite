package com.leeue.novel.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.BookShelf;

public class BookShelfDaoTest extends BaseTest{
	
	@Autowired
	BookShelfDao bookShelfDao;
	@Test
	public void insertBookShelfTest(){
		BookShelf bookShelf = new BookShelf();
		bookShelf.setBookId("56928442c49f3bce42b7f521");
		bookShelf.setReaderId(10L);
		bookShelf.setLink("/novelsite/bookview/bookdetail?title=第三章%20小舞麟的家&url=http://www.79xs.com/Html/Book/157/157534/36119327.html&index=3");
		bookShelf.setTitle("第asjk章 小舞麟的家");
		bookShelf.setType("玄幻");
		bookShelf.setBookName("龙王传说");
		bookShelf.setPriority(2);
		bookShelfDao.insertBookInBookShelf(bookShelf);
	}
	@Test
	public void testFindBookShelfByReaderId(){
		List<BookShelf> list = bookShelfDao.queryBookShelfsByReaderId(10L);
		System.out.println(list.size());
	}
	
	@Test
	public void testQueryBookShelfById(){
		System.out.println(bookShelfDao.queryBookShelfById("5816b415b06d1d32157790b1", 10L));
	}
	

}
