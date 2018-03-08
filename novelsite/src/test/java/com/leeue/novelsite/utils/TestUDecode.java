package com.leeue.novelsite.utils;

import java.io.UnsupportedEncodingException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.leeue.novel.utils.HttpUrl;
import com.leeue.novel.utils.RegexUtil;

public class TestUDecode {
	
	@Test
	public void testUDCodeUrl() throws UnsupportedEncodingException{
		/*String url = "http://vip.zhuishushenqi.com/chapter/56f8da09176d03ac1983f6d7?cv=1500450747394";
		String url2 = "http://vip.zhuishushenqi.com/chapter/56f8da09176d03ac1983f6d7?cv=1500450747394";//可以
		String url3 = "http://www.xiaoxiaoshuwu.com/shtml/208/208546/24399060.shtml";
	
		String url4 = "http://book.my716.com/getBooks.aspx?method=content&bookId=872129&chapterFile=U_872129_201707191552221765_5429_2.txt";
		if(url4.contains("&")){
			String encodeUrl = HttpUrlEncode.encode((url4.replace("&", "*")));
			System.out.println("url4"+encodeUrl.replace("*", "&"));
		}*/
		System.out.println(HttpUrl.encode("http://www.biquge.la/book/16431/6658470.html"));
		
	}
	
	
	@Test
	public void testEmail(){
		System.out.println(RegexUtil.testEmail("1264308633@qq.com"));
	}
	@Test
	public void testPassword(){
		System.out.println(RegexUtil.testPassword("l13966435312l"));
	}
}
