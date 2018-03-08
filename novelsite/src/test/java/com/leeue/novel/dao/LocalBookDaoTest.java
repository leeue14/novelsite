package com.leeue.novel.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Book;

/**
 * 书籍管理
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月4日 下午4:26:44
 */
public class LocalBookDaoTest extends BaseTest{
	@Autowired
	LocalBookDao localBookDao;
	@Test
	public void testInsertBook(){
		Book book = new Book();
		book.setName("武神");
		book.setAuthorId(4L);
		book.setCategoryId(1L);
		book.setShortInfo("我是测试书籍");
		book.setCat("热血崛起");
		book.setCreateTime(new Date());
		localBookDao.insertBook(book);
	}
	@Test
	public void testUpdateBook(){
		Book book = new Book();
		book.setBookId(2L);
		book.setName("我是测试书籍-书籍更新一次");
		localBookDao.updateBook(book);
	}
	@Test
	public void testQueryBook(){
		Book haveBook = new Book();
		//haveBook.setName("武神");
		haveBook.setAuthorId(4L);
		List<Book> book = localBookDao.queryBookByCondition(haveBook);
		System.out.println(book.get(0).getName());
	}
	@Test
	public void testQueryLike(){
		List<Book> books = localBookDao.queryLikeBook("2");
		for (int i = 0; i < books.size(); i++) {
			System.out.println(books.get(i));
		}
	}
	@Test
	public void testQueryById(){
		Book haveBook = new Book();
		//haveBook.setName("武神");
		haveBook.setAuthorId(4L);
		Book book = localBookDao.queryBookById(9L);
		System.out.println(book.getName());
	}
}
