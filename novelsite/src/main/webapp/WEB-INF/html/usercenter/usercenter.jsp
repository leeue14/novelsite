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
<title>个人中心</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">

<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/lib/layui/css/layui.css">
<link rel="stylesheet" href="resources/css/index/index.css">
<link rel="stylesheet" href="resources/css/top/top.css">
<link rel="stylesheet" href="resources/css/usercenter/usercenter.css">


</head>

<body>
	<input style="display: none;" id="readerId"
		value="${sessionScope.reader.readerId}">
	<div>
		<iframe src="common/top/index.jsp" width="100%" height="150"
			scrolling="no" frameborder='0'
			style="margin: 0;padding: 0;
            "></iframe>
	</div>
	<div class="wrap" style="margin-top: -60px;">
		<div class="personal_logo cf">
			<a class="logo3" href="/novelsite/usercenter/index">个人中心LOGO</a>
		</div>
		<!--左边侧栏-->
		<div class="personal_wrap cf">
			<div class="personal_left">
				<div class="personalbox">
					<div class="personal_basic cf">
						<div class="img_border_big">
							<a id="userInfoBox_headImgLink" href="#"> <img
								id="userInfoBox_headImg"
								src="resources/images/usercenter/default-avatar.png" width="100"
								height="100">
							</a>
						</div>
						<div class="infor_wrap">
							<p id="box_nickname_s">${sessionScope.reader.nickName}</p>
							<p>
								<a href="#"> <img
									src="resources/images/usercenter/rank6.png"></a>&nbsp; <a
									href="#"> <img src="resources/images/usercenter/0.png"></a>
							</p>
						</div>
						<!--列表-->
						<div class="personal_toolbar">
							<!-- <h1 class="account_ico ">
								<a href="#">账务中心</a>
							</h1> -->
							<h1 class="writer_ico ">
								<a id="writer" target="_blank" href="javascript:">作家专区</a>
							</h1>
							<!-- <h1 class="V_ico ">
								<a href="#">会员专区</a>
							</h1> -->
							<h1 class="my_shelf ">
								<a href="/novelsite/usercenter/bookshelf?pageNum=1">我的书架</a>
							</h1>
							<!-- <h1 class="shelf_list " style="display:none;">
								<a href="javascript:" style="display:none;">我的书单</a>
							</h1> -->
							<!-- <h1 class="my_shuping ">
								<a href="#">我的书评</a>
							</h1> -->
							<!-- <h1 class="shelf_list ">
								<a href="#">站内短信</a>
								<div class="tool_newmsg" style="display: none;"></div>
							</h1> -->
						<!-- 	<div id="Sign_in">
								<a href="javascript:void(0);" onclick="signin();" title="签到"><img
									src="resources/images/usercenter/sign.png" alt="签到"></a>
							</div> -->

							<a class="pService" href="#" target="_blank"></a>
						</div>
					</div>
				</div>
			</div>
			<div class="personal_main main_noright">
				<div id="mainTabBox" class="main_h1tab main_long_bottom">
					<h1 class="cf">
						<span class="p_infor_basic  "> <a
							href="/usercenter/index.html" style="text-align: center">基本信息</a>
						</span> <!-- <b class="one_line">|</b> 
						<span class="p_information  main_current"> <a
							href="/usercenter/personalinfo.html">个人信息</a></span><b class="two_line">|</b>
						<span class="Certification"><a
							href="/usercenter/realverify.html">实名认证</a></span> -->
					</h1>
				</div>
				<!-- 用户中心 横向菜单-->
				<div id="mainContentList" class="main_tab_wrap">
					<!--基本信息-->
					<div class="basic_info">
						<ul>
							<li><span>用户昵称：</span> <span id="nicknamespan">${sessionScope.reader.nickName}</span>
								<a id="modifyNickNameBtn" class="modify_nickname red2"
								href="javascript:">修改昵称</a></li>
							<li><span>用户ID：</span><span id="Bindid">${sessionScope.reader.readerId}</span></li>
							<li><span>用户等级：${sessionScope.reader.grade}</span> <span
								class="now_rank"> &nbsp;&nbsp; <!--当前排名： <em>100+</em>-->
							</span> <!--<a id="modifyNickNameBtn" class="modify_nickname red2" href="javascript:">修改昵称</a>-->
								<!-- <a class="red2 " href="/usermember/index/show/1.html">查看用户等级体系</a> -->
							</li>
							<li><span>上次登录：</span>${sessionScope.reader.readerId}</li>
							<li><span>注册时间：</span>${sessionScope.reader.createTime}</li>
							<!-- <li><span>VIP月 票：</span> 本月已投0张，现余0张 <a class="gray2"
								href="/usercenter/history.html?ttid=1">查询明细</a></li> -->
							<%-- <li><span>推荐票：</span> 今日已推荐${sessionScope.reader.recommendTicket}张，现余${sessionScope.reader.recommendTicket}张 <a class="gray2"
								href="/usercenter/history.html?ttid=2">查询明细</a><a class="red2"
								href="http://chuangshi.qq.com/about/questions_newuser.html"
								target="_blank">如何获得更多？</a></li> --%>
									<li><span>个人简介：</span>${sessionScope.reader.shortInfo}</li>
									<li><span>绑定邮箱：</span>${sessionScope.reader.email}</li>
							<li><span>藏 书 量：</span> 共1000本，已用4本 <a class="red2"
								href="/userfavorite/index.html">进入我的书架</a></li>
							<li><span>发 帖 量：</span>0条</li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>

		<!--中间内容-->

	</div>

	<iframe src="common/footer/footer.html" width="100%" height="150px"
		scrolling="no" frameborder='0'
		style="margin: 0;padding: 0;position: fixed;bottom: 0px;"></iframe>

	<!-- 公共js -->
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
	<!--自己的js  -->
	<script src="resources/js/usercenter/usercenter.js"
		type="text/javascript"></script>
</body>
</html>
