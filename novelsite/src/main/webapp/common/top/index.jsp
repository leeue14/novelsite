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
<link rel="stylesheet" href="resources/css/usercenter/usercenter.css">
<link rel="stylesheet" href="resources/css/login/login.css">
<link rel="stylesheet" href="resources/css/top/top.css">


</head>

<body>
	<div id="topNav" class="top_nav" style="background-color:#575757;">
		<div class="top_nav_center cf">
			<div class="toolbar">
				<a attr="inner:toggleSiteListBtn;" class="qqSite"
					href="/novelsite/indexview/index" target="_blank">轩文阁文学网</a> <span
					class="navline">|</span><a attr="click:addFavorite;"
					class="favorite" href="javascript:">一键收藏</a>

			</div>
			<div class="loginbar">
				<span class="login_after"> <c:if
						test="${sessionScope.reader == null}">
						<a href="/novelsite/indexview/index" target="_blank">前往首页登录</a>
					</c:if> <c:if test="${sessionScope.reader != null}">
						<a class="login user" href="/novelsite/usercenter/index"target="_blank"> 欢迎您，<i>${sessionScope.reader.nickName }</i></a>
						
					</c:if>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="top_nav2">
			<div class="mainnav">
				&nbsp; <a href="/novelsite/indexview/index" title="轩文阁首页"
					target="_blank">轩文阁首页</a>&nbsp;&nbsp; &nbsp; 
					<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1" title="网络书库">网络书库</a>&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=1&major=玄幻" title="玄幻修真">玄幻修真</a>&nbsp;&nbsp;&nbsp; 
				<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=4&major=仙侠" title="仙侠">仙侠</a>&nbsp;&nbsp;&nbsp;
				<a target="_blank"  href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=5&major=都市" title="都市">都市</a>&nbsp;&nbsp;&nbsp; <a
					href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=8&major=灵异" title="灵异">灵异</a>&nbsp;&nbsp; &nbsp;
					<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=10&major=游戏" title="游戏">游戏</a>&nbsp;&nbsp;&nbsp;
				<a  target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=6&major=历史" title="历史">历史</a>&nbsp;&nbsp; &nbsp;&nbsp;
				<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=73&major=轻小说" title="轻小说">轻小说</a>&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=74&major=职场" title="职场">职场</a>&nbsp;&nbsp; &nbsp;
				<a target="_blank" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=8&major=灵异"
					title="灵异">灵异</a>&nbsp;&nbsp; 
					<a target="_blank"  href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=9&major=科幻"
					title="科幻">科幻</a>
			</div>
			<div class="topline"></div>
		</div>
	</div>
	
	
	
	
	


	<script src="resources/lib/jquery/1.9.1/jquery.js"></script>
	<script src="resources/js/top/top.js"></script>
	 <!-- 登录注册 -->
		<script src="resources/js/index/index.js" type="text/javascript"></script>
</body>
</html>
