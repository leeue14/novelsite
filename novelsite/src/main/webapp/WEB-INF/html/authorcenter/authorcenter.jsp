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

<title>作家专区</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/base.css">

<link rel="stylesheet" href="resources/css/authorcenter/authorcenter.css">

</head>

<body>
	<div class="wrap login">
		<div class="header">
			<div class="headBox pageCenter clearfix">
				<a href="/novelsite/author/authorcenter"><img class="logo fl"
					src="https://img1.write.qq.com/writer/p1/contentv2/logo.png"
					width="225" height="28" alt="阅文·作家专区"></a>
				<div class="headUser fr">
					<a class="exit" href="/novelsite/indexview/index"><span class="icon"></span>退出登录</a>
				</div>
			</div>
		</div>


	</div>

	<div class="mainWrap pageCenter clearfix">
		<div id="leftNav" class="mainLeft fl" style="visibility: visible;">
			<div class="sideBar" id="main-bar">
				<ul>
					<li class="act"><a href="/novelsite/author/authorcenter"><span class="home"></span>专区首页</a>
					</li>
					<li><a href="/novelsite/chapter/chapterwrite"><span class="works"></span>作品管理</a>
					</li>
					<!---->
					<!-- <li><a href="/income/index.html"><span class="income"></span>稿酬收入</a>
					</li> -->
				</ul>
			</div>


		</div>

		<div class="mainRight pb260 fl">
			<div class="authorInfoWrap clearfix">
				<div class="headPhotoBox fl">
					<span></span> <img
						src="https://img1.write.qq.com/writer/p1/contentv2/photo_default.png"
						width="86" height="86">
				</div>
				<div class="authorInfoBox fl">
					<h3>
						${sessionScope.author.penName }
						<!-- 增加身份标识"ico-level",silver为白金作家，dashen为大神作家 -->
					</h3>
					<p>
						今天是${sessionScope.nowDate }<!-- ，本月您已更新<i class="Num">0</i>天，共计更新<i
							class="Num curmonthcount">0</i>字 -->
					</p>
				</div>
			</div>
			<div class="midContentWrap">
				<h3 class="title_h3">
					<span class="icon news"></span>作家新闻
				</h3>
				<div class="newsListWrap">
					<!-- 新闻列表 -->
					<ul id="newsList">
					<c:forEach var="item" items="${requestScope.xinwen}"  varStatus="status">
					
						<li class="act">
						<a data-node="link" data-newsid="1073288"
							class="link " href="/novelsite/newsmanage/readnews?id=${item.newsId }" target="_blank">
							<em>${item.uploadDate}</em>
							<span class="on"></span>${item.newsTitle}</a>
						</li> 
						
					</c:forEach>
						
									
						<!--  <li><a data-node="link" data-newsid="1073287" class="link visited"
							href="/News?id=1073287" target="_blank"><em>2017.12.28
									13:59</em><span class="on">
									</span>月票大战一触即发，双倍月票限时开启！</a></li> -->
					<!--
						<li><a data-node="link" data-newsid="1073286" class="link"
							href="/News?id=1073286" target="_blank"><em>2017.12.08
									18:09</em><span class="on"></span>2017泛灵异征文报名进入最后冲刺阶段</a></li>
						<li><a data-node="link" data-newsid="1073285" class="link"
							href="/News?id=1073285" target="_blank"><em>2017.12.06
									16:06</em><span class="on"></span>二次元福利，火热进行中</a></li>
						<li><a data-node="link" data-newsid="1073283" class="link"
							href="/News?id=1073283" target="_blank"><em>2017.11.22
									10:40</em><span class="on"></span>二次元频道一帝四皇通缉令，第三批奖名单正式公布！</a></li>
						<li><a data-node="link" data-newsid="1073281" class="link"
							href="/News?id=1073281" target="_blank"><em>2017.11.15
									11:24</em><span class="on"></span>2017玄幻征文获奖名单发布</a></li>
						<li><a data-node="link" data-newsid="1073280" class="link"
							href="/News?id=1073280" target="_blank"><em>2017.11.13
									17:51</em><span class="on"></span>历史新纪元脑洞风暴征文</a></li>
						<li><a data-node="link" data-newsid="1073278" class="link"
							href="/News?id=1073278" target="_blank"><em>2017.10.16
									13:37</em><span class="on"></span>作家专区服务器维护通知</a></li>
						<li><a data-node="link" data-newsid="1073276" class="link"
							href="/News?id=1073276" target="_blank"><em>2017.10.12
									13:04</em><span class="on"></span>历史新纪元征文结果公布</a></li>
						<li><a data-node="link" data-newsid="1073275" class="link"
							href="/News?id=1073275" target="_blank"><em>2017.09.28
									09:57</em><span class="on"></span>嗨翻黄金周 月票双倍投起来</a></li> -->
					</ul>
				</div>
			</div>
			<div id="pagerBox" class="pageBox fr">
				<%-- <p>
					<span>1/14</span><a href="javascript:;" class="nextBtn"><cite
						class="icon"></cite></a><input type="text"><a class="jump"
						href="javascript:;">跳转</a>
				</p> --%>
			</div>
			<img id="requestLoadingTip" class="loadImg" style="display: none;"
				src="https://img1.write.qq.com/writer/p1/contentv2/loading.gif">
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
	<script src="resources/js/chapterwrite/chapterwrite.js"
		type="text/javascript"></script>
</body>
</html>
