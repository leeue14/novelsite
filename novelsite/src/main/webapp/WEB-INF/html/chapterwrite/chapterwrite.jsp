<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

		<div class="mainRight fl">
			<div class="crumbsWrap">
				<i><span>作品管理</span></i>
			</div>
			<div class="msgBoxTitle">
				<p class="f12 c555">
					当前作品总数<span id="bookCount" class="blue Num">${sessionScope.booksCount}</span>本
				</p>

				<a id="create-book" class="create button"><em class="icon"></em>创建作品</a>

			</div>
			<!-- 存在作品 -->
			<c:if test="${sessionScope.booksCount > 0 }">
				<div id="bookManageExist" class="worksCtrlWrap">
					<div class="worksListWrap mb20">
						<table class="worklist-table" width="100%" border="0"
							cellspacing="0">
							<colgroup>
								<col width="32px">
								<col width="220px">
								<col width="240px">
								<col width="100px">
								<col width="60px">
								<col width="60px">
								<col width="160px">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th class="tl">书名</th>
									<th class="tl">最新章节</th>
									<th class="center">编辑分组</th>
									<th>收藏</th>
									<th>状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<c:forEach var="item" begin="0" end="27" varStatus="status"
								items="${sessionScope.books }">
								<tbody id="novelList">
									<tr class="active">
										<td></td>
										<td class="tl">
											<div class="work-photo">
												<a href="/novelsite/chapter/novelset?bookName=${item.name }" target="_blank"><img
													src="..${item.cover}" width="83" height="108" alt="作品封面"></a>
											</div>
											<p class="work-name">
												<a href="/novelsite/chapter/novelset?bookName=${item.name }" target="_blank">${item.name }</a>
											</p>
										</td>
										<td class="tl"><a href="javascript:">无最新章节</a></td>
										<td><em>玄幻编辑组</em></td>
										<td><em class="Num">0</em></td>
										<td>新建</td>
										<td>
											<div class="dib-wrap">
												<a class=""
													style="padding:5px;background:#1FA9FF;border-radius: 3px;"
													url-chapter="#" data-catid="20001"
													href="/novelsite/chapter/edit?bookId=${item.bookId}"><span class="icon"></span><i
													style="color:#fff;">写新章节</i></a> <a
													style="padding:5px;background:#DDD;border-radius: 3px;"
													class="" url-chapter="#" data-catid="20001"
													href="/novelsite/chapter/release?bookId=${item.bookId}"><span class="icon"></span><i
													style="color:#AAA;">已发布章节</i></a>
											</div>
										</td>
									</tr>
								</tbody>

							</c:forEach>

						</table>
					</div>
					<!-- 翻页组件 -->
					<div id="pager" class="pageBox fr" style="display: block;"></div>
				</div>
			</c:if>

			<!-- 没有作品 -->
			<c:if test="${sessionScope.booksCount <= 0 }">
				<div id="bookManageExist" class="worksCtrlWrap">
					<div class="worksListWrap mb20">
						<table class="worklist-table" width="100%" border="0"
							cellspacing="0">
							<colgroup>
								<col width="32px">
								<col width="220px">
								<col width="240px">
								<col width="100px">
								<col width="60px">
								<col width="60px">
								<col width="160px">
							</colgroup>
							<thead>
								<!-- <tr>
								<th></th>
								<th class="tl">书名</th>
								<th class="tl">最新章节</th>
								<th class="center">编辑分组</th>
								<th>收藏</th>
								<th>状态</th>
								<th class="center">操作</th>
							</tr> -->
							</thead>
							<tbody id="novelList">
								<tr class="active">
									<td colspan="7">
										<div class="dib-wrap">
											<a id="create-book" class=""
												style="padding:9px;background:#1FA9FF;border-radius: 3px;"
												url-chapter="#" data-catid="20001" href="javascript:"><span
												class="icon"></span><i style="color:#fff;">创建作品</i></a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 翻页组件 -->
					<div id="pager" class="pageBox fr" style="display: block;"></div>
				</div>
			</c:if>

			<!--  <div id="bookManageNone" class="worksCtrlWrap hidden">
            <div class="null">
                <img src="https://img1.write.qq.com/writer/p1/src/null.png" width="204" height="148">
                <p>你没有发布任何作品，<a class="button" id="createNovelBtn2" href="/contentv2/booknovels/createsite">创建作品</a></p>
            </div>
        </div>-->
			<!-- start 操作确认-->


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
	<!--自己的js  -->
	<script src="resources/js/chapterwrite/chapterwrite.js"
		type="text/javascript"></script>
	<script>
		$('#create-book').on('click', function() {
			layer.open({
				type : 2,
				resize : false,
				move : false,
				title : [ '创建书籍', 'font-size:18px;' ],
				fixed : true,
				area : [ '850px', '460px' ],
				shadeClose : false, //点击遮罩关闭
				content : 'common/createbook/createbook.jsp'
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
