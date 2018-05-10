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
<title>小说搜索</title>
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
	<!--书库-->
	<div class="wrap clearfix" >
		<div class="searchbb">
			<input id="searchTop_input" type="text" value="${requestScope.bookName }"
				class="sinput shoushubox gray" maxlength="70" placeholder="输入小说名"
				style="color:Gray;" autocomplete="off">
			<div class="submit">
				<a id="searchTop_submitBtn" href="javascript:"><img
					src="resources/images/stack/searchsubmit.jpg" width="92"
					height="43" alt="搜索"></a>
			</div>
			<!-- 搜索类型 -->
		</div>
		<div class="allbooklist">
			<div class="leftlist">
				<div class="topbox">
					<span class="left">${requestScope.typeName } - 每页显示20部小说</span><span class="right">${requestScope.bookPageBean.pageNum}/${requestScope.bookPageBean.totalPage}页
					</span>
				</div>
				<div class="books-list clearfix">

					<c:forEach var="item" items="${requestScope.bookPageBean.list}">
						<c:if test="${item.site=='novelsite'}">
							<a href="/novelsite/localbook/querybook?bookid=${item.bookId}"
								class="book" target="_blank"> <img
								onerror="this.src='../novelCover/date/bookId/nocover/nocover.jpg'"
								src="..${item.cover}"
								alt="${item.name}" class="cover">
								<div class="right">
									<h4 class="name">
										<span>${item.name}</span>
									</h4>
									<p class="author">
										<span>${item.authorName}</span> <span class="split">|</span><span>玄幻</span>
									</p>
									<p class="desc">${item.shortInfo}</p>
								</div>
							</a>
						</c:if>
						 <c:if test="${item.site =='zhuishuvip'}">
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
										<span>${item.author}</span> <span class="split">|</span><span>${item.cat}</span>
									</p>
									<p class="desc">${item.shortIntro}</p>
								</div>
							</a>
						</c:if> 

					</c:forEach>


				</div>
			</div><!--  -->
			
			<!-- 玄幻精品分页 -->
			<c:if test="${requestScope.pageLink == '/novelsite/search/searchindex'}">
			<div class="c-full-page">
				<span class="total">共<span class="c-gold">${requestScope.bookPageBean.totalPage}</span>页

				</span>
				<c:if test="${requestScope.bookPageBean.pageNum >1 }">
					<a
						href="/novelsite/search/searchindex?pageNum=${requestScope.bookPageBean.pageNum-1 }"
						class="prev">上一页</a>
				</c:if>
				
				<c:forEach var="i" step="1"
					begin="${requestScope.bookPageBean.start}"
					end="${requestScope.bookPageBean.end}">
					<ul class="pageNumber">
						<c:if test="${requestScope.bookPageBean.pageNum == i}">
							<li class="active"><a
								href="/novelsite/search/searchindex?pageNum=${i}">${i}</a></li>
						</c:if>
						<c:if test="${requestScope.bookPageBean.pageNum != i}">
							<li class=""><a
								href="/novelsite/search/searchindex?pageNum=${i}">${i}</a></li>
						</c:if>

					</ul>
				</c:forEach>
				<c:if
					test="${requestScope.bookPageBean.pageNum < requestScope.bookPageBean.totalPage}">
					<a
						href="/novelsite/search/searchindex?pageNum=${requestScope.bookPageBean.pageNum+1 }"
						class="next">下一页</a>
				</c:if>
				<div class="jump">
					<span>跳转到</span> <input id="page-input" class="page-input"
						type="text" name="pageNumber" value="">
					<button id="page-go" class="page-go" type="button"
						data-total="${requestScope.bookPageBean.totalPage}">GO</button>
				</div>
			</div>
				</c:if>
			<!-- 搜索结果分页 -->
			<c:if test="${requestScope.pageLink == '/novelsite/search/searchbook'}">
			<div class="c-full-page">
				<span class="total">共<span class="c-gold">${requestScope.bookPageBean.totalPage}</span>页

				</span>
				<c:if test="${requestScope.bookPageBean.pageNum >1 }">
					<a
						href="${requestScope.pageLink}?pageNum=${requestScope.bookPageBean.pageNum-1}&bookName=${requestScope.bookName}"
						class="prev">上一页</a>
				</c:if>
				
				<c:forEach var="i" step="1"
					begin="${requestScope.bookPageBean.start}"
					end="${requestScope.bookPageBean.end}">
					<ul class="pageNumber">
						<c:if test="${requestScope.bookPageBean.pageNum == i}">
							<li class="active"><a
								href="${requestScope.pageLink}?pageNum=${i}&bookName=${requestScope.bookName}">${i}</a></li>
						</c:if>
						<c:if test="${requestScope.bookPageBean.pageNum != i}">
							<li class=""><a
								href="${requestScope.pageLink}?pageNum=${i}&bookName=${requestScope.bookName}">${i}</a></li>
						</c:if>

					</ul>
				</c:forEach>
				<c:if
					test="${requestScope.bookPageBean.pageNum < requestScope.bookPageBean.totalPage}">
					<a
						href="${requestScope.pageLink}?pageNum=${requestScope.bookPageBean.pageNum+1}&bookName=${requestScope.bookName}"
						class="next">下一页</a>
				</c:if>
				<div class="jump">
					<span>跳转到</span> <input id="page-input" class="page-input"
						type="text" name="pageNumber" value="">
					<button id="page-go" class="page-go" type="button"
					data-link="${requestScope.pageLink}"
					data-name="${requestScope.bookName }"
						data-total="${requestScope.bookPageBean.totalPage}">GO</button>
				</div>
			</div>
			</c:if>
		</div>

	</div>
	
	<!-- 登录注册 -->
	<!--登录注册  -->
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
                                            <a href="https://aq.yuewen.com/welcome/validateuser"
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
    </div><!-- login -->
</div>
	<!--  登录注册end-->

	<iframe src="common/footer/footer.html" width="100%" height="110"
		scrolling="no" frameborder='0' style="position: relative;bottom: 0px;"></iframe>

		<script src="resources/lib/jquery/1.9.1/jquery.js"
			type="text/javascript"></script>
				<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<script src="resources/js/search/search.js" type="text/javascript"></script>
	<!-- 登录注册 -->
		<script src="resources/js/index/index.js" type="text/javascript"></script>
	<script type="text/javascript">
		//窗口如果嵌套出错了用这个方法
		if (self.location != top.location) {
			top.location = self.location;
		}
		
	
		
		
	</script>
</body>
</html>
