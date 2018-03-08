package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Comment;

public interface CommentService {
	/**
	 * 增加评论 根据book_id
	 */
	public void insertComment(Comment comment);
	/**
	 * 根据book_id查询评论
	 */
	public List<Comment> queryComment(@Param("bookId") String bookId,int start, int end);
	
	/**
	 * 删除评论 id
	 */
	public void deleteComment(@Param("commentId") String commentId);
	
	/**
	 * 查询所有的评论
	 */
	public List<Comment> queryAllComment();
	
	/**
	 * 查询所有评论数目 根据bookId
	 * @return
	 */
	public int queryAllCommentByBookId(String bookId);
}
