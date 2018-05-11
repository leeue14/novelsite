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
<title>轩文阁小说阅读网</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/css/index/index.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/lib/layui/css/layui.css">

</head>

<body>
	<!--头部内容开始-->
	<div class="head">
		<div class="top_nav">

			<div class="top_nav_left">
				<ul>
					<li><a href="#">设为首页</a></li>
					<li><a href="#">一键收藏</a></li>
				</ul>
			</div>
			<!--top_nav_left结束-->
			<div class="top_nav_right">
				<!-- <li><a href="#">个人中心</a></li> -->
				<!-- <li><a href="#">最近阅读</a></li> -->
				<!-- <li><a href="#">充值</a></li> -->
				<c:if test="${sessionScope.reader == null}">
					<li><a href="javascript:void(0)" onclick="alertRegist()">注册</a></li>
					<li><a href="javascript:void(0)" onclick="alertLogin()">登录</a></li>
				</c:if>
				<c:if test="${sessionScope.reader != null}">
					<li><a href="javascript:void(0)" onclick="loginOut()">退出</a></li>
					<li style="width:150px;"><a href="/novelsite/usercenter/index"
						onclick="">欢迎您,${sessionScope.reader.nickName }</a></li>
				</c:if>


			</div>
			<!--top_nav_right结束-->
		</div>
	</div>
	<!--头部内容结束-->
	<!-- 广告和logo -->
	<div class="index_logo clearfix">
		<a class="main_logo" href="/novelsite/indexview/index"
			title="轩文阁小说阅读网"></a><a
			href="/novelsite/bookview/bookmain?bookid=50865988d7a545903b000009"
			target="_blank"><img src="resources/images/1507519561.jpg"
			class="main_banner" alt="" title="" height="90" width="724"></a>
	</div>
	<!--广告和logo结束-->
	<!--导航栏开始-->
	<div class="nav">
		<div class="hdnav">
			<div class="hdnav_left"></div>
			<div class="hdnav_mid">
				<div class="hdnav_mid_left">
					<ul>
						<li><a href="/novelsite/indexview/index">首页</a></li>
						<li><a href="/novelsite/search/searchindex?pageNum=1">一键搜书</a></li>
						<li><a href="/novelsite/stack/indexstack?pageNum=1">网络书库</a></li>
						<!-- <li><a href="#">充值</a></li> -->
					</ul>
				</div>
				<!--hdnav_mid_left结束-->
				<div class="hdnav_mid_right">
					<form>
						<input class="search_text" id="searchTop_input"
							placeholder="请输入小说名">
						<button id="searchTop_submitBtn"
							class="layui-btn layui-btn-small search_btn  layui-btn-warm"
							style="">搜索</button>
					</form>
				</div>
				<!--hadnav_mid_right结束-->
			</div>
			<!--hadnav_left结束-->
			<div class="hdnav_right"></div>

		</div>
		<!--上面的大导航栏结束-->
		<div class="bdnav">
			<div class=""></div>
			<div class="bdnav_content">
				<ul>
					<li><a href="/novelsite/stack/indexstack?pageNum=1">玄幻小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=3&major=武侠">武侠小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=5&major=都市">都市小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=7&major=军事">军事小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=6&major=历史">架空历史</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=10&major=游戏">游戏小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=9&major=科幻">科幻小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=12&major=同人">同人小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=8&major=灵异">灵异小说</a></li>
					<li><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=73&major=轻小说">轻小说</a></li>
					
				</ul>
			</div>

		</div>
		<!--下面的导航栏结束-->
	</div>
	<!--nav导航栏结束-->
	<!--主体强推开始-->
	<div class="main">
		<div class="main_content">
			<div class="main_left">
				<div class="indexLeftList">
					<h3 class="title_h3">追书最热榜</h3>
					<div class="qiangtui">
						<ul id="week-rank">
							<c:forEach var="item" begin="0" end="15"
								items="${rankmap.weekrank.week.ranking.books}">

								<li><span class="type"> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.minorCate}]</a></span>
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}"
									alt="${item.title}" title="${item.title}">${item.title}</a></li>
							</c:forEach>

						</ul>
					</div>

				</div>

			</div>
			<!--main_left结束-->
			<div class="main_center">
				<div class="main_center_top" id="picBox">
					<div class="loading">
						<img src="../resources/images/1_demo_image/images/loading.gif"
							alt="图片加载中...">
					</div>
					<div class="pic">
						<ul>
							<li><a
								href="/novelsite/bookview/bookmain?bookid=58725861cc32d42f4c1ef673"><img
									src="/novelsite/resources/images/book01.jpg" alt="苍生系统"
									text="哈哈"></a></li>
							<li><a
								href="/novelsite/bookview/bookmain?bookid=58c801e77c28f374629877aa"><img
									src="/novelsite/resources/images/book02.jpg" alt="穿越系统"
									text="哈哈"></a></li>
							<li><a
								href="/novelsite/bookview/bookmain?bookid=58f06489bc9dfe1b4d94db2a"><img
									src="/novelsite/resources/images/book03.jpg" alt="凌天剑神"
									text="哈哈"></a></li>
							<li><a
								href="/novelsite/bookview/bookmain?bookid=522f3149f98fdbe13c00bbe4"><img
									src="/novelsite/resources/images/book04.jpg" alt="妖孽兵王"
									text="哈哈"></a></li>
							<li><a
								href="/novelsite/bookview/bookmain?bookid=58ec8a070416371008c9b665"><img
									src="/novelsite/resources/images/book05.jpg" alt="老板阎王"
									text="哈哈"></a></li>
						</ul>
					</div>
					<!--pic结束-->
				</div>
				<!--main_center_top结束-->
				<div class="main_center_bottom">
					<div class="salesRank">
						<div class="indexLeftList">
							<h3 class="title_h3">原创销售榜</h3>
						</div>
						<div class="sales">
							<div class="sales_book">
								<ul id="sale-rank">
									<c:forEach var="item" begin="0" end="27" varStatus="status"
										items="${rankmap.salerank.sale.ranking.books}">
										<c:if test="${status.index < 10 && status.index >=0}">
											<li><span class="num1">${status.index+1}</span> <span
												class="type"> <a
													href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.minorCate}]</a></span>
												<a href="/novelsite/bookview/bookmain?bookid=${item._id}"
												alt="${item.title}" title="${item.title}">${item.title}</a></li>
										</c:if>
										<c:if test="${status.index < 20 && status.index >=10}">
											<li><span class="num2">${status.index+1}</span> <span
												class="type"> <a
													href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.minorCate}]</a></span>
												<a href="/novelsite/bookview/bookmain?bookid=${item._id}"
												alt="${item.title}" title="${item.title}">${item.title}</a></li>
										</c:if>
										<c:if test="${status.index <= 23 && status.index >=20}">
											<li><span class="num3">${status.index+1}</span> <span
												class="type"> <a
													href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.minorCate}]</a></span>
												<a href="/novelsite/bookview/bookmain?bookid=${item._id}"
												alt="${item.title}" title="${item.title}">${item.title}</a></li>
										</c:if>

									</c:forEach>
								</ul>
							</div>
						</div>
						<!--sales结束-->
					</div>
					<!--salesRank 结束-->
				</div>
				<!--main_center_bottom结束-->
			</div>
			<!--main_center结束-->
			<div class="main_right">
				<div class="main_right_top">
					<div class="indexLeftList">
						<h3 class="title_h3">大神推</h3>
					</div>
					<!--indexLeftList结束-->
					<div class="dashen">
						<div class="dashenimg">
							<a
								href="/novelsite/bookview/bookmain?bookid=59e2c2b08bde16e66f9e3b85">
								<img src="/novelsite/resources/images/dashentui.jpg"
								style="width: 180px;height: 76px;">
							</a>

						</div>
						<!--dashengimg 结束-->
						<div class="dashendesc">
							<p>【聚焦名家】猫腻</p>
							<p>【焦点新书】大道朝天</p>
							<p>大道朝天，各执一剑。</p>
						</div>
					</div>
					<!--dasheng结束-->
				</div>
				<!--main_right_top结束-->

				<div class="main_right_bottom">
					<div class="indexLeftList">
						<h3 class="title_h3">大家都在看</h3>
					</div>
					<!--indexLeftList结束-->

					<div class="noLoginRecList">

						<ul>
							<c:forEach var="item" begin="0" end="6" varStatus="status"
								items="${rankmap.salerank.sale.ranking.books}">
								<li><span>${item.minorCate}</span> <a
									href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title}</a></li>
							</c:forEach>
							<!-- 						
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li>
							<li><span>强者回归</span> <a href="#">圣墟</a></li> -->
						</ul>
					</div>
				</div>
				<!--main_right_bottom结束-->

			</div>
			<!--main_right结束-->
		</div>

	</div>
	<!--main结束-->

	<!--精品推荐开始 -->
	<div class="jingpin clearfix">
		<div class="novel_content">
			<div class="indexLeftList">
				<h3 class="title_h3">编辑强推</h3>
			</div>
			<!--indexLeftList结束-->
			<div class="novel_list">
				<c:forEach var="item" begin="0" end="3" varStatus="status"
					items="${requestScope.recommend.ranking.books}">
					<div class="novel_item">
						<img src="http://statics.zhuishushenqi.com${item.cover}"
							width="120" height="150">
						<dl class="novel_dl">
							<dt>
								<span>${item.author }</span> <a
									href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
							</dt>
							<dd>${item.shortIntro}</dd>
						</dl>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="jingdian_novel">
			<div class="indexLeftList">
				<h3 class="title_h3">女生推荐</h3>
			</div>
			<!--indexLeftList结束-->
			<div class="jingdian_novel_list">
				<ul>
					<c:forEach var="item" begin="0" end="9" varStatus="status"
						items="${requestScope.finishRank.ranking.books}">
						<li><span class="type"><a href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.minorCate}]</a></span>
							<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!--jingpin结束-->


	<!--有害信息举报专区-->
	<div class="banner">
		<div class="banner_ad">
			<a href="http://report.12377.cn:13225/toreportinputNormal_anis.do"
				target="_blank"> <img
				src="/novelsite/resources/images/youhai.jpg" width="1000"
				height="83"></a>
		</div>

	</div>
	<!--分类榜单开始-->
	<div class="novelType_list clearfix">
		<div class="typeList">
			<h3 class="">分类精选</h3>
		</div>
		<!--indexLeftList结束-->

		<!--玄幻奇幻-->
		<div class="list_num1">
			<div class="type_title clearfix">
				<h3 class="type_title_left">玄幻奇幻</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=1&major=玄幻">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeOne.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeOne.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->

		<!--武侠修真-->
		<div class="list_num1" style="margin-left: 47px">
			<div class="type_title clearfix">
				<h3 class="type_title_left">武侠修真</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=3&parentId=3">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeTwo.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeTwo.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->


		<!--都市现实-->
		<div class="list_num1" style="margin-left: 47px">
			<div class="type_title clearfix">
				<h3 class="type_title_left">都市娱乐</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=5&major=都市">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeThree.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeThree.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->

		<!--历史军事-->
		<div class="list_num1">
			<div class="type_title clearfix">
				<h3 class="type_title_left">历史军事</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=6&major=历史">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeFour.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeFour.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->

		<!--科幻游戏-->
		<div class="list_num1" style="margin-left: 47px">
			<div class="type_title clearfix">
				<h3 class="type_title_left">科幻游戏</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=9&major=科幻">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeFive.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeFive.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->

		<!--竞技悬疑-->
		<div class="list_num1" style="margin-left: 47px">
			<div class="type_title clearfix">
				<h3 class="type_title_left">竞技悬疑</h3>
				<span class="type_title_right"><a href="/novelsite/stack/indexstack?pageNum=1&categoryParentId=11&major=竞技">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->
			<div class="list_content">
				<c:forEach var="item" items="${sessionScope.indexTypeSix.books}"
					begin="0" end="1" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/novelsite/bookview/bookmain?bookid=${item._id}">
							<div class="img_novel_decr"
								style="border-bottom: 1px solid #CCCCCC">
								<img src="http://statics.zhuishushenqi.com${item.cover}"
									width="71" height="86">
								<dl class="list_content_dl">
									<dd>${item.shortIntro}</dd>
								</dl>
							</div>
						</a>
					</c:if>
				</c:forEach>

				<div class="list_novel_content clearfix">
					<c:forEach var="item" items="${sessionScope.indexTypeSix.books}"
						begin="0" end="5" varStatus="status">
						<c:if test="${status.index > 0}">
							<div class="fenlei_list_div clearfix">
								<div class="fenlei_left">
									<span class="num4">${status.index+1 }</span> <a
										href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title }</a>
								</div>
								<div class="fenlei_right">
									<a href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.author }</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>


			</div>
			<!--list_content结束-->
		</div>
		<!--list_num1结束-->
	</div>
	<!--novelType_list结束-->


	<!--最近更新-->
	<div class="update clearfix">
		<div class="update_left">
			<div class="update_title clearfix">
				<h3 class="type_title_left">最近更新</h3>
				<span class="type_title_right">
				<!-- <a href="#">更多&gt;&gt;</a> -->
				</span>
			</div>
			<div class="book_list">
				<ul>
				<c:forEach var="item" items="${requestScope.bookLists}">
				<li> 
				<a target="_blank" class="green  fl" style="font-size: 14px;"
						href="/novelsite/localbook/querybook?bookid=${item.bookId }">${item.name}</a> 
						<em><a
							class="gray2 fl" title="${item.chapterName }"
							href="/novelsite/localbook/querybook?bookid=${item.bookId }">
								${item.chapterName }</a></em> 
						<b class="fr gray2"
						style="font-size: 13px;    font-weight:normal;">${item.uploadTime }</b>
						<strong> <a target="_blank" class="gray2 clearfix fr"
							href="/novelsite/search/searchbook?bookName=${item.authorName }&pageNum=1">${item.authorName }</a>
					</strong>
					</li>
				</c:forEach>
					
					

				</ul>
			</div>

		</div>
		<!--update_left结束-->
		<div class="update_right">
			<div class="type_title clearfix">
				<h3 class="type_list_left">网文热搜榜</h3>
				<span class="type_title_right"><a href="#">更多&gt;&gt;</a></span>
			</div>
			<!--type_title结束-->

			<div class="click_list">
				<ul>
					<c:forEach var="item" begin="0" end="15" varStatus="status"
						items="${requestScope.hotSearch.ranking.books}">
						<li><span class="type"><a href="/novelsite/bookview/bookmain?bookid=${item._id}">[${item.majorCate}]</a></span> <a
							href="/novelsite/bookview/bookmain?bookid=${item._id}">${item.title}</a></li>
					</c:forEach>

					
				</ul>
			</div>
		</div>
		<!--update_right结束-->
	</div>
	<!--update结束-->


	<!--友情链接开始-->
	<div class="friendLink">
		<div class="typeList">
			<h3 class="">友情链接</h3>
			<span>（商务合作，QQ：1264308633）</span>
		</div>
		<!--indexLeftList结束-->
		<div class="friend_linkbox">
			<div class="link_list">
				<div class="friend_linkbox">
					<a href="http://book.qq.com" target="_blank">QQ阅读 </a>&nbsp; <a
						href="http://yunqi.qq.com/" target="_blank">云起书院 </a>&nbsp; <a
						href="http://www.qidian.com" target="_blank">起点中文网 </a>&nbsp; <a
						href="http://yuedu.163.com/yc" target="_blank">网易原创 </a>&nbsp; <a
						href="http://www.17k.com" target="_blank">17k小说网 </a>&nbsp; <a
						href="http://www.zongheng.com" target="_blank">纵横小说网 </a>&nbsp; <a
						href="http://book.sooyuu.com" target="_blank">电子书下载 </a>&nbsp; <a
						href="http://www.bayueju.com" target="_blank">八月居小说网 </a>&nbsp; <a
						href="http://www.2144.cn" target="_blank">2144小游戏 </a>&nbsp; <a
						href="http://www.heiyan.com/" target="_blank">黑岩阅读网 </a>&nbsp; <a
						href="http://www.shuhai.com" target="_blank">书海小说网 </a>&nbsp; <a
						href="http://www.yueloo.com" target="_blank">岳麓小说网 </a>&nbsp; <a
						href="http://www.lkong.net" target="_blank">龙的天空 </a>&nbsp; <a
						href="http://www.hongshu.com" target="_blank">红薯小说网 </a>&nbsp; <a
						href="http://www.motie.com" target="_blank">磨铁中文网 </a>&nbsp; <a
						href="http://b.faloo.com/" target="_blank">飞卢小说网 </a>&nbsp; <a
						href="http://www.kanshu.com" target="_blank">看书网小说 </a>&nbsp; <a
						href="http://www.ting85.com" target="_blank">畅听网 </a>&nbsp; <a
						href="http://www.tadu.com" target="_blank">塔读文学 </a>&nbsp; <a
						href="http://www.huanwen.com/" target="_blank">幻文小说网 </a>&nbsp; <a
						href="http://www.zhaoxiaoshuo.com" target="_blank">找小说 </a>&nbsp;
					<a href="http://www.fmx.cn" target="_blank">凤鸣轩小说网 </a>&nbsp; <a
						href="http://www.kting.cn" target="_blank">有声小说 </a>&nbsp; <a
						href="http://book.2345.com" target="_blank">2345小说大全 </a>&nbsp; <a
						href="http://www.qwsy.com" target="_blank">言情小说 </a>&nbsp; <a
						href="http://123.sogou.com/xiaoshuo" target="_blank">搜狗小说 </a>&nbsp;
					<a href="http://www.xiang5.com" target="_blank">香网 </a>&nbsp; <a
						href="http://book.114la.com" target="_blank">114啦小说 </a>&nbsp; <a
						href="http://www.3body.com" target="_blank">三体 </a>&nbsp; <a
						href="http://xiaoshuo.360.cn/" target="_blank">360小说 </a>&nbsp; <a
						href="http://www.rongshuxia.com" target="_blank">榕树下 </a>&nbsp; <a
						href="http://yc.ifeng.com/" target="_blank">凤凰原创 </a>&nbsp; <a
						href="http://www.9kus.com/" target="_blank">九库文学 </a>&nbsp; <a
						href="http://www.ichacha.net" target="_blank">在线翻译 </a>&nbsp; <a
						href="http://www.tiandizw.com/" target="_blank">天地中文网 </a>&nbsp; <a
						href="http://www.hengyan.com/" target="_blank">恒言中文网 </a>&nbsp; <a
						href="http://www.feihuo.com/" target="_blank">飞火游戏 </a>&nbsp; <a
						href="http://jswsol.gyyx.cn/Home/index.shtml" target="_blank">绝世武神OL
					</a>&nbsp; <a href="http://www.kaolafm.com" target="_blank">考拉FM电台
					</a>&nbsp; <a href="http://www.iyunyue.com/" target="_blank">云阅文学 </a>&nbsp;
					<a href="https://www.webnovel.com/" target="_blank">Qidian
						International </a>&nbsp; <a href="http://www.readnovel.com"
						target="_blank">小说阅读网 </a>&nbsp; <a href="http://www.xs8.cn"
						target="_blank">言情小说吧 </a>&nbsp; <a href="http://www.hongxiu.com"
						target="_blank">红袖添香 </a>&nbsp;
				</div>
				<!--friend_linkbox结束-->
			</div>
			<!--Link_list结束-->
		</div>
	</div>
	<!--friendLink结束-->
	<!--copyright开始-->
	<div class="copyRight">
		<div class="copyRight_foot">
			<div class="foot_nav">
				<a href="#">关于我们</a> <span>|</span> <a href="#">作者投稿</a> <span>|</span>
				<a href="#">诚聘英才</a> <span>|</span> <a href="#">服务协议</a> <span>|</span>
				<a href="#">网站地图</a> <span>|</span> <a href="#">用户指南</a> <span>|</span>
				<a href="#">联系我们</a>
			</div>
			<!--foot_nav结束-->
			<div class="foot_copyRight">
				<p>Copyright (C) 2017 leeue All Rights Reserved 成都东软学院2014级毕业设计 版权所有
					本网站由XXX提供服务器和带宽支持</p>
				<p>XXXXXX号 XXXXXXXXXXXX号 网络视听许可证XXXXXXXXX号
					增值电信业务经营许可证：XXX</p>
			</div>
		</div>
	</div>
	<!--copyRight结束-->
	<div id="zhe" class="layui-layer-shade" style="display: none;"></div>
	<div id="div_ywlogin"
		style="left: 50%; top: 50%; position: fixed; z-index: 9999; background: none; width: 392px; height: 408px; margin-left: -196px; margin-top: -204px; display: none;">
		<div class="login-wrap">
			<a class="close" id="close" href="javascript:" onclick="closeLogin()"><em
				class="iconfont">×</em></a>
			<div class="login-tab cf" id="j_loginTab">
				<ul>

					<li class="lang act" tab="qidian">账号登录</li>
					<!--  <li class="lang" tab="qq">QQ登录</li>
                <li class="lang" tab="weixin">微信登录</li>-->
				</ul>
			</div>

			<div class="login-switch-wrap">
				<div class="login-tab-wrap" id="j_loginSwitchWrap">
					<div class="login-box qd-login yw-login qidian-login hidden"
						style="display: block;">
						<div class="web-login-wrap">
							<div class="login-input-mode">
								<div class="login-mode input-mode show">
									<div class="error-tip hidden"></div>
									<dl>
										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="text" tabindex="1" placeholder="邮箱" id="email">
										</dd>
										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="password" tabindex="2"
												placeholder="以字母开头，长度在6~18之间，只能包含字母、数字和下划线" id="password">
										</dd>
									</dl>
									<div style="border: 1px solid #e6e6e6;margin-top: 10px;">
										<img type="captcha_img" alt="点击更换" title="点击更换"
											onclick="changeVerifyCode(this)" src="/novelsite/Kaptcha"
											style="cursor:pointer;"> <input placeholder="请输入验证码"
											id="login-j_captcha" style="height: 50px">
									</div>
									<div class="login-common-wrap">
										<div class="auto-login-box cf">
											<div class="link fr">
												<a href="##"
													target="_blank" id="forgetPsw">忘记密码</a>
											</div>
											<input type="checkbox" id="autologin" tabindex="3"
												name="checkbox"> <label for="autologin">自动登录</label>
										</div>
										<a id="loginsubmit"
											class="red-btn go-login btnLogin login-button"
											href="javascript:">登 录</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="div_regist"
		style="left: 50%; top: 50%; position: fixed; z-index: 9999; background: none; width: 392px; height: 408px; margin-left: -196px; margin-top: -204px; display: none;">
		<div class="login-wrap">
			<a class="close" id="close" href="javascript:"
				onclick="closeRegist()"><em class="iconfont">×</em></a>
			<div class="login-tab cf" id="j_loginTab">
				<ul>

					<li class="lang act" tab="qidian">账号注册</li>
					<!--  <li class="lang" tab="qq">QQ登录</li>
                <li class="lang" tab="weixin">微信登录</li>-->
				</ul>
			</div>

			<div class="login-switch-wrap">
				<div class="login-tab-wrap" id="j_loginSwitchWrap">
					<div class="login-box qd-login yw-login qidian-login hidden"
						style="display: block;">
						<div class="web-login-wrap">
							<div class="login-input-mode">
								<div class="login-mode input-mode show">
									<div class="error-tip hidden"></div>
									<dl>
										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="text" tabindex="1" placeholder="邮箱"
												id="regist-email">
										</dd>
										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="text" tabindex="1" placeholder="用户名"
												id="regist-username">
										</dd>

										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="password" tabindex="2"
												placeholder="以字母开头，长度在6~18之间" id="regist-password">
										</dd>
										<dd>
											<!--<em class="iconfont"></em>-->
											<input type="password" tabindex="2" placeholder="重复密码"
												id="regist-passworded">
										</dd>
									</dl>
									<div style="border: 1px solid #e6e6e6;margin-top: 10px;">
										<img id="captcha_img" type="captcha_img" alt="点击更换"
											title="点击更换" onclick="changeVerifyCode(this)"
											src="/novelsite/Kaptcha" style="cursor:pointer;"> <input
											id="regist-j_captcha" placeholder="请输入验证码"
											style="height: 50px">
									</div>
									<div class="login-common-wrap">
										<a id="registsubmit"
											class="red-btn go-login btnLogin login-button"
											href="javascript:">确认注册</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- login -->
	</div>


<!-- 闲聊么接口接入 
<script>
    var xlm_wid='13045';
    var xlm_url='https://www.xianliao.me/';
</script>
<script type='text/javascript' charset='UTF-8' src='https://www.xianliao.me/embed.js'></script>
-->                                             



	<!--js代码开始-->
	<!-- <script src="resources/index/layui.all.js"></script> -->
	<script src="resources/lib/myfocus/js/myfocus-2.0.1.min.js"
		type="text/javascript"></script>
	<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/js/index/index.js" type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<!--焦点图-->
	<script>
		/* layer.alert('见到你真的很高兴', {
			icon : 6
		}); */

		/*使用导航栏要依赖的*/
		/*依赖结束*/
		myFocus.set({
			id : 'picBox',
			loadIMGTimeout : "0",
			pattern : 'mF_fancy'/*这里换焦点图的分隔一般有*/
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
