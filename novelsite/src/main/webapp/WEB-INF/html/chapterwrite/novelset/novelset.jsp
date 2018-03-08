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

<title>作品管理</title>

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

		<!-- 作品设置 -->
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
					class="diff"></em> <i class="current"><span>${sessionScope.setBook.name}</span></i>
			</div>
			<div class="msgBoxTitle">
				<!--id="createDraftIconBtn"-->
				<a class="create button"
					href="/booknovels/chaptertmp/CBID/9034273403565303/addType/1.html"><em
					class="icon"></em>新建章节</a>
				<!--<span class="minTipBox"><b class="down"></b><cite class="icon close"></cite>点此按钮即可新建章节</span>-->
				<div class="tabSwitch clearfix">
					<span class="act"><a
						href="/novelsite/chapter/novelset?bookName=${sessionScope.setBook.name }">作品设置</a></span>
					<span><a
						href="/novelsite/chapter/edit?bookId=${sessionScope.setBook.bookId}">草稿箱</a></span>
					<span><a
						href="/novelsite/chapter/release?bookId=${sessionScope.setBook.bookId}">已发布章节</a></span>
				</div>
			</div>
			<div class="managerWrap clearfix">
				<div id="bookWrap" class="workStateWrap cf">
					<!--1具备申请创作保障金的条件-->
					<form id="formModifyBook" name="formModifyBook" method="post"
						action="/booksubmit/modifysubmit.html"
						enctype="multipart/form-data" novalidate="novalidate">
						<input name="CBID" type="hidden" value="9034273403565303">
						<input name="site" type="hidden" value="5"> <input
							id="tagIdListHidden" name="taglistId" type="hidden"
							value="21957:坚毅,21101:宅男,21194:凡人流,21180:玄学"> <input
							name="categoryid" type="hidden" value="20001">

						<div class="fmBox fl">
							<div class="fm">
								<img id="previewImg" src="..${sessionScope.setBook.cover}"
									width="114" height="152"> <span class="modify hidden"
									id="selectBookCoverBtn">上传新封面</span> <input type="file"
									id="bookpic" name="bookpic" class="hidden"> <a
									class="blue" href="..${sessionScope.setBook.cover}">查看大图</a>
							</div>
						</div>

						<div class="workSetList fl">
							<ul>
								<li><em>作品名称：</em>
									<p class="saved">${sessionScope.setBook.name}</p>
									<div class="modify hidden cf">
										<input id="bookNameInput" name="bookname" autocomplete="off"
											class="midInput recTagInput"
											value="${sessionScope.setBook.name}"
											data-def="${sessionScope.setBook.name}" type="text">
										<p data-node="ok" style="display:none;">
											<cite class="icon ok"></cite><span class="f12 c999"
												data-node="text" style="padding-left:5px;"></span>
										</p>
										<p data-node="error" class="error" style="display:none;"></p>
									</div></li>
								<li><em>首发站点：</em> <b> <span class="saved">轩文阁中文网</span>
								</b> <cite>书号：</cite><b>${sessionScope.setBook.bookId}034273403565303</b></li>
								<li><em>作品类型：</em> <b id="classificationWorks"
									class="select-category"> <span class="saved">${sessionScope.categoryParent.categoryName }-${sessionScope.category.categoryName}</span>
								</b><cite>授权级别：</cite> <b class="select-level"> <span
										class="saved">独家首发</span> <select
										class="modify hidden showselect" name="authorization">
											<option value="1">独家首发</option>
											<option value="5">驻站作品</option>
									</select>
								</b></li>
								<li><em>编辑分组：</em>
									<p>玄幻编辑组</p></li>
								<li><em>字数：</em>

									<p>0</p></li>
								<li><em>收藏：</em> <!--收藏接口-->
									<p>0</p></li>
								<li><em>作品状态：</em> <!-- start 点击修改后saved隐藏 modify显示--> <c:if
										test="${sessionScope.setBook.status==0 }">
										<p class="saved">连载中</p>
									</c:if> <c:if test="${sessionScope.setBook.status==1}">
										<p class="saved">已完结</p>
									</c:if>
									<p class="modify hidden cf">新建</p> <!-- end 点击修改后saved隐藏 modify显示-->
								</li>
								<li><em>作品标签：</em> <!-- start 点击修改后saved隐藏 modify显示-->
									<p class="saved">${sessionScope.setBook.cat}</p>
								<li><em>作品介绍：</em>
									<div class="modify hidden">
										<!--<textarea id='introInput' name='intro'>人生，有很多种活法，也有很多种死法。不为天地道法而活，也不为求得永生而死。我的道，只为我而生。</textarea>-->
										<!--<cite data-node="ok" class="icon ok" style="display:none;"></cite>-->
										<!--<p data-node="tip" class="f12 c999">20~300个字，可自行修改，修改后一个工作日内可审核完毕</p>-->
										<!--<p data-node="error" class="error" style="display:none;"></p>-->


										<textarea id="introInput" name="intro">${sessionScope.setBook.shortInfo}</textarea>
									</div>
									<p class="saved intro">${sessionScope.setBook.shortInfo}</p></li>
								<li id="commendlist_id" style="display: none;"><em>推荐作品：</em>
									<p class="saved intro"></p>
									<div class="modify hidden">
										<input id="searchBookInput" autocomplete="off"
											class="midInput recTagInput" type="text">
										<p class="f12 c999">最多推荐十本</p>
										<a id="recommendBookBtn" class="button green"
											href="javascript:">推荐</a>
										<!-- 已推荐作品 -->
										<div class="recTagBox mb50" id="recommendBookList"></div>
									</div> <!-- 搜索结果 -->
									<div id="searchBookResultList" class="lenovoBox"
										style="display:none;"></div></li>
							</ul>
							<p class="dib-wrap saved modify-btn" style="margin-top: 10px;">
								<a id="switchModifyModeBtn" class="button" href="javascript:">修改作品设置</a>
							</p>
						</div>
					</form>
				</div>

			</div>
			<!--end  -->


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
	<!-- 自己的js -->
	<script src="resources/js/createbook/createbook.js"
		type="text/javascript"></script>
	<script>
		$('#switchModifyModeBtn').on('click', function() {
			layer.open({
				type : 2,
				resize : false,
				move : false,
				title : [ '修改书籍', 'font-size:18px;' ],
				fixed : true,
				area : [ '850px', '560px' ],
				shadeClose : false, //点击遮罩关闭
				content : 'common/createbook/setbook.jsp'
			});
		});
	</script>


	<script type="text/javascript">
		//窗口如果嵌套出错了用这个方法
		if (self.location != top.location) {
			top.location = self.location;
		}
	</script>

</body>
</html>
