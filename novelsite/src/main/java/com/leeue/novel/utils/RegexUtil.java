package com.leeue.novel.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtil {
	/**
	 * 验证邮箱是否输入正确
	 * @param email
	 * @return
	 */
	public static boolean testEmail(String email){
		String regex = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
		if(email.matches(regex)){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 验证密码
	 */
	public static boolean testPassword(String password){
		//密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
		String regex = "^[a-zA-Z]\\w{5,17}$";
		if(password.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 验证身份证号码
	 */
	public static boolean testIDcard(String idCard){
		//密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
		String regex = "^(\\d{14}|\\d{17})(\\d|[xX])$";
		if(idCard.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 昵称验证  ^[\u4E00-\u9FA5A-Za-z0-9_]+$
	 */
	public static boolean testPenName(String penName){
		//要求昵称不能包含特殊字符，2-8中文
		String regex = "[\u4e00-\u9fa5]{2,8}$";
		if(penName.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 姓名正则^[\u4E00-\u9FA5A-Za-z]+$
	 */
	public static boolean testName(String name){
		//
		String regex = "^[\u4E00-\u9FA5A-Za-z]+$";
		if(name.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * qq号码 [1-9][0-9]{4,14}
	 */
	public static boolean testQQnum(String qqNum){
		//
		String regex = "^[1-9][0-9]{4,9}$";
		if(qqNum.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 手机号码  ^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$
	 */
	public static boolean testPhone(String phone){
		//
		String regex = "^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$";
		if(phone.matches(regex)){
			return true;
		}else {
			return false;
		}
	}
}
