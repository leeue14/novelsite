package com.leeue.novel.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.taglibs.standard.tag.common.fmt.FormatDateSupport;



public class DateFormat {
	
	/**
	 * 只有 2018年 1 月 1日
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static String FormatDateSupport(Date date) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String temp = sdf.format(date);
		return temp;
	}
	
	public static String FormatDateHaveSec(Date date) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String temp = sdf.format(date);
		return temp;
	}
	
	
}
