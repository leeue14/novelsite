package com.leeue.novel.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * 判断验证码是否输入正确
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月17日 下午2:49:14
 */
public class CodeUtils {
	/**
	 * 判断验证码
	 * @param request
	 * @return
	 */
	public static boolean checkVerifyCode(HttpServletRequest request) {
		String verifyCodeExpected = (String) request.getSession().getAttribute(
				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);//获取图片验证码
		
		String verifyCodeActual = HttpServletRequestUtil.getString(request, "verifyCodeActual");
		System.out.println(verifyCodeActual);
		if(verifyCodeActual == null || !verifyCodeActual.equalsIgnoreCase(verifyCodeExpected)){
			return false;
		}else {
			return true;
		}
	}
}
