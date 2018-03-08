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

<title>书籍目录JSP</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/bookmain/bookmain.css">
<!-- <iframe src="common/header/header.jsp" width="100%" height="230"
	scrolling="no" frameborder='0' style="margin: 0;padding: 0;"></iframe> -->
</head>

<body>
<div>
		<iframe src="common/top/index.jsp" width="100%" height="120"
			scrolling="no" frameborder='0'
			style="margin: 0;padding: 0;
            "></iframe>
	</div>
	<div class="wrap">
		<div class="mainbox">
			<!--书名及搜索部分-->
			<div class="main1">
				<div class="title">
					<a href="#" title="${sessionScope.localbook.name}"><b>&nbsp;${sessionScope.localbook.name}</b></a> 
					<c:if test="${sessionScope.localbook.status == 0}">
						<i>连载中</i>
					</c:if>
					<c:if test="${sessionScope.localbook.status == 1}">
						<i>已完结</i>
					</c:if><span>|</span>
				</div>
				<!-- <div class="auther">书号：20816669</div> -->
				<div class="tablist">
					<ul>
						<li><a href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}">介绍</a></li>
						<li class="this"><a
							href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId}"
							class="active">目录</a></li>
						<!-- <li class="midline">|</li>
						<li><a href="http://chuangshi.qq.com/bk/xh/20816669-b.html"
							class="active">评论</a></li>
						<li class="midline">|</li> -->
					</ul>
				</div>
			</div>

			<div class="indexbox clearfix">
				<div class="index_area clearfix">
					<div class="list clearfix">
						<div class="topfill clearfix">
							<h1 class="redsqu title01 juan_height">正文</h1>
							<!-- <div class="right_juan">
								书籍来源 <select class="huanyuan">
									<option class="">本地站点</option>
									<option>笔趣阁</option>
								</select>
							</div> -->
						</div>
						<ul class="block_ul clearfix">
						<c:set var="catalogitems" value="${chapters}"></c:set>
							<%-- <c:forEach var="item" items="${chapters}" varStatus="status">
								 <c:forEach var="temp" items="${item}" varStatus="i">
									 <li><a href="" class="green" title="">
											<b class="title">${temp.title}</b>
									</a></li>
								</c:forEach> 

							</c:forEach> --%>
							<c:forEach var="item" items="${requestScope.chapters}" varStatus="status">
							
							 <li><a href="/novelsite/localbook/querybookdetail?chapterId=${item.chapterId }&index=${status.index }&bookid=${requestScope.bookId}" class="green" title="${item.chapterName}">
											<b class="title">${item.chapterName}</b>
									</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>
			
		</div>
		<iframe src="common/footer/footer.html" width="100%" height="120"
				scrolling="no" frameborder='0'style="position: relative;bottom: 0px;"></iframe>
		<script src="resources/lib/jquery/1.9.1/jquery.js"
			type="text/javascript"></script>
		<script src="resources/js/common/common.js" type="text/javascript"></script>
</body>
</html>
