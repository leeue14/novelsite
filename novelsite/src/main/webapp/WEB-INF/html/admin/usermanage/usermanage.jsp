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



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="resources/admin/css/login.css">
<link rel="stylesheet" href="resources/admin/css/H-ui.reset.css">
<link rel="stylesheet" href="resources/admin/css/style.css">
<!--H-ui框架的引用css-->
<!--[if lt IE 9]-->
<script type="text/javascript" src="resources/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="resources/admin/lib/respond.min.js"></script>
<!--引用的css-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui.admin/css/H-ui.admin.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/layer/2.4/skin/layer.css" />


<!--引用的css-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui/css/H-ui.reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui.admin/css/H-ui.admin.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="resources/admin/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="resources/admin/lib/layer-v3.0.3/layer/skin/default/layer.css" />
<script type="text/javascript"
	src="resources/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/page/page.css">
<!-- <link rel="stylesheet" href="resources/css/index/H-ui.reset.css"> -->

<style>
.tdhidden {
	overflow: hidden;
	width: 200px;
	white-space: nowrap;
	text-overflow: ellipsis;
}

a:hover {
	text-decoration: none;
}

a:hover,.active a {
	color: #333;
}

.tda {
	color: #333;
}
</style>
</head>

<body>
	<div class="mt-50">
		<div style="height: 600px;width: 1000px;margin: 0 auto;"
			class="text-c">
			<div style="height: 600px;width: 1000px;margin: 0 auto;">
				<div style="height: 600px;width: 900px;" class="text-c">
					<table class="table">
						<tbody class="text-c">
							<tr>
								<td><label>&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><input type="text" class="input-text radius" value=""
									placeholder="输入用户名或邮箱" id="name" name="name"></td>
								<td><a id="search" href="/novelsite/usermanage/usermanageindex"
										class="btn btn-primary radius" style="width: 60px;" value="搜索">搜索</a>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<table class="table table-border table-bg table-bordered"
										style="table-layout:fixed;">
										<thead>
											<tr>
												<th>读者昵称</th>
												<th>注册时间</th>
												<th>绑定email</th>
												<th>个人简介</th>
												<!-- <th>账户状态</th> -->
												<th colspan="">操作</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<c:forEach var="item"
												items="${requestScope.readerPageBean.list}"
												varStatus="status">
												<tr class="active">
													<td class="tdhidden "><a class="tda"
														title="${item.nickName }">${item.nickName }</a></td>
													<td class="tdhidden"><a class="tda"
														title="${item.createTime }">${item.createTime }</a></td>
													<td class="tdhidden"><a class="tda"
														title="${item.email}">${item.email}</a></td>
													<td
														style="overflow:hidden;width:200px;white-space:nowrap;text-overflow:ellipsis;">
														<a class="tda" title="${item.shortInfo}">${item.shortInfo}</a>
													</td>
													<%-- <td class="tdhidden"><a class="tda">${item.status}</a></td> --%>
													<td colspan="">
													
													<c:if test="${item.status==0}">
													 <a href="/novelsite/usermanage/userdelete?readerId=${item.readerId }&status=1"
														class="btn btn-success radius" type="button" value="删除">启用</a>
													</c:if>
													
													<c:if test="${item.status==1}">
													 <a href="/novelsite/usermanage/userdelete?readerId=${item.readerId }&status=0"
														class="btn btn-danger radius" type="button" value="删除">停用</a>
													</c:if>
														
													</td>
												</tr>

											</c:forEach>
											<!-- <tr class="active">
												<td>哈哈哈</td>
												<td >2018年02月28日 23:37:16</td>
												<td>1264308633@qq.com</td>
												<td style="width: 70px; overflow:hidden;text-overflow:ellipsis; white-space: nowrap;">
												好人啊好人啊好人啊好人啊好人啊好人好人啊好人啊好人啊好人啊好人啊好人啊啊好人啊
												</td>
															<td><input class="btn btn-primary radius" type="button"
													value="禁用"></td>
																
												<td> <input class="btn btn-danger radius"
													type="button" value="删除"> <a href="#">删除</a> <a href="#">删除</a> <a href="#">删除</a>
												</td>
											</tr> -->
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="c-full-page">
						<span class="total">共<span class="c-gold">${requestScope.readerPageBean.totalPage}</span>页

						</span>
						<c:if test="${requestScope.readerPageBean.pageNum >1 }">
							<a
								href="${requestScope.link}pageNum=${requestScope.readerPageBean.pageNum-1}"
								class="prev">上一页</a>
						</c:if>

						<c:forEach var="i" step="1"
							begin="${requestScope.readerPageBean.start}"
							end="${requestScope.readerPageBean.end}">
							<ul class="pageNumber">
								<c:if test="${requestScope.readerPageBean.pageNum == i}">
									<li class="active"><a
										href="${requestScope.link}pageNum=${i}">${i}</a></li>
								</c:if>
								<c:if test="${requestScope.readerPageBean.pageNum != i}">
									<li class=""><a
										href="${requestScope.link}pageNum=${i}">${i}</a></li>
								</c:if>

							</ul>
						</c:forEach>
						<c:if
							test="${requestScope.readerPageBean.pageNum < requestScope.readerPageBean.totalPage}">
							<a
								href="${requestScope.link}pageNum=${requestScope.readerPageBean.pageNum+1}"
								class="next">下一页</a>
						</c:if>
						<%-- <div class="jump">
					<span>跳转到</span> <input id="page-input" class="page-input"
						type="text" name="pageNumber" value="">
					<button id="page-go" class="page-go" type="button"
					data-link="${requestScope.pageLink}"
					data-name="${requestScope.bookName }"
						data-total="${requestScope.readerPageBean.totalPage}">GO</button>
				</div> --%>
					</div>

				</div>
			</div>




		</div>



	</div>



	<!--引用的js代码-->
	<script type="text/javascript"
		src="resources/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="resources/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="resources/admin/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="resources/admin/static/h-ui/js/H-ui.min.js"></script>

	<script type="text/javascript"
		src="resources/admin/static/h-ui.admin/js/H-ui.admin.page.js"></script>


	<script>
		/* 搜索 */
		function search() {
			 var name = $("#name").val();
			var formData = new FormData();
			formData.append("name",name);
			var url = "/novelsite/usermanage/usermanagesearch" 
			$.ajax({
				url : "/novelsite/usermanage/usermanagesearch",
				type : "POST",
				contentType : false,
				processData : false,
				cache : false,
				data : formData,
				success : function(data) {
					if (data.success) {
						
					}
				}
			}); 
		}
		
		$(function(){
			$("#name").change(function(){
				  var name = $("#name").val();
				  $("#search").attr("href","/novelsite/usermanage/usermanagesearch?name="+name);
				});
		});
	</script>
</body>
</html>
