package com.leeue.novel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Chapter;

/**
 * 对文章来管理
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月13日 下午2:15:41
 */
public interface ChapterDao {
	/**
	 * 插入一个章节
	 * @param chapter
	 * @return
	 */
	int insertChapter(Chapter chapter);
	/**
	 * 删除章节
	 * @param chapterId
	 * @return
	 */
	int deleteChapter(@Param("chapterId") Long chapterId);
	/**
	 * 更新章节
	 * @param chapterId
	 * @return
	 */
	int updateChapter(Chapter chapter);
	/**
	 * 查找章节
	 * @param chapterId
	 * @return
	 */
	Chapter findChapter(Long chapterId);
	
	/**
	 * 根据bookId 查找所有章节
	 */
	List<Chapter> findAllChapters(@Param("bookId")Long bookId,@Param("status")int status);
	
	/**
	 * 查找总的章节数
	 */
	int findAllChaptersCount(@Param("bookId")Long bookId,@Param("status")int status);
	
}
