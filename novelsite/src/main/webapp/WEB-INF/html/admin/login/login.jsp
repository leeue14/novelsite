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
    
<!-- <link rel="stylesheet" href="resources/css/index/H-ui.reset.css"> -->
</head>
&nbsp
<body class="height-full page-login">
<div class="height-full" style="width: 100%">
    <div class="left-body  ">
        <div class="page-band  ">
            <div class="page-label haha">
                <div style=" height:100px;margin:  0 auto;">
                    <h3 class="font"><i class="Hui-iconfont">&#xe625;&nbsp;</i>轩文阁后台管理系统</h3>
                    <ul class="mt-20">
                        <li id="lion1"><i class="Hui-iconfont">&#xe6a7;　</i>系统使处理事务更高效</li>
                        <li id="lion2"><i class="Hui-iconfont">&#xe6a7;　</i>资源管理透彻一目了然</li>
                        <li id="lion3"><i class="Hui-iconfont">&#xe6a7;　</i>资源管理透彻一目了然</li>
                        <li id="lion4"><i class="Hui-iconfont">&#xe6a7;　</i>资源管理透彻一目了然</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="right-body va-m">
        <div class="login-body">
            <form action="" method="post" class="form form-horizontal responsive" id="loginform">
                <div class="login-lable">
                    <h1>登录 System</h1>
                    <small id="labelone">轩文阁后台管理系统　</small>
                    <div class="login" id="">
                        <input class="mt-30 input-text radius " placeholder="输入email" name="email"
                               id="email" data-prompt-position="inline">

                        <input class="mt-20 input-text radius " placeholder="密码" type="password" id="password"
                               data-prompt-position="inline">

                        <div class="f-l mt-10">
                            <input id="login" type="button" class="btn btn-primary radius" value="登录"
                                   style="width: 120px;">
                        </div>

                        <div class="f-r mt-10">
                            <button type="button" class="btn btn-primary radius" onclick="regist()"
                                    style="width: 120px;">注册
                            </button>

                        </div>

                    </div>
                </div>

            </form>

        </div>

    </div>

</div>

</div>


<script>
    function regist() {
       layer.msg("向管理员申请账号吧!");
    }
    
</script>

<!--引用的js代码-->
<script src="resources/lib/jquery/1.9.1/jquery.js"
		type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	<script src="resources/js/common/common.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/admin/static/h-ui/js/H-ui.js"></script>
<!--layer-->


<!-- 登录的js -->

<script src="resources/admin/js/login.js" type="text/javascript"></script>

</body>
</html>
