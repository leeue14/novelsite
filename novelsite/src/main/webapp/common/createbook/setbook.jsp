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

<title>修改书籍</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/createbook/createbook.css">

</head>

<body>
	<input value="${sessionScope.setBook.bookId}" id="bookId"
		style="display: none;" />
	<div class="create_wrap">
		<div class="create_content">
			<table style="padding: 8px;margin-top: 40px;">
				<colgroup>
					<col width="100px">
					<col width="32px">
					<col width="240px">
				</colgroup>
				<tbody>
					<tr>
						<td style="text-align: left">作品封面:</td>
						<td></td>
						<td style="text-align: left"><a href="javascript:;"
							class="file">修改封面 <input type="file" name="cover" id="cover">
						</a></td>
					</tr>
					<tr>
						<td style="text-align: left">作品名称:</td>
						<td></td>
						<td style="text-align: center"><input id="name" name="name"
							value="${sessionScope.setBook.name}"></td>
					</tr>
					<tr>
						<td style="text-align: left">作品类型:</td>
						<td></td>
						<td style="text-align: left"><select
							style="width: 110px;height: 30px;" id="categoryParentId">
								<option>玄幻</option>
						</select> <select style="width: 110px;height: 30px;" id="categoryId"
							name="categoryId">
								<option>东方玄幻</option>
						</select></td>
					</tr>
					<tr>
						<td style="text-align: left">作品状态:</td>
						<td></td>
						<td style="text-align: left"><select
							style="width: 110px;height: 30px;" id="status" name="status">
								<c:if test="${sessionScope.setBook.status==0 }">
									<option data-id="0" selected="selected">连载中</option>
									<option data-id="1">已完结</option>
								</c:if>
								<c:if test="${sessionScope.setBook.status==1 }">
									<option data-id="0" >连载中</option>
									<option data-id="1" selected="selected">已完结</option>
								</c:if>

						</select></td>
					</tr>
					<tr>
						<td style="text-align: left">作品标签:</td>
						<td></td>
						<td style="text-align: center"><input id="cat" name="cat"
							value="${sessionScope.setBook.cat}"></td>
					</tr>
					<tr>
						<td style="text-align: left">作品介绍:</td>
						<td></td>
						<td style="text-align: center"><input placeholder="请输入作品介绍"
							id="shortInfo" name="shortInfo"
							value="${sessionScope.setBook.shortInfo}"></td>
					</tr>

				</tbody>
			</table>
			<div class="btn-group">
				<button class="layui-btn" style="margin-right: 20px;" id="set-book">保存更改</button>
				<a id="cancel"
					class=" layui-layer-close layui-layer-close1 layui-btn layui-btn-warm">取消</a>
			</div>
		</div>
	</div>
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<!-- 自己的js -->
	<script src="resources/js/setbook/setbook.js" type="text/javascript"></script>
	<script>
		$(".file").on("change", "input[type='file']", function() {
			var filePath = $(this).val();
			layer.msg(filePath);
		});
		$("#cancel").click(function() {
			var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引   
			parent.layer.close(frameindex); //再执行关闭
		});
	</script>
</body>
</html>
