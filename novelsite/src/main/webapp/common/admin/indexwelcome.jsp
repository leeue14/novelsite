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
<body style=" background-image: url('resources/images/admin/welcome.jpg');background-size:contain; ">

</body>


</html>