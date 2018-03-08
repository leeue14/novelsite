package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.CommentDao;
import com.leeue.novel.entity.Comment;
import com.leeue.novel.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	@Transactional
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
	}

	
	public List<Comment> queryComment(String bookId,int start,int end) {
		return commentDao.queryComment(bookId,start,end);
	}

	@Transactional
	public void deleteComment(String commentId) {
		commentDao.deleteComment(commentId);
	}

	@Override
	public List<Comment> queryAllComment() {
		return commentDao.queryAllComment();
	}


	@Override
	public int queryAllCommentByBookId(String bookId) {
		
		return commentDao.queryAllCommentByBookId(bookId);
	}

}
