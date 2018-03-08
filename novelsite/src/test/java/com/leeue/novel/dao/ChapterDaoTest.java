package com.leeue.novel.dao;

import java.text.ParseException;
import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.BaseTest;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.utils.DateFormat;
/**
 * 章节测试
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月13日 下午2:43:19
 */
public class ChapterDaoTest extends BaseTest{
	@Autowired
	ChapterDao chapterDao;
	
	@Test
	public void testInsertChapter(){
		Chapter chapter = new Chapter();
		chapter.setBookId(9L);
		chapter.setChapterName("第四章 人生如雪");
		chapter.setBody("我是第四章哈，这个是我测试的文章主体我是"
				+ "一个好人哈，这个是我测试的文章主体我是一个好人哈，这个是我测试的"
				+ "文章主体我是一个好人哈，这个是我测试的文章主体我是一个好人哈，这个是我测试的文章主体");
		chapter.setChapterNum(2L);
		try {
			chapter.setUploadTime(DateFormat.FormatDateSupport(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		chapterDao.insertChapter(chapter);
	}
	@Test
	public void testDeleteChapter(){
		chapterDao.deleteChapter(4L);
	}
	@Test
	public void testUpdateChapter(){
		Chapter chapter = new Chapter();
		chapter.setBookId(9L);
		chapter.setChapterName("第二章 哈55哈大法");
		chapter.setBody("我是第溜溜6666章哈，这个是我测试的文章主体我是"
				+ "一个好人哈，这个是我测试的文章主体我是一个好人哈，这个是我测试的"
				+ "文章主体我是一个好人哈，这个是我测试的文章主体我是一个好人哈，这个是我测试的文章主体");
		chapter.setChapterNum(3L);
		try {
			chapter.setUploadTime(DateFormat.FormatDateSupport(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chapter.setChapterId(2L);
		chapterDao.updateChapter(chapter);
	}
	@Test
	public void testFindChapter(){
		System.out.println(chapterDao.findChapter(1L).getBody());
	}
	@Test
	public void testFindAllChapter(){
		System.out.println((chapterDao.findAllChapters(9L,0)).size());
	}
	@Test
	public void testFindChaptersCount(){
		System.out.println(chapterDao.findAllChaptersCount(9L,0));
	}
}
