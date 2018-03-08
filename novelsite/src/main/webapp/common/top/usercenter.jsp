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
<title>个人中心</title>
<link rel="stylesheet" href="resources/css/index/H-ui.reset.css">

<link rel="stylesheet" href="resources/css/index/base.css">
<link rel="stylesheet" href="resources/lib/layui/css/layui.css">
<link rel="stylesheet" href="resources/css/index/index.css">
<link rel="stylesheet" href="resources/css/top/top.css">
<link rel="stylesheet" href="resources/css/usercenter/usercenter.css">


</head>

<body>
	<div>
		<iframe src="common/top/index.html" width="100%" height="150"
			scrolling="no" frameborder='0'
			style="margin: 0;padding: 0;
            "></iframe>
	</div>
	<div class="wrap" style="margin-top: -60px;">
		<div class="personal_logo cf">
			<a class="logo3" href="#">个人中心LOGO</a>
		</div>
		<!--左边侧栏-->
		<div class="personal_wrap cf">
			<div class="personal_left">
				<div class="personalbox">
					<div class="personal_basic cf">
						<div class="img_border_big">
							<a id="userInfoBox_headImgLink" href="#"> <img
								id="userInfoBox_headImg"
								src="resources/images/usercenter/default-avatar.png" width="100"
								height="100">
							</a>
						</div>
						<div class="infor_wrap">
							<p id="box_nickname_s">书友1339208162</p>
							<p>
								<a href="#"> <img src="resources/images/usercenter/rank6.png"></a>&nbsp;
								<a href="#"> <img src="resources/images/usercenter/0.png"></a>
							</p>
						</div>
						<!--列表-->
						<div class="personal_toolbar">
							<h1 class="account_ico ">
								<a href="#">账务中心</a>
							</h1>
							<h1 class="writer_ico ">
								<a id="writer" target="_blank" href="javascript:">作家专区</a>
							</h1>
							<h1 class="V_ico ">
								<a href="#">会员专区</a>
							</h1>
							<h1 class="my_shelf ">
								<a href="#">我的书架</a>
							</h1>
							<h1 class="shelf_list " style="display:none;">
								<a href="javascript:" style="display:none;">我的书单</a>
							</h1>
							<h1 class="my_shuping ">
								<a href="#">我的书评</a>
							</h1>
							<h1 class="shelf_list ">
								<a href="#">站内短信</a>
								<div class="tool_newmsg" style="display: none;"></div>
							</h1>
							<div id="Sign_in">
								<a href="javascript:void(0);" onclick="signin();" title="签到"><img
									src="resources/images/usercenter/sign.png" alt="签到"></a>
							</div>

							<a class="pService" href="#" target="_blank"></a>
						</div>
					</div>
				</div>
			</div>
			<div class="personal_main main_noright">
				<div id="mainTabBox" class="main_h1tab main_long_bottom">
					<h1 class="cf">
						<span class="p_infor_basic  main_current"> <a
							href="/usercenter/index.html">基本信息</a>
						</span> <b class="one_line">|</b> <span id="upphoto"
							class="p_information "> <a href="/usercenter/avatar.html">头像管理</a>
						</span> <b class="one_line">|</b> <span class="p_information "> <a
							href="/usercenter/personalinfo.html">个人信息</a></span><b class="two_line">|</b><span
							class="p_hobby"><a href="/usercenter/hobby.html">兴趣爱好</a></span><b
							class="three_line">|</b><span class="p_setup"><a
							href="/usercenter/setting.html">个性设置</a></span><b class="four_line">|</b><span
							class="Certification"><a
							href="/usercenter/realverify.html">实名认证</a></span>
					</h1>
				</div>
				<!-- 用户中心 横向菜单-->
				<div id="mainContentList" class="main_tab_wrap">
					<!--基本信息-->
					<div class="basic_info">
						<ul>
							<li><span>用户昵称：</span> <span id="nicknamespan">书友1339208162</span>
								<a id="modifyNickNameBtn" class="modify_nickname red2"
								href="javascript:">修改昵称</a></li>
							<li><span>用户ID：</span><span id="Bindid">1264308633</span></li>
							<li><span>用户等级：5级</span> <span class="now_rank">
									&nbsp;&nbsp; <!--当前排名： <em>100+</em>-->
							</span> <!--<a id="modifyNickNameBtn" class="modify_nickname red2" href="javascript:">修改昵称</a>-->
								<a class="red2 " href="/usermember/index/show/1.html">查看用户等级体系</a>
							</li>
							<li><span>VIP等级：1级</span> <a class="red2"
								href="/usermember/index/show/2.html">查看VIP等级体系</a></li>
							<li><span id="year_label">年费会员：</span> 您还不是年费会员<!--未成为年费会员时如下显示-->
								<!-- <a style="display:;" href="/usermember/index.html?t=apply&show=3" id="year_member">成为年费会员，立刻领取500点积分。</a>  -->
								<!--已成为年费会员时如下显示--> <!-- <a href="/usermember/index.html?t=refee&show=3" class="red2" id="year_renew">续费</a> -->
								<!--<a class="red2" href="/usermember/index.html?show=3">[查看年费会员相关特权]</a> --></li>
							<li><span id="monthlyuser_label">包月会员：</span> 您还不是包月会员 <a
								class="red2"
								href="https://pay.qq.com/webpay/index.shtml?c=qqyfsc&amp;aid=qqyd.pc"
								target="_blank">开通</a><a class="red2"
								href="http://kf.qq.com/faq/120521VraM7F140704fMZrUB.html"
								target="_blank">包月会员优惠</a><a class="red2"
								href="http://kf.qq.com/faq/150807UFzyEB150825VBFveQ.html"
								target="_blank">如何关闭包月</a></li>
							<li><span>包月体验卡：</span>0张 <a class="gray2"
								href="http://chuangshi.qq.com/about/questions_vip.html"
								target="_blank">什么是体验卡？</a></li>
							<li><span>上次登录：</span>2018-01-15 15:55:10</li>
							<li><span>VIP月 票：</span> 本月已投0张，现余0张 <a class="gray2"
								href="/usercenter/history.html?ttid=1">查询明细</a></li>
							<li><span>日推荐票：</span> 今日已推荐0张，现余2张 <a class="gray2"
								href="/usercenter/history.html?ttid=2">查询明细</a><a class="red2"
								href="http://chuangshi.qq.com/about/questions_newuser.html"
								target="_blank">如何获得更多？</a></li>
							<li><span>藏 书 量：</span> 共1000本，已用4本 <a class="red2"
								href="/userfavorite/index.html">进入我的书架</a></li>
							<li><span>发 帖 量：</span>0条</li>
						</ul>
					</div>
					<!--头像管理-->
					<div class="photo_manage " style="display: none;">
						<ul>
							<li><span> vip1级以上且绑定QQ的用户可上传自定义头像，您尚未满足条件，请使用<a
									id="showSystemAvatarBtn" href="javascript:" class="red">系统头像</a>。
							</span></li>
						</ul>
					</div>

					<!--个人资料-->
					<div class="personal_infodiv" style="display: none;">
						<ul>
							<p class="area_line">分割</p>
							<li><span>用户昵称：</span><span id="personal_nickname">书友1339208162</span></li>
							<li><span>注册邮箱：</span><span></span> &nbsp; <!--未校验邮箱时的显示-->
								<!-- <i class="f900">您的邮箱尚未通过校验，立即
                                <a class="green" href="/verifyemail/sendMail.html">校验邮箱</a>                                即可获100成长值奖励！
                            </i>  --></li>
							<li><span>个人签名：</span> <input id="pinf_Sign"
								class="longinput3" name="" type="text" value="" readonly=""
								onclick="$(this).removeAttr('readonly');$(this).focus()"></li>
							<!--<li><span>真实姓名：</span><input id="pinf_Realname" class="midinput" name="" type="text" value ='' /></li>-->
							<li><span>出生年月：</span><input id="pinf_Birthday"
								maxlength="10" class="midinput" name="" type="date" value=""></li>
							<li><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span><input
								id="sex_man" name="sex" type="radio" checked=""><label
								for="sex_man">男</label><input id="sex_woman" name="sex"
								type="radio"><label for="sex_woman">女</label></li>
							<li><span>学&nbsp;&nbsp;&nbsp;&nbsp;历：</span><select
								id="pinf_Educational" name="" class="">
									<option value="0">请选择</option>
									<option value="1">小学</option>
									<option value="2">初中</option>
									<option value="3">高中</option>
									<option value="4">专科</option>
									<option value="5">本科</option>
									<option value="6">硕士</option>
									<option value="7">博士</option>
									<option value="8">博士后</option>
							</select></li>
							<li><span>职&nbsp;&nbsp;&nbsp;&nbsp;业：</span><select
								id="pinf_Profession" name="" class="">
									<option value="生产/制造">生产/制造</option>
									<option value="在校学生">在校学生</option>
									<option value="计算机/互联网">计算机/互联网</option>
									<option value="通信">通信</option>
									<option value="公务员/事业单位">公务员/事业单位</option>
									<option value="教师">教师</option>
									<option value="医务工作者">医务工作者</option>
									<option value="空乘人员">空乘人员</option>
									<option value="商业/服务业">商业/服务业</option>
									<option value="个体经营">个体经营</option>
									<option value="金融/银行/投资/保险">金融/银行/投资/保险</option>
									<option value="娱乐/艺术">娱乐/艺术</option>
									<option value="房地产">房地产</option>
									<option value="酒店旅游">酒店旅游</option>
									<option value="现代农业">现代农业</option>
									<option value="教育咨询">教育咨询</option>
									<option value="交通物流
        ">交通物流</option>
							</select></li>
							<p class="area_line">分割</p>
							<li class="p_savebtn cf"><input type="hidden" id="uc_token"
								value=""> <a id="personalInfo_saveBtn"
								class="savebtn p_save" href="javascript:"
								style="background: #ff3d8f;">保存修改</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!--中间内容-->

	</div>

	<iframe src="common/footer/footer.html" width="100%" height="100"
				scrolling="no" frameborder='0' style="margin: 0;padding: 0;"></iframe>

<!-- 公共js -->
	<script src="resources/lib/jquery/1.9.1/jquery.js"type="text/javascript"></script>
	<script src="resources/lib/layer/layer.js" type="text/javascript"></script>
	
<!--自己的js  -->
<script src="resources/js/usercenter/usercenter.js" type="text/javascript"></script>
</body>
</html>
