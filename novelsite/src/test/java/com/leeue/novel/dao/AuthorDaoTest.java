package com.leeue.novel.dao;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Author;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.utils.DateFormat;

public class AuthorDaoTest extends BaseTest{
	@SuppressWarnings("deprecation")
	@Autowired
	AuthorDao authorDao;
	@Test
	public void insertAuthorTest() throws ParseException, InterruptedException{
			Author author = new Author();
			author.setReaderId(16L);
			author.setPenName("李飞侠");
			author.setRealName("李五");
			author.setHomeAddr("安徽省合肥市");
			author.setPhone("18081141953");
			author.setIdCard("340823199504173114");
			author.setQqNum("1264308835");
			author.setShortInfo("我是一个业余好人");
			author.setCreateTime(DateFormat.FormatDateSupport(new Date()));
			authorDao.insertAuthor(author);
	}
	@Test
	public void updateAuthorTest(){
		Author author = new Author();
		author.setReaderId(5L);
		author.setHomeAddr("安徽省北京市");
		author.setPhone("18081141953");
		author.setQqNum("1264308835");
		author.setShortInfo("我是一个业余好人");
		authorDao.updateAuthor(author);
	}
	@Test
	public void queryAuthorByReaderid(){
		Author author = authorDao.queryAuthorById(5L);
		System.out.println(author.getPenName());
	}
	
	@Test
	public void queryAuthorByIdCard(){
		Author author = authorDao.queryAuthorIdCard("340823199504173114");
		System.out.println(author.getIdCard());
	}
	
/*	@Test
	public void updateReaderTest(){
		Reader reader = new Reader();
		reader.setReaderId(10L);
		reader.setNickName("战神小金刚");
		readerDao.updateReader(reader);
	}
	
	@Test
	public void queryReaderTest(){
		Reader reader = readerDao.queryReader("1264308633@qq.com");
		System.out.println(reader.getCreateTime());
	}
	
	@Test
	public void deleteReaderTest(){
		Reader reader = readerDao.queryReader("1264308640@qq.com");
		reader.setStatus(0);
		System.out.println(reader);
		readerDao.updateReader(reader);
	}*/
}
