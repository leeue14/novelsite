<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<html>
<head>
<base href="<%=basePath%>">

<title>${sessionScope.localbook.name}-简介</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/bookmain/bookmain.css">
<!-- <iframe src="common/header/header.jsp" width="100%" height="230"
	scrolling="no" frameborder='0' style="margin: 0;padding: 0;"></iframe>
</head> -->

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
					</c:if>
					<span>|</span>
				</div>
				<%-- <div class="auther">推荐票数:${sessionScope.localbook.recommendTicket}</div> --%>
				<div class="tablist">
					<ul>
						<li class="this"><a href="#">介绍</a></li>
						<li><a
							href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId}"
							class="active">目录</a></li>
					</ul>
				</div>
			</div>
			<!--作品简介和作者-->
			<div class="main2">
				<div class="left">
					<!--活动专用按钮activeBtn-->
					<div class="cover">
						<!-- 限时免费的提示 -->
						<cite id="discountTag" style="display:none;"></cite><em
							id="discountTime" style="display:none;"></em><a
							href="http://chuangshi.qq.com/bk/xh/AGoENF1oVjYAPFRiATcBbQ-l.html"
							class="bookcover"><img
							onerror="this.src='../novelCover/date/bookId/nocover/nocover.jpg'"
							src="..${sessionScope.localbook.cover}" width="204" height="255"
							alt="${sessionScope.localbook.name}"></a>
					</div>
					<div class="button1">
						<table width="216" height="100" border="0">
							<tbody>
								<tr>
									<!-- <td><a href="javascript:;" class="but01"
										id="addtobookshelf">&nbsp;</a></td> -->
									<td align="center"><a id="readNow"
										href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId}"
										alt=",最新章节,目录" class="but02">立即阅读</a></td>
								</tr>
								<!-- <tr>
									<td><a id="openRewardPopupBtn" href="javascript:;"
										class="but03 btnDashang">&nbsp;</a></td>
									<td><a id="openRecommendPopupBtn" href="javascript:;"
										class="but04 btnTuijian">&nbsp;</a></td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="title">
						<a href="/novelsite/indexview/index" target="_blank">首页</a>&gt;<a
							href="#">${sessionScope.localbook.name}</a></strong>
					</div>
					<%-- <div class="num">
						<table border="0">
							<tbody>
								<tr>
									<td>追书人数：${sessionScope.modelmapbookinfo.bookinfo.data.latelyFollower}</td>
									<td>读者留存率：${sessionScope.modelmapbookinfo.bookinfo.data.retentionRatio}%</td>
									<td>日更新字数：${sessionScope.modelmapbookinfo.bookinfo.data.serializeWordCount}</td>
									<td>总字数：${sessionScope.modelmapbookinfo.bookinfo.data.wordCount}</td>
								</tr>
							</tbody>
						</table>
					</div> --%>
					<!-- tms id 677 特殊标记 zhangjun-->
					<!-- tms id 677 特殊标记 zhangjun-->
					<div class="info">
						<c:set var="info" value='${sessionScope.localbook.shortInfo}' />
						<c:forEach var="item" items="${fn:split(info, '　') }">
							<p>${item}</p>
						</c:forEach>
					</div>
					<div class="tags">作品标签： ${sessionScope.localbook.cat}</div>
					<!--植树节活动 奇迹树 弹框 start-->
				</div>
				<div class="right">
					<div class="autherinfo">
						<a
							href="http://account.book.qq.com/bk/author/ADdQOQdqWWhcMgtoV2VTYAA7WzY%25253D"
							class="head"> <img
							src="http://img1.chuangshi.qq.com/account/p1//head_photo/default-avatar.png"
							width="48" height="48"></a>
						<div class="au_name">
							<p id="textauthor">作者：</p>
							<p>
								<a
									href="#">${sessionScope.localbook.authorName}</a>
							</p>
						</div>
						<div class="shortintro">
							<p>希望书友们相互转告，帮忙广告，你们的支持就是我的力量！求点击、求推荐、求书评，各种求！</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 最新章节、作品信息、隆重推荐、作者其他作品 -->
			<div class="main3">
				<div class="middle clearfix">
					<!-- 页签 -->
					<div id="newChapterTabBox " class="tab">
						<!-- tms id 533 特殊标记 xiexinzhong-->
						<h1 class="tab2left  choice" style="    width: 222px;">
							<a id="newChapterTab" listid="newChapterList" href="javascript:"
								title="${sessionScope.localbook.name}最新章节">最新章节</a>
						</h1>
						<!-- tms id 533 特殊标记 xiexinzhong-->
						<%-- <h1 class="tab2right ">
							<a id="novelInfoTab" listid="novelInfo" href="javascript:"
								title="${sessionScope.localbook.name}作品信息">作品信息</a>
						</h1> --%>
						<div class="tabnext">
							<!--一键加群 chenjie-->
							<!--一键加群 chenjie-->
						</div>
					</div>
					<!-- 最新章节 -->
					<div id="newChapterList" class="swishlist" style="">
						<div class="chaptername">
							<b><a
								href="/novelsite/localbook/querybookdetail?chapterId=${requestScope.lastupdatechapter.chapterId}&index=${sessionScope.chaptersCount-1}&bookid=${sessionScope.localbook.bookId}"
								class="green">${requestScope.lastupdatechapter.chapterName}</a>
							</b> <span></span>
							(更新时间：${requestScope.lastupdatechapter.uploadTime})
						</div>
						<div class="chapternev">
							<a href="/novelsite/localbook/querybookdetail?chapterId=${requestScope.lastupdatechapter.chapterId}&index=${sessionScope.chaptersCount-1}&bookid=${sessionScope.localbook.bookId}" rel="nofollow"> 
							<c:set var="vEnter"
									value="${requestScope.vEnter}" /> <c:set var="b" value="<p>" />

								<%-- 	<c:set var="info" value='${updateChapterDetail.chapterbody}' /> 
									<c:forEach var="item" items="${fn:split(info, '\\\n') }">
									
								</c:forEach>  --%> <%--  <p>${ }requestScope.lastupdatechapter.body</p> --%>
								<p>${fn:replace(requestScope.lastupdatechapter.body,vEnter, b)}</p>
							</a>
						</div>
						<div class="btnlist">
							<a
								href="/novelsite/localbook/querybookdetail?chapterId=${requestScope.lastupdatechapter.chapterId}&index=${sessionScope.chaptersCount-1}&bookid=${sessionScope.localbook.bookId}"
								alt="${requestScope.modelmapbookinfo.bookinfo.data.title}最新章节"
								class="read"></a> 
								<a
								href="/novelsite/localbook/querycatalog?bookid=${sessionScope.localbook.bookId}"
								class="index"
								alt="${requestScope.modelmapbookinfo.bookinfo.data.title},${requestScope.modelmapbookinfo.bookinfo.data.title}最新章节,目录"></a>
						</div>
					</div>
					<!-- 作品信息 -->
					<div id="novelInfo" class="swishlist" style="display: none">
						<table border="0">
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>读者留存率：${requestScope.modelmapbookinfo.bookinfo.data.retentionRatio}%</td>
									<td>日更新字数：${requestScope.modelmapbookinfo.bookinfo.data.serializeWordCount}</td>
								</tr>
								<tr>
									<td>总字数：${requestScope.modelmapbookinfo.bookinfo.data.wordCount}</td>
									<td>章节数：${requestScope.modelmapbookinfo.bookinfo.data.chaptersCount}</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="right">
					<div id="authorBookBox" class="authorRec">
						<div class="otherbook">
							<div id="authorBookTabBox" class="tab">
								<h1 class="tableft choice">
									<a href="javascript:"> 隆重推荐 </a>
								</h1>
							</div>
							<div class="otherList" id="theAuthorBest">
								<ul>
									<li><a href="http://chuangshi.qq.com/bk/ds/20353675.html"
										class="green">超等军火商</a></li>
									<li><a href="http://chuangshi.qq.com/bk/xh/20494776.html"
										class="green">狂暴武魂系统</a></li>
									<li><a href="http://chuangshi.qq.com/bk/ds/20734756.html"
										class="green">一拳奶爸</a></li>
									<li><a href="http://chuangshi.qq.com/bk/xh/20741577.html"
										class="green">神帝异世重生</a></li>
									<li><a href="http://chuangshi.qq.com/bk/ds/20885928.html"
										class="green">都市大巫妖</a></li>
									<li><a href="http://chuangshi.qq.com/bk/js/20269824.html"
										class="green">不死小兵</a></li>
									<li><a href="http://chuangshi.qq.com/bk/ds/20809502.html"
										class="green">随身拍卖行</a></li>
									<li><a href="http://chuangshi.qq.com/bk/ly/20708805.html"
										class="green">捉鬼龙王之极品强少</a></li>
									<li><a href="http://chuangshi.qq.com/bk/xx/20702016.html"
										class="green">都市之极品仙少</a></li>
									<li><a href="http://chuangshi.qq.com/bk/qh/20613476.html"
										class="green">穿越万界改剧情</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="main5">
				<div class="left" id="intro_comments">
					<div class="mainbox">
						<!--书评-->

						<input class="hidden"
							value="${sessionScope.localbook.name}"
							id="bookTitle"> <input class="hidden"
							value="${sessionScope.localbook.bookId}"
							id="bookId">
						<div class="main5" style="width:783px;">
							<div class="left" style="border:0;">
								<div class="topfill comment_top">
									<h1 class="redsqu title01">${sessionScope.localbook.name}书评区</h1>
									<div class="bz">
										作者： <a target="_blank"
											href="/novelsite/search/searchbook?bookName=${sessionScope.localbook.authorName}&pageNum=1">${sessionScope.localbook.name}</a>
									</div>
								</div>
								<!--评论输入框-->
								<div class="comment_box" id="container">
									<div class="yanzheng_code" style="top:200px;">
										<span style=" position:absolute; left:-90px;font-size: 12px;">请输入验证码：</span>
										<input id="verifyInput" name="verifyInput" type="text"
											class="verify codeinput" maxlength="4">&nbsp; <a
											href="javascript:"> <img id="verifyImg"
											class="y_code verifyImg" onclick="changeVerifyCode(this)"
											src="/novelsite/Kaptcha" style="height: 30px" alt="点击更换"
											title="点击更换">
										</a>
									</div>
									<input id="commentTitle" maxlength="30" name="" type="text"
										class="inputtitle" placeholder="请输入标题" style="color:Gray;"
										autocomplete="off">
									<div class="leftword" style="margin-top:-25px;">
										限定<span id="leftWord" class="red">300</span>字符
									</div>
									<a target="_blank" href="javascript:void(0)" class="head">
										<img
										src="http://img1.chuangshi.qq.com/account/p1/head_photo/default-avatar.png"
										width="50" height="50">
									</a>
									<div class="input">
										<textarea id="commentContent" maxlength="300"
											placeholder="评论字数不得超过300字符" class="Introduction2"
											name="Introduction" cols="" rows=""></textarea>
									</div>
									<div class="rightbtn" style="margin-top:-25px; top:213px;">
										<input type="hidden" id="islogin" name="islogin" value="">
										<a id="submitCommentBtn" class="comment_submit">发布</a>
									</div>
								</div>
								<!-- 评论页签 -->
								<div id="commentTabBox" class="tablist">
									<div class="tabword">
										<a href="javascript:void(0)" target="_blank">${sessionScope.localbook.name}已有<span
											class="red">${requestScope.commentPageBean.totalRecord}</span>条评论
										</a>
									</div>

								</div>
								<!-- 热门评论列表 -->
								<ul id="newCommentList" class="comment_list">
									<c:forEach var="item"
										items="${requestScope.commentPageBean.list}">
										<li><a class="head" href="javascript:void(0)"
											alt="书友7478${item.readerId}"> <img
												src="http://img1.chuangshi.qq.com/account/p1/head_photo/default-avatar.png"
												width="50" height="50">
										</a>
											<p class="title">
												<a target="_blank" href="javascript:void(0)" class="grey3">${item.commentTitle}</a>
											</p> <b class="name"> <a class="green"
												href="javascript:void(0)">书友${item.nickName}</a>说：
										</b>
											<p class="nev">
												<a class="grey2" target="_blank" href="javascript:void(0)">${item.body}</a>
											</p> <b class="time"> 时间：${item.date}</b> <b class="replybox">
										</b> <b class="tabl"><a class="share" href="javascript:;"></a>
												<a weibotype="sina" class="tosina" href="javascript:;"></a>
												<a weibotype="qq" class="toqq" href="javascript:;"></a> </b></li>
									</c:forEach>
								</ul>
								<c:if test="${requestScope.commentPageBean.totalPage>0}">
								<div class="page">
									<a
										href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=1">首页</a>
									<c:if test="${requestScope.commentPageBean.pageNum >1 }">
										<a
											href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=${requestScope.bookPageBean.pageNum-1}">&lt;&lt;</a>
									</c:if>

									<c:forEach var="i" step="1"
										begin="${requestScope.commentPageBean.start}"
										end="${requestScope.commentPageBean.end}">
										<c:if test="${requestScope.commentPageBean.pageNum == i}">
											<a style="color: #ffffff;background-color: red;"
												href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=${i}">${i}</a>
										</c:if>
										<c:if test="${requestScope.commentPageBean.pageNum != i}">
											<a
												href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<c:if
										test="${requestScope.commentPageBean.pageNum <requestScope.commentPageBean.totalPage }">
										<a
											href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=${requestScope.commentPageBean.pageNum+1}">&gt;&gt;</a>
									</c:if>
									<a
										href="/novelsite/localbook/querybook?bookid=${sessionScope.localbook.bookId}&pageNum=${requestScope.commentPageBean.totalPage }">末页</a>
								</div>
								</c:if>
								<!--page结束-->
							</div>
						</div>
					</div>
				</div>
			</div>
			

<!--  -->

		</div>
		<iframe src="common/footer/footer.html" width="100%" height="120"
			scrolling="no" frameborder='0'
			style="position: relative;bottom: 0px;"></iframe>
		<script src="resources/lib/jquery/1.9.1/jquery.js"
			type="text/javascript"></script>
		<script src="resources/js/common/common.js" type="text/javascript"></script>
		<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
		<!-- 评论js -->
		<script src="resources/js/comment/comment.js" type="text/javascript"></script>
		<!-- <script src="resources/js/bookmain/bookmain.js" type="text/javascript"></script> -->
</body>
</html>
