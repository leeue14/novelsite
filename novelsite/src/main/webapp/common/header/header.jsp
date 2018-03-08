<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>轩文阁小说阅读网</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">
<link rel="stylesheet" href="resources/lib/layui/css/layui.css">
<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/css/index/index.css">

</head>

<body>
<div class="head">
    <div class="top_nav">

        <div class="top_nav_left">
            <ul>
                <li><a href="#">设为首页</a></li>
                <li><a href="#">一键收藏</a></li>
            </ul>
        </div><!--top_nav_left结束-->
        <div class="top_nav_right">
            <li><a href="#">个人中心</a></li>
            <li><a href="#">最近阅读</a></li>
            <li><a href="#">充值</a></li>
            <li><a href="#">注册</a></li>
            <li><a href="#">登录</a></li>
        </div><!--top_nav_right结束-->
    </div>
</div><!--头部内容结束-->

<!--logo 和 广告内容开始-->
<div class="ad">
    <div class="ad_logo">
        <a href="#" class="logo"></a>
    </div><!--ad_logo结束-->
    <div class="ad_banner">
        <a href="/novelsite/bookview/bookmain?bookid=50865988d7a545903b000009" class="banner"><img src="/novelsite/resources/images/1507519561.jpg"></a>
    </div><!--ad_banner结束-->
</div><!--广告和logo结束-->
<!--导航栏开始-->
<div class="nav">
    <div class="hdnav">
        <div class="hdnav_left">

        </div>
        <div class="hdnav_mid">
            <div class="hdnav_mid_left">
                <ul>
                    <li><a href="/novelsite/indexview/index" target="_blank">首页</a></li>
                    <li><a href="#">最近更新</a></li>
                    <li><a href="#">搜书</a></li>
                    <li><a href="#">排行榜</a></li>
                    <li><a href="#">充值</a></li>
                </ul>
            </div><!--hdnav_mid_left结束-->
            <div class="hdnav_mid_right">
                <form>
                    <input class="search_text" placeholder="请输入小说名">
                    <button class="layui-btn layui-btn-small search_btn  layui-btn-warm" style="">搜索</button>
                </form>
            </div><!--hadnav_mid_right结束-->
        </div><!--hadnav_left结束-->
        <div class="hdnav_right">

        </div>

    </div><!--上面的大导航栏结束-->
    <div class="bdnav">
        <div class="">

        </div>
        <div class="bdnav_content">
            <ul>
                <li><a href="#">原创书库</a></li>
                <li><a href="#">玄幻·奇幻</a></li>
                <li><a href="#">武侠·仙侠</a></li>
                <li><a href="#">都市·现实</a></li>
                <li><a href="#">历史·军事</a></li>
                <li><a href="#">游戏·体育</a></li>
                <li><a href="#">科幻·灵异</a></li>
                <li><a href="#">女生·言情</a></li>
                <li><a href="#">二次元·短篇</a></li>
                <li><a href="#">作家福利</a></li>
            </ul>
        </div>

    </div><!--下面的导航栏结束-->
</div><!--nav导航栏结束-->
</body>
</html>
