package com.leeue.novel.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.ReaderDao;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.ReaderService;

@Service
public class ReaderServiceImpl implements ReaderService {

	@Autowired
	ReaderDao readerDao;
	@Transactional
	public int insertReader(Reader reader) {
		return readerDao.insertReader(reader);
	}

	@Transactional
	public int updateReader(Reader reader) {
		return readerDao.updateReader(reader);
	}

	@Override
	public Reader queryReader(String emailAndPhone) {
		return readerDao.queryReader(emailAndPhone);
	}

	@Override
	public List<Reader> queryAllReader(Reader reader) {
	
		return readerDao.queryAllReader(reader);
	}

	@Override
	public List<Reader> queryReaderByPage(int start, int end ,@Param("reader") Reader reader) {
		
		return readerDao.queryReaderByPage(start, end,reader);
	}

	@Override
	public int deleteReader(Long readerId) {
		
		return readerDao.deleteReader(readerId);
	}

}
