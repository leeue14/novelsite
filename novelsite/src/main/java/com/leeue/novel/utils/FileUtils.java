package com.leeue.novel.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.leeue.novel.entity.Book;

public class FileUtils {
	
	
	public static String loadNovelCover(InputStream coverFile,String format,Book book){
		File loadFilePath = new File("D://novelCover//date//bookId//"+book.getBookId());
		InputStream ins = coverFile;
		OutputStream out = null;
	
		try {
			if(!loadFilePath.exists()){//判断这个文件目录是否存在
				loadFilePath.mkdirs();//创建这个目录
			}
			File loadFile = new File(loadFilePath+"//"+book.getBookId()+"."+format);
			out = new FileOutputStream(loadFile);
			byte[] b = new byte[1024];
			int n = 0;
			while((n = ins.read(b))!= - 1){
				out.write(b, 0, n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ins.close();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return loadFilePath.getAbsolutePath().toString();
	}
	
	public static void main(String[] args){
		Book book = new Book();
		book.setBookId(10L);
	//	System.out.println(loadNovelCover("D:\\bookCover.jpg",book));
	}
}
