<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>作者注册</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/authorlogin/authorlogin.css">


</head>

<body>
	<div class="wrap login">
		<div class="header">
			<div class="headBox pageCenter clearfix">
				<a href="javascript:0;"><img class="logo fl"
					src="https://img1.write.qq.com/writer/p1/contentv2/logo.png"
					width="225" height="28" alt="阅文·作家专区"></a>
				<div class="headUser fr">
					<a class="exit" href="/novelsite/indexview/index"><span class="icon"></span>退出登录</a>
				</div>
			</div>
		</div>
		<div class="registWrap pageCenter" style="    background: #F9F9F9;">
			<div class="applyForm">
				<div style="width: 550px; text-align: center;">
					<h3 style="color: #59Aeff;font-size: 20px;">注册作者</h3>
				</div>
				<ul style="">
					<li><em>笔名</em> <input class="midInput" id="penName"
						name="penName" type="text">
						<p data-node="tip" class="tip">笔名不能包含特殊字符，2-8中文</p></li>
					<li><em>真实姓名</em> <input class="midInput" id="realName"
						name="realName" type="text">
						<p data-node="tip" class="tip">请填写真实的姓名</p></li>
					<li><em>身份号码</em> <input class="midInput" id="idCard"
						name="idCard" type="text">
						<p data-node="tip" class="tip">请输入您的证件号码</p></li>
					<li><em>手机号码</em> <input class="midInput" id="phone"
						name="phone" type="text">
						<p data-node="tip" class="tip">请填写常用的手机号码</p></li>
					<li><em>电子邮箱</em> <input class="midInput" id="email"
						name="email" type="text">
						<p data-node="tip" class="tip">请填写常用的邮箱，便于编辑快速联系到您</p></li>
					<li><em>QQ号</em> <input class="midInput" id="qqNum"
						name="qqNum" type="text">
						<p data-node="tip" class="tip">请填写常用的QQ</p></li>
					<li><em>个人简介</em> <input class="midInput" id="shorInfo"
						name="" shorInfo"" type="text">
						<p data-node="tip" class="tip">请填写一句话，让读者可以记住</p></li>
					<li><em>验证码</em> <img type="captcha_img" alt="点击更换"
						title="点击更换" onclick="changeVerifyCode(this)"
						src="/novelsite/Kaptcha" style="height: 35px;cursor:pointer;">
						<input placeholder="请输入验证码" id="regist-j_captcha"
						style="height: 35px;width: 278px;"></li>
					<li style="text-align: center;margin-left: 100px;"><a
						id="regist"
						style="background: #BF2C24;;font-size: 14px;padding: 5px;width: 100px;text-align: center;display: block;color: white;"
						href="javascript:">立即注册</a></li>
				</ul>
			</div>

		</div>
	</div>
	<iframe src="common/footer/footer.html" width="100%" height="110"
		scrolling="no" frameborder='0' style="position: relative;bottom: 0px;"></iframe>

	<!-- 公共js -->
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
	<!--自己的js  -->
	<script src="resources/js/authorregist/authorregist.js"
		type="text/javascript"></script>
</body>
</html>
