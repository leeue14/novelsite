<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <title>轩文阁后台管理系统</title>
    <link rel="stylesheet" href="resources/admin/css/login.css">
    <link rel="stylesheet" href="resources/admin/css/H-ui.reset.css">
    <link rel="stylesheet" href="resources/admin/css/style.css">
    <!--H-ui框架的引用css-->
    <!--[if lt IE 9]-->
    <script type="text/javascript" src="resources/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="resources/admin/lib/respond.min.js"></script>
    <!--引用的css-->
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.min.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.reset.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui.admin/css/H-ui.admin.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.min.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/layer/2.4/skin/layer.css"/>
    
   
    <!--引用的css-->
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.min.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui/css/H-ui.reset.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui.admin/css/H-ui.admin.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/Hui-iconfont/1.0.8/iconfont.min.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui.admin/skin/default/skin.css"
          id="skin"/>
    <link rel="stylesheet" type="text/css" href="resources/admin/static/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="resources/admin/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css"
          href="resources/admin/lib/layer-v3.0.3/layer/skin/default/layer.css"/>
    <script type="text/javascript" src="resources/admin/lib/jquery/1.9.1/jquery.min.js"></script>
    
<!-- <link rel="stylesheet" href="resources/css/index/H-ui.reset.css"> -->
</head>
  
  <body>
  <header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"><a class="logo navbar-logo f-l mr-10 hidden-xs" href="">轩文阁后台管理系统</a> <a
                class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.01</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
               
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${sessionScope.admin.adminName }<i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="/novelsite/admin/adminlogin">切换账户</a></li>
                            <li><a href="/novelsite/admin/adminloginout">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A"
                                                                               title="换肤"><i class="Hui-iconfont"
                                                                                             style="font-size:18px">
                        &#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a id="getReaders" data-href="/novelsite/usermanage/usermanageindex"data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
                </ul>
            </dd>
            
            <dt><i class="Hui-iconfont">&#xe616;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="usermanage/usermanage.jsp" data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
                </ul>
            </dd>
        </dl>

    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="welcome.html">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S"
                                                  href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
                id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
            &#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="common/admin/indexwelcome.jsp"></iframe>
         
<!--           <iframe scrolling="yes" frameborder="0" src="common/admin/usermanage.jsp"></iframe> -->
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前</li>
        <li id="closeall">关闭全部</li>
    </ul>
</div>

<!--引用的js代码-->
<script type="text/javascript" src="resources/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="resources/admin/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="resources/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="resources/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<!-- 使用这个无效 -->
<!-- <script type="text/javascript" src="resources/admin/static/h-ui.admin/js/H-ui.admin.page.js"></script> -->


<script>
function add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

</script>
  </body>
</html>
