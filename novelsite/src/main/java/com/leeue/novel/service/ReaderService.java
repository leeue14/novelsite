package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Reader;

public interface ReaderService {
	/**
	 * 插入新读者
	 * @param reader
	 * @return
	 */
	int insertReader(Reader reader);
	/**
	 * 跟新读者信息
	 * @param reader
	 * @return
	 */
	int updateReader(Reader reader);
	/**
	 * 删除读者 停用 将status置为0
	 * @param reader
	 * @return
	 */
	int deleteReader(@Param("readerId") Long readerId);//停用 某个读者不是删除
	/**
	 * 查找读者
	 * @param emailAndPhone
	 * @return
	 */
	Reader queryReader(@Param("emailAndPhone")String emailAndPhone);//查找
	
	
	List<Reader> queryAllReader(@Param("reader") Reader reader);
	
	List<Reader> queryReaderByPage(@Param("start") int start, @Param("end") int end, @Param("reader") Reader reader);
}
