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
<title>我的书架</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">

<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/lib/layui/css/layui.css">
<link rel="stylesheet" href="resources/css/index/index.css">
<link rel="stylesheet" href="resources/css/top/top.css">
<link rel="stylesheet" href="resources/css/page/page.css">
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
							<h1 class="my_shelf p_current">
								<a href="/novelsite/usercenter/bookshelf">我的书架</a>
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
							<!-- <div id="Sign_in">
								<a href="javascript:void(0);" onclick="signin();" title="签到"><img
									src="resources/images/usercenter/sign.png" alt="签到"></a>
							</div> -->

							<a class="pService" href="#" target="_blank"></a>
						</div>
					</div>
				</div>
			</div>


			<!--中间书架  -->




			<div class="personal_main main_noright">
				<div id="mainTabList" class="main_h1tab main_long_bottom">
					<h1 class="cf">
						<span class="p_myshlef main_current">我的书架</span>

						<!--  <b class="one_line">|</b><span class="p_friend_shlef ">最近阅读</span> -->
					</h1>
					<i>书架容量(${fn:length(requestScope.bookShelfPageBean.list)})</i>
				</div>
				<!--主要内容的页签-->
				<div id="mainContentList" class="main_tab_wrap">
					<!--我的书架-->
					<div class="my_bookshelf">
						<div id="my_bookshelf" align="center">
							<table class="shelf_tab" border="0" cellspacing="0">
								<colgroup>

							
									<col width="10%">
								<%-- 	<col width="40%"> --%>
									<%-- <col width="10%"> --%>
									<col width="20%">
									<col width="21%">
									<col width="10%">
								</colgroup>
								<thead bgcolor="#EAEAEA">
									<tr>

										
										<!-- <th>类别</th> -->
										<th>作品</th>
										<!-- <th>最近更新</th> -->
										<th>上次阅读到</th>
										<th>作者</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="bookListByBookshelf">
									<c:forEach var="item"
										items="${requestScope.bookShelfPageBean.list}" begin="0"
										end="4">
										<tr>

									
											<%-- <td class="gray"><a class="gray"
												href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=1&major=${item.type }"
												target="_blank">[${item.type }]</a>
											</td> --%>
											<c:if test="${item.site=='zhuishuvip' }">
											<td ><a style="text-align:center;"
											href="/novelsite/bookview/bookmain?bookid=${item.bookId}"
												target="_blank" class="green">${item.bookName}</a>
												
											</td>
											
												<td><a class="red2"
												href="/novelsite/bookview/bookmain?bookid=${item.bookId}"
												title="上次阅读至：${item.title}" target="_blank">${item.title }</a>
												</td>
											</c:if>
											<c:if test="${item.site=='novelsite' }">
											<td ><a style="text-align:center;"
											href="/novelsite/localbook/querybook?bookid=${item.bookId}"
												target="_blank" class="green">${item.bookName}</a>
												
											</td>
											
												<td><a class="red2"
												href="/novelsite/localbook/querycatalog?bookid=${item.bookId}"
												title="上次阅读至：${item.title}" target="_blank">${item.title }</a>
												</td>
											</c:if>
									
											<td>
											<a class="gray3"
												href="/novelsite/search/searchbook?bookName=${item.author }&pageNum=1"
												target="_blank"><span
													style="width:70px;overflow:hidden;text-overflow:ellipsis;">${item.author }</span></a>
											</td>
											<td  style="text-align:center;"><a id="deletebookShelf" data-id="${item.bookShelfId}" href="javascript:;">移除书架</a></td>
										</tr>

									</c:forEach>



								</tbody>
							</table>
						</div>
						<div class="c-full-page">
				<span class="total">共<span class="c-gold">${requestScope.bookShelfPageBean.totalPage}</span>页

				</span>
				<c:if test="${requestScope.bookShelfPageBean.pageNum >1 }">
					<a
						href="/novelsite/usercenter/bookshelf?pageNum=${requestScope.bookShelfPageBean.pageNum-1}"
						class="prev">上一页</a>
				</c:if>
				
				<c:forEach var="i" step="1"
					begin="${requestScope.bookShelfPageBean.start}"
					end="${requestScope.bookShelfPageBean.end}">
					<ul class="pageNumber">
						<c:if test="${requestScope.bookShelfPageBean.pageNum == i}">
							<li class="active"><a
								href="/novelsite/usercenter/bookshelf?pageNum=${i}">${i}</a></li>
						</c:if>
						<c:if test="${requestScope.bookShelfPageBean.pageNum != i}">
							<li class=""><a
								href="/novelsite/usercenter/bookshelf?pageNum=${i}">${i}</a></li>
						</c:if>

					</ul>
				</c:forEach>
				<c:if
					test="${requestScope.bookShelfPageBean.pageNum < requestScope.bookShelfPageBean.totalPage}">
					<a
						href="/novelsite/usercenter/bookshelf?pageNum=${requestScope.bookShelfPageBean.pageNum+1}"
						class="next">下一页</a>
				</c:if>
				<div class="jump">
					<span>跳转到</span> <input id="page-input" class="page-input"
						type="text" name="pageNumber" value="">
					<button id="page-go" class="page-go" type="button"
						data-total="${requestScope.bookShelfPageBean.totalPage}">GO</button>
				</div>
			</div>
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
	<script src="resources/js/usercenter/usercenter.js"
		type="text/javascript"></script>
		
		<script src="resources/js/bookshelf/bookshelf.js"
		type="text/javascript"></script>
		<!--书架操作js  -->
			<script src="resources/js/common/addbookshelf.js" type="text/javascript"></script>
</body>
</html>
