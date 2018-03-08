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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>已发布章节</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">

<link rel="stylesheet"
	href="resources/css/authorcenter/authorcenter.css">

</head>

<body>
	<div class="wrap login">
		<div class="header">
			<div class="headBox pageCenter clearfix">
				<a href="//write.qq.com"><img class="logo fl"
					src="https://img1.write.qq.com/writer/p1/contentv2/logo.png"
					width="225" height="28" alt="阅文·作家专区"></a>
				<div class="headUser fr">
					<a class="exit" href="/public/logout.html"><span class="icon"></span>退出登录</a>
				</div>
			</div>
		</div>


	</div>

	<div class="mainWrap pageCenter clearfix">
		<div id="leftNav" class="mainLeft fl" style="visibility: visible;">
			<div class="sideBar" id="main-bar">
				<ul>
					<li><a href="/novelsite/author/authorcenter"><span
							class="home"></span>专区首页</a></li>
					<li class="act"><a href="/novelsite/chapter/chapterwrite"><span
							class="works"></span>作品管理</a></li>
					<!---->
					<!-- <li><a href="/income/index.html"><span class="income"></span>稿酬收入</a>
					</li> -->
				</ul>
			</div>
		</div>

		<div class="mainRight pb0 fl">
			<div class="crumbsWrap">
				<b></b> <i class="before"><a
					href="/novelsite/chapter/chapterwrite"><span>作品管理</span></a></i> <em
					class="diff"></em> <i class="current"><span>${sessionScope.setBook.name }</span></i>
			</div>
			<div class="msgBoxTitle">
				<!--id="createDraftIconBtn"-->
				<!-- <a id="create-button" class="create button" data-id="-1"
					href="javascript:0;"><em
					class="icon"></em>新建章节</a> -->
				<!--<span class="minTipBox"><b class="down"></b><cite class="icon close"></cite>点此按钮即可新建章节</span>-->
				<div class="tabSwitch clearfix">
					<span><a
						href="/novelsite/chapter/novelset?bookName=${sessionScope.setBook.name}">作品设置</a></span>
					<span ><a
						href="/novelsite/chapter/edit?bookId=${sessionScope.setBook.bookId}">草稿箱</a></span>
					<span class="act"><a href="/novelsite/chapter/release?bookId=${sessionScope.setBook.bookId}">已发布章节</a></span>
				</div>
			</div>
			<div class="managerWrap clearfix">
				<!--已发布章节-->
				<div id="edit" class="edit">
					<div class="mLeftList fl">
						<div id="draftListWrap" class="leftListWrap">
							<div class="titleBox">
								<p>共 ${sessionScope.editCount } 章</p>
							</div>
							<div class="sectionManage">
								<div class="slimScrollDiv"
									style="position: relative; overflow: hidden; width: auto; height: 740px;">
									<div class="sectionList" id="sectionList"
										style="overflow: auto;  width: auto; height: 740px;">
										<!-- 草稿列表 -->
										<ul id="draftList">
											<c:forEach var ="item" items="${sessionScope.chapters }" varStatus="status">
											<c:if test="${status.index == 0 }">
												<li class="act" data-chapterid="${item.chapterId }">
													<div class="sectionBox">
														<p>
															<em>${item.chapterName }</em>
														</p>
														<p class="f12">
															<i> ${item.uploadTime } </i> <!-- 共58字 -->
														</p>
													</div>
												</li>
												</c:if>
												<c:if test="${status.index > 0 }">
												<li   data-chapterid="${item.chapterId }">
													<div class="sectionBox">
														<p>
															<em>${item.chapterName }</em>
														</p>
														<p class="f12">
															<i> ${item.uploadTime } </i> <!-- 共58字 -->
														</p>
													</div>
												</li>
												</c:if>
											</c:forEach>
											<!-- <li  class="act">
												<div class="sectionBox">
													<p>
														<em>序章</em>
													</p>
													<p class="f12">
														<i> 11-11 16:43 </i> 共58字
													</p>
												</div>
											</li> -->
										</ul>
									</div>
									<div class="slimScrollBar"
										style="background: rgb(204, 204, 204); width: 10px; position: absolute; top: 0px; opacity: 1; display: none; border-radius: 0px; z-index: 99; right: -1px; height: 740px;"></div>
									<div class="slimScrollRail"
										style="width: 10px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 0px; background: rgb(238, 238, 238); opacity: 1; z-index: 90; right: -1px;"></div>
								</div>
							</div>
							<div id="sectionBubble" class="section-bubble"
								style="display: none;">
								<p></p>
								<span class="icon"></span>
							</div>
						</div>
					</div>
					<div class="mRightContent fl">
						<!-- 编辑草稿 start -->
						<div id="editDraftBox" class="midWrap editWrap hidden"
							style="display: block;">
							<form id="formDraft" name="formDraft" method="post"
								action="/booksubmit/chapteraddsubmit.html">
								<input type="hidden" name="CBID" value="9034273403565303">
								<input id="typeHidden" type="hidden" name="type" value="update">
								<input id="statusHidden" type="hidden" name="status" value="1">
								<input id="chapterIdHidden" type="hidden" name="CCID"
									value="24252586250900851"> <input id="volumeIdHidden"
									type="hidden" name="CVIDSelect" value="24251193068494716">
								<input id="chapterTypeHidden" type="hidden"
									name="chapterTypeSelect" value="-1">

								<div class="sectionViewWrap">
									<div id="portamento_container"
										style="min-height: 48px; width: 809px;">
										<div id="draftBtnBox" class="sectionBtnBox clearfix"
											data-slide="1" style="top: 0px;">
											<div class="titleBtn fr">
												<a id="deleteDraftBtn" class="button white"
													href="javascript:" style="display: block;">删除</a> 
													 <a
													id="showPublishPopupBtn" class="button green"
													href="javascript:"><span class="icon "></span>重新发布</a>
											</div>


											<em class="c999">章节类型：</em>
											<!-- start 章节类型模拟下拉组件-->
											<div id="chapterTypeBox" class="select-wrap min">
												<div style="disabled:disabled"data-node="selectedItemBox" class="drop-down" >
													<c:if test="${sessionScope.chapter.isVip==1 }">
														<select disabled="disabled" id="isVip" class="isVip" style="height: 28px;">
															<option value="1" data-id="1">VIP章节</option>
															<option value="0" data-id="0">公众章节</option>

														</select>
													</c:if>
												
													<c:if  test="${sessionScope.chapter.isVip<1 }">
														<select  disabled="disabled"id="isVip" class="isVip" style="height: 28px;">
															<option value="0" data-id="0">公众章节</option>
															<option value="1" data-id="1">VIP章节</option>
														</select>
													</c:if>
												</div>
											</div>
										</div>
									</div>
									<div id="sectionEdit" class="zwText">
										<input id="chapterTitleInput" name="chaptertitle" type="text"
											placeholder="你还没发布章节"
											value="${sessionScope.chapter.chapterName }"
											style="color: rgb(51, 51, 51);" />
										<textarea name="content" id="chapterContentInput"
											placeholder=""
											style="color: rgb(51, 51, 51);">${sessionScope.chapter.body }</textarea>

									</div>
								</div>
						</div>
						<!-- 编辑草稿 end -->
					</div>
				</div>


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
	<script src="resources/js/chapterwrite/edit/edit.js"
		type="text/javascript"></script>

</body>
</html>
