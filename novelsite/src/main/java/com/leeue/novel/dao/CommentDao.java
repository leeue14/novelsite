package com.leeue.novel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Comment;

/**
 * 评论实体的dao
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午3:34:38
 */
public interface CommentDao {
	/**
	 * 增加评论 根据book_id
	 */
	public void insertComment(Comment comment);
	/**
	 * 根据book_id查询评论
	 */
	public List<Comment> queryComment(@Param("bookId") String bookId,@Param("start")int start,@Param("end")int end);
	
	/**
	 * 删除评论 id
	 */
	public void deleteComment(@Param("commentId") String commentId);
	
	/**
	 * 查询所有的评论
	 */
	public List<Comment> queryAllComment();
	/**
	 * 查询book所有评论数目
	 */
	public int queryAllCommentByBookId(@Param("bookId") String bookId);
	
}
