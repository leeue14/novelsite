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
<title>轩文阁网络在线书库</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/login/login.css">
<link rel="stylesheet" href="resources/css/usercenter/usercenter.css">
<link rel="stylesheet" href="resources/css/stack/stack.css">
</head>

<body>
	<div>
		<iframe src="common/top/index.jsp" width="100%" height="120"
			scrolling="no" frameborder='0'
			style="margin: 0;padding: 0;
            "></iframe>
	</div>
	<div class="wrap" style="margin-top: -60px;">
		<div class="rank_mainbox_sk">
			<div class="topbox">
				<h1>网络在线书库</h1>
				<span>全网精品小说任你选读</span>
			</div>
			<ul>
				<!--             <li class="fenzhan">
                <b><span>作品分站：</span></b>
               <select >
                   <option>本站小说</option>
                   <option>网文小说</option>
               </select>

            </li> -->
				<li class="fenlei"><b class="top"><span>小说分类：</span> <!--    <a href="/bk/" id="a_Subjectid_active_">全部</a> -->
						<c:forEach var="item" items="${requestScope.categoryParent}">
							<c:if test="${item.categoryName== requestScope.major}">
								<a class="active" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.categoryId}&parentId=${item.categoryId}&major=${item.categoryName}"
									id="a_Subjectid_active_20001">${item.categoryName}</a>
							</c:if>

							<c:if test="${item.categoryName!= requestScope.major}">
								<a class=""  href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.categoryId}&parentId=${item.categoryId}&major=${item.categoryName}"
									id="a_Subjectid_active_20001">${item.categoryName}</a>
							</c:if>
							<a rel="nofollow" href="&#10; " id="a_Contentid_active_"></a>
						</c:forEach> </b>
					<p class="smallbox">
						<c:if test="${requestScope.minor=='全部'}">
							<a rel="nofollow" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}" class="active"
								id="a_Contentid_active_">全部</a>
						</c:if>
						<c:if test="${requestScope.minor!='全部'}">
							<a rel="nofollow" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}" id="a_Contentid_active_">全部</a>
						</c:if>
						<c:forEach var="item" items="${requestScope.category}">
							<c:if test="${item.categoryName == requestScope.minor}">
								<a rel="nofollow" class="active"
									href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}"
									id="a_Contentid_active_">${item.categoryName}</a>
							</c:if>
							<c:if test="${item.categoryName!= requestScope.minor}">
								<a rel="nofollow" href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}" id="a_Contentid_active_">${item.categoryName}</a>
							</c:if>

						</c:forEach>

					</p></li>

			<%-- 	<li><b><span>写作进度：</span>
				
				<c:if test="${requestScope.type=='hot'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}&type=new" 
						id="a_Isvip_active_all"></a>
				</c:if>
				<c:if test="${requestScope.type=='over'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}&type=new" class="active"
						id="a_Isvip_active_all">新书</a>
				</c:if>
				<c:if test="${requestScope.type!='over'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}&type=new" 
						id="a_Isvip_active_all">新书</a>
				</c:if>
				
						
				<c:if test="${requestScope.type=='new'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}&type=new" class="active"
						id="a_Isvip_active_all">新书</a>
				</c:if>
				<c:if test="${requestScope.type!='new'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${item.parentId}&parentId=${item.parentId}&minor=${item.categoryName}&type=new" 
						id="a_Isvip_active_all">新书</a>
				</c:if>
						
						
						</b></li> --%>
						
						
<!-- 
				<li>
					      排序方式：字数排序 更新时间排序 周人气 月人气 总人气 周推荐 月推荐 总推荐 <b><span>排序方式：</span><a
						rel="nofollow" href="http://chuangshi.qq.com/bk/" class="active"
						id="a_Sortby_active_all">默认</a><a rel="nofollow"
						href="http://chuangshi.qq.com/bk/so1/" id="a_Sortby_active_1">字数排序</a><a
						rel="nofollow" href="http://chuangshi.qq.com/bk/so2/"
						id="a_Sortby_active_2">更新时间</a><a rel="nofollow"
						href="http://chuangshi.qq.com/bk/so3/" id="a_Sortby_active_3">周人气</a><a
						rel="nofollow" href="http://chuangshi.qq.com/bk/so4/"
						id="a_Sortby_active_4">月人气</a><a rel="nofollow"
						href="http://chuangshi.qq.com/bk/so5/" id="a_Sortby_active_5">总人气</a><a
						rel="nofollow" href="http://chuangshi.qq.com/bk/so6/"
						id="a_Sortby_active_6">周推荐</a><a rel="nofollow"
						href="http://chuangshi.qq.com/bk/so7/" id="a_Sortby_active_7">月推荐</a></b>
				</li> -->

				<li><b><span>更多筛选：</span>
				<c:if test="${requestScope.type=='hot'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=hot" class="active"
						id="a_Isvip_active_all">热门</a>
				</c:if>
				<c:if test="${requestScope.type!='hot'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=hot" 
						id="a_Isvip_active_all">热门</a>
				</c:if>
				
				<c:if test="${requestScope.type=='reputation'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=reputation" class="active"
						id="a_Isvip_active_all">好评</a>
				</c:if>
				<c:if test="${requestScope.type!='reputation'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=reputation" 
						id="a_Isvip_active_all">好评</a>
				</c:if>
				
				<c:if test="${requestScope.type=='new'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=new" class="active"
						id="a_Isvip_active_all">新书</a>
				</c:if>
				<c:if test="${requestScope.type!='new'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=new" 
						id="a_Isvip_active_all">新书</a>
				</c:if>
				<c:if test="${requestScope.type=='over'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=over" class="active"
						id="a_Isvip_active_all">完结</a>
				</c:if>
				<c:if test="${requestScope.type!='over'}">
					<a rel="nofollow"
						href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&major=${requestScope.major}&minor=${requestScope.minor}&type=over" 
						id="a_Isvip_active_all">完结</a>
				</c:if>
				
			<!-- <a rel="nofollow"
						href="http://chuangshi.qq.com/bk/vi2/" id="a_Isvip_active_2">新书</a>
						<a rel="nofollow" href="http://chuangshi.qq.com/bk/vi1/"
						id="a_Isvip_active_1">好评</a> <a rel="nofollow"
						href="http://chuangshi.qq.com/bk/vi2/" id="a_Isvip_active_2">完结</a> -->
				</b>
				</li>
			</ul>
		</div>
		<div class="allbooklist">
			<div class="leftlist">
				<div class="topbox">
					<span class="left">${requestScope.typeName } - 每页显示20部小说</span><span
						class="right">${requestScope.bookPageBean.pageNum}/${requestScope.bookPageBean.totalPage}页
					</span>
				</div>
				<div class="books-list clearfix">

					<c:forEach var="item" items="${requestScope.bookPageBean.list}">
						<%-- <c:if test="${item.site =='zhuishuvip'}"> --%>
							<a href="/novelsite/bookview/bookmain?bookid=${item._id}"
								class="book" target="_blank"> <img
								onerror="this.src='../novelCover/date/bookId/nocover/nocover.jpg'"
								src="http://statics.zhuishushenqi.com${item.cover}"
								alt="${item.title}" class="cover">
								<div class="right">
									<h4 class="name">
										<span>${item.title}</span>
									</h4>
									<p class="author">
										<span>${item.author}</span> <span class="split">|</span><span>${requestScope.major}</span>
									</p>
									<p class="desc">${item.shortIntro}</p>
								</div>
							</a>
					<%-- 	</c:if> --%>

					</c:forEach>


				</div>
			</div>
			
			<!-- 分页 -->
			<div class="c-full-page">
				<span class="total">共<span class="c-gold">${requestScope.bookPageBean.totalPage}</span>页

				</span>
				<c:if test="${requestScope.bookPageBean.pageNum >1 }">
					<a
						href="/novelsite/stack/indexstack?pageNum=${requestScope.bookPageBean.pageNum-1 }&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&minor=${requestScope.minor}"
						class="prev">上一页</a>
				</c:if>
				
				<c:forEach var="i" step="1"
					begin="${requestScope.bookPageBean.start}"
					end="${requestScope.bookPageBean.end}">
					<ul class="pageNumber">
						<c:if test="${requestScope.bookPageBean.pageNum == i}">
							<li class="active"><a
								href="/novelsite/stack/indexstack?pageNum=${i}&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&minor=${requestScope.minor}">${i}</a></li>
						</c:if>
						<c:if test="${requestScope.bookPageBean.pageNum != i}">
							<li class=""><a
								href="/novelsite/stack/indexstack?pageNum=${i}&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&minor=${requestScope.minor}">${i}</a></li>
						</c:if>

					</ul>
				</c:forEach>
				<c:if
					test="${requestScope.bookPageBean.pageNum < requestScope.bookPageBean.totalPage}">
					<a
						href="/novelsite/stack/indexstack?pageNum=${requestScope.bookPageBean.pageNum+1 }&categoryParentId=${requestScope.parentId}&parentId=${requestScope.parentId}&minor=${requestScope.minor}"
						class="next">下一页</a>
				</c:if>
				<div class="jump">
					<span>跳转到</span> <input id="page-input" class="page-input"
						type="text" name="pageNumber" value="">
					<button id="page-go" class="page-go" type="button"
						data-total="${requestScope.bookPageBean.totalPage}">GO</button>
				</div>
			</div>
		<!--分页end  -->
		
		</div>


	</div>
	<iframe src="common/footer/footer.html" width="100%" height="110"
		scrolling="no" frameborder='0' style="position: relative;bottom: 0px;"></iframe>


<script src="resources/js/common/common.js" type="text/javascript"></script>
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<!-- 登录注册 -->
	<script src="resources/js/index/index.js" type="text/javascript"></script>
	
	<!--分页用的js  -->
	<script src="resources/js/stack/stack.js" type="text/javascript"></script>
	<script type="text/javascript">
		//窗口如果嵌套出错了用这个方法
		if (self.location != top.location) {
			top.location = self.location;
		}
	</script>
</body>
</html>
