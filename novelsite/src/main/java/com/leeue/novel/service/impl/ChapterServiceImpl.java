package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.ChapterDao;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.service.ChapterService;

@Service
public class ChapterServiceImpl implements ChapterService{

	@Autowired
	ChapterDao chapterDao;
	
	@Transactional
	public int insertChapter(Chapter chapter) {
		return chapterDao.insertChapter(chapter);
	}

	@Transactional
	public int deleteChapter(Long chapterId) {
		return chapterDao.deleteChapter(chapterId);
	}

	@Transactional
	public int updateChapter(Chapter chapter) {
		return chapterDao.updateChapter(chapter);
	}

	public Chapter findChapter(Long chapterId) {
		return chapterDao.findChapter(chapterId);
	}


	public List<Chapter> findAllChapters(Long bookId,int status) {
		return chapterDao.findAllChapters(bookId,status);
	}

	@Override
	public int findAllChaptersCount(Long bookId,int status) {
		return chapterDao.findAllChaptersCount(bookId,status);
	}
	
}
