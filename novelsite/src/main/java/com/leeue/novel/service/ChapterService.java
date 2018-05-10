package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Chapter;

public interface ChapterService {
	/**
	 * 插入一个章节
	 * 
	 * @param chapter
	 * @return
	 */
	int insertChapter(Chapter chapter);

	/**
	 * 删除章节
	 * 
	 * @param chapterId
	 * @return
	 */
	int deleteChapter(@Param("chapterId") Long chapterId);

	/**
	 * 更新章节
	 * 
	 * @param chapterId
	 * @return
	 */
	int updateChapter(Chapter chapter);

	/**
	 * 查找章节
	 * 
	 * @param chapterId
	 * @return
	 */
	Chapter findChapter(Long chapterId);

	/**
	 * 根据bookId 查找所有章节
	 */
	List<Chapter> findAllChapters(Long bookId,int status);
	
	/**
	 * 查找总的章节数
	 */
	Integer findAllChaptersCount(Long bookId,int status);
	
	/**
	 * 查找最新更新的章节
	 * @return
	 */
	List<Chapter> findUpdateChapters();
}
