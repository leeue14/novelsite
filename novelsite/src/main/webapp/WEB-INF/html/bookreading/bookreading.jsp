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


<!-- 加入书架 用的数据-->
<input class="hidden" id="bookName" value="${sessionScope.modelmapbookinfo.bookinfo.data.title}">
<input class="hidden" id="author" value="${sessionScope.modelmapbookinfo.bookinfo.data.author}">
<input class="hidden" id="bookId" value="${sessionScope.modelmapbookinfo.bookinfo.data._id}">
<input class="hidden" id="title" value="${sessionScope.title}">
<!-- end -->
<body>
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
					<!-- 快速导航 -->
				</div>
			</div>
		</div>
		<div id="readWrap" class="readWrap w800">
			<div class="bookNav">
				<a href="/novelsite/indexview/index" target="_blank">轩文阁中文网</a>&gt; <a
					href="http://chuangshi.qq.com/bk/huan/" target="_blank">${sessionScope.modelmapbookinfo.bookinfo.data.majorCate}</a>&gt;
				<a href="http://chuangshi.qq.com/bk/xh/xx20002/" target="_blank">${sessionScope.modelmapbookinfo.bookinfo.data.minorCate}</a>&gt;
				<a href="http://chuangshi.qq.com/bk/xh/20816669.html">${sessionScope.modelmapbookinfo.bookinfo.data.title}</a>
			</div>
			<div data-node="chapterBox" data-uuid="1" data-volumeid="1"
				class="textbox">
				<div class="story_title">
					<h1 data-node="chapterTitle">${sessionScope.title}</h1>
					<p class="textinfo">
						<em> 小说：<a class="story" target="_blank"
							href="/novelsite/bookview/bookcatalog?hostId=${sessionScope.hostid}&bookId=${sessionScope.modelmapbookinfo.bookinfo.data._id}">${sessionScope.modelmapbookinfo.bookinfo.data.title}</a>
							作者： <a class="author" target="_blank"
							href="http://account.book.qq.com/bk/author/ADdQOQdqWWhcMgtoV2VTYAA7WzY%25253D">${sessionScope.modelmapbookinfo.bookinfo.data.author}</a></em>

					</p>
					<!--头像修改-->

				</div>
				<div class="txtwrap">
					<div class="text">
						<div class="bookreadercontent"
							style="font-size: 16px; font-family: &quot;Microsoft YaHei&quot;;">
							<c:set var="vEnter" value="${vEnter}" />
							<c:set var="b" value="<p>" />
							<p>${fn:replace(chapter.chapterbody,vEnter, b)}</p>
						</div>
					</div>
				</div>
				<!-- 章节打赏按钮容器 -->
				<!-- <div data-node="chapterRewardBox">
					<div class="praise">
						<a data-node="rewardChapterBtn" data-uuid="1" class="pressBtn"
							href="javascript:" data-user-action="rd019"><em></em><span
							data-node="chapterRewardCount" data-uuid="1"></span></a>
					</div>
				</div> -->
			</div>
			<div id="nextPageBox" class="nextPageBox" style="">
				<div class="button_box clearfix">
					<div class="boxa clearfix">
						<a href="#" id="nextChapterBtn">下一章>></a> 
						<a href="javascript:;" id="addBookShelf">加入书架</a>
						<a href="/novelsite/bookview/bookcatalog?hostId=${sessionScope.hostid}&bookId=${sessionScope.modelmapbookinfo.bookinfo.data._id}" id="">返回目录</a> 
						<a href="#" id="preChapterBtn">&lt;&lt;上一章</a>
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
	
	<!--  书架js-->
		<script src="resources/js/common/addbookshelf.js" type="text/javascript"></script>
		
		
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<script src="resources/js/bookreading/bookreading.js"
		type="text/javascript"></script>


<script>
$(function(){
/* 	var chapters = new Map(); */
	var chapters ="<%= session.getAttribute("hostid")%>"; 
	var url = "/novelsite/bookoperation/getbookcatalog";
	var index = getQueryString("index");
	index = Number(index);

	var preIndex  = index -1;
	var nextIndex = index + 1;
/* 	alert("preIndex ="+preIndex+" index="+index+" nextIndex ="+nextIndex); */
	//上一页下一页获取
	$.ajax({
		url : url,
		type : 'GET',
		contentType : false,// 因为要传文件和文字
		processData : false,
		cache : false,
		success : function(data) {
			if(data.success){
				var chapters = data.chapters;
				
				for(var i = 0; i < chapters.length; i++){
					
					if(i == nextIndex){
						var chapter = chapters[nextIndex];
						$("#nextChapterBtn")
						.attr("href","/novelsite/bookview/bookdetail?title="+chapter["title"]+"&url="+chapter["link"]+"&index="+nextIndex);
					}
				//	948
					if(nextIndex >= chapters.length-1){
						var length = chapters.length -1;
						var chapter = chapters[length];
						$("#nextChapterBtn")
						.attr("href","/novelsite/bookview/bookdetail?title="+chapter["title"]+"&url="+chapter["link"]+"&index="+length);
					}
					
					if(i == preIndex){
						var chapter = chapters[preIndex];
						$("#preChapterBtn")
						.attr("href","/novelsite/bookview/bookdetail?title="+chapter["title"]+"&url="+chapter["link"]+"&index="+preIndex);
						var tt = chapters[949];
					/* 	console.log("preIndex="+preIndex+"i="+i+"----"+tt["link"]); */
					}
		
					if(preIndex < 0){
						var chapter = chapters[0];
						$("#preChapterBtn")
						.attr("href","/novelsite/bookview/bookdetail?title="+chapter["title"]+"&url="+chapter["link"]+"&index="+0);
					}
				}
			
			}
		}
	});// 使用ajax传入后台
	
	
	//加入书架操作
	
	
});
</script>
</body>
</html>


