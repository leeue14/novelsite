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

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/bookreading/bookreading.css">
</head>

<body>
	<!--  隐藏域获取bookId-->
	<input value="${sessionScope.localbook.bookId}" class="hidden"
		id="bookId">
	<input class="hidden" id="bookName"
		value="${sessionScope.localbook.name}">
	<input class="hidden" id="author"
		value="${sessionScope.localbook.authorName}">
	<input class="hidden" id="bookId"
		value="${sessionScope.localbook.bookId}">
	<input class="hidden" id="title"
		value="${requestScope.chapter.chapterName}">
	<%-- <input class="hidden" id="site" value="${sessionScope.localbook.bookId}"> --%>

	<div class="wrapbig">
		<div class="mininav">
			<div class="mininavInner" id="topNav">
				<div class="mininav_fl">
					<!-- 手机阅读 -->
					<div class="box sub">
						<div class="show choose_site">
							<span> <i class="icon site-icon"> </i><a
								href="/novelsite/indexview/index" target="_blank">轩文阁中文网</a> <em
								class="ficon_arrow_down"></em>
							</span>
						</div>
					</div>
					<!-- 搜索框 -->
				</div>
					<div class="mininav_fr">
					<!-- 已登录 -->
						<c:if test="${sessionScope.reader == null}">
						<div class="no_login">
						<div class="box first">
							<div class="show">
								<a attr="click:openLoginPopup;" href="/novelsite/indexview/index">首页登录</a>
							</div>
						</div>
						
						</c:if>
						<c:if test="${sessionScope.reader != null}">
						<!-- <div class="no_login"> -->
						<div class="box first">
							<div class="show">
								<a attr="click:openLoginPopup;" href="javascript:;">${sessionScope.reader.nickName }</a>
							</div>
						</div>
						</c:if>
					<!-- 未登录 -->
					
						<!-- <!-- 最近阅读 -->
						<!-- <div class="box sub">
							<div class="show">
								<a>最近阅读</a>
							</div>
						</div>  -->
					</div>
			</div>
		</div>
		<div id="readWrap" class="readWrap w800">
			<div class="bookNav">
				<a href="/novelsite/indexview/index" target="_blank">轩文阁中文网</a>&gt;

				<a
					href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId }">${sessionScope.localbook.name}</a>
			</div>
			<div data-node="chapterBox" data-uuid="1" data-volumeid="1"
				class="textbox">
				<div class="story_title">
					<h1 data-node="chapterTitle">${requestScope.chapter.chapterName}</h1>
					<p class="textinfo">
						<em> 小说：<a class="story" target="_blank"
							href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId }">${sessionScope.localbook.name}</a>
							作者： <a class="author" target="_blank"
							href="/novelsite/search/searchbook?bookName=${sessionScope.localbook.authorName}&pageNum=1">${sessionScope.localbook.authorName}</a></em>

					</p>
					<!--头像修改-->

				</div>
				<div class="txtwrap">
					<div class="text">
						<div class="bookreadercontent"
							style="font-size: 16px; font-family: &quot;Microsoft YaHei&quot;;">
							<c:set var="vEnter" value="${requestScope.vEnter}" />
							<c:set var="b" value="<p>" />
							<p>${fn:replace(requestScope.chapter.body,vEnter, b)}</p>
						</div>
					</div>
				</div>
				<!-- 章节打赏按钮容器 -->
				<div data-node="chapterRewardBox">
					<div class="praise">
						<a data-node="rewardChapterBtn" data-uuid="1" class="pressBtn"
							href="javascript:" data-user-action="rd019"><em></em><span
							data-node="chapterRewardCount" data-uuid="1"></span></a>
					</div>
				</div>
			</div>
			<div id="nextPageBox" class="nextPageBox" style="">
				<div class="button_box clearfix">
					<div class="boxa clearfix">
						<a href="#" id="nextChapterBtn">下一章>></a> 
						<a href="javascript:;"
							id="addBookShelf">加入书架</a> <a
							href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId }"
							id="">返回目录</a> <a href="#" id="preChapterBtn">&lt;&lt;上一章</a>
					</div>
				</div>

			</div>
		</div>



	</div>
	<!--js代码开始-->
	<!-- <script src="resources/index/layui.all.js"></script> -->
	<script src="resources/lib/myfocus/js/myfocus-2.0.1.min.js"
		type="text/javascript"></script>
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>

	<!-- 自己的js -->
	<script src="resources/js/localbook/bookreading/bookreading.js"
		type="text/javascript"></script>

	<!--加入书架  -->
	<script src="resources/js/common/addbookshelf.js"
		type="text/javascript"></script>
	<script>
		
	</script>
</body>
</html>


