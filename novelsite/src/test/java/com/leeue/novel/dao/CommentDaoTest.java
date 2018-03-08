package com.leeue.novel.dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Comment;
import com.leeue.novel.utils.DateFormat;

/**
 * 评论类的测试
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午3:49:56
 */
public class CommentDaoTest extends BaseTest{
	
	@Autowired
	CommentDao commentDao;
	
	@Test
	public void testInsertComment(){
		List<Comment> comments = commentDao.queryAllComment();
		
		Comment comment = new Comment();
		comment.setPriority(comments.size());
		comment.setBookId("12");
		comment.setReaderId(10L);
		comment.setNickName("战神小金刚");
		comment.setBody("我就是喜欢这本书，你能把我怎么样，---------------------测试评论");
		try {
			comment.setDate(DateFormat.FormatDateHaveSec(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		comment.setBookName("圣墟");
		commentDao.insertComment(comment);
	}
	
	@Test
	public void testQueryComment(){
		List<Comment> comments = commentDao.queryComment("12",1,2);
		System.out.println(comments.size());
	}

}
