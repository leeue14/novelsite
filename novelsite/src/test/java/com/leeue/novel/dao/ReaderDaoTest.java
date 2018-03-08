package com.leeue.novel.dao;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.utils.DateFormat;

public class ReaderDaoTest extends BaseTest{
	@SuppressWarnings("deprecation")
	@Autowired
	ReaderDao readerDao;
	@Test
	public void insertReaderTest() throws ParseException, InterruptedException{
			long i = 1264308640;
			Reader reader = new Reader();
			reader.setCreateTime(DateFormat.FormatDateHaveSec(new Date()));
			reader.setNickName("无聊"+(i-126308632));
			reader.setEmail(i+"@foxmail.com");
			reader.setPassword("15466878945");
			reader.setShortInfo("我是一个好人啊");
			readerDao.insertReader(reader);
	}
	
	@Test
	public void updateReaderTest(){
		Reader reader = new Reader();
		reader.setReaderId(10L);
		reader.setNickName("战神小金刚");
		readerDao.updateReader(reader);
	}
	
	@Test
	public void queryReaderTest(){
		Reader testReader = new Reader();
		testReader.setEmail("1264308635@qq.com");
		testReader.setPassword("ly13976435312");
		Reader reader = readerDao.queryReader(testReader.getEmail());
		System.out.println(reader.getEmail());
	}
	
	@Test
	public void deleteReaderTest(){
		Reader reader = readerDao.queryReader("1264308640@qq.com");
		reader.setStatus(0);
		System.out.println(reader);
		readerDao.updateReader(reader);
	}
}
