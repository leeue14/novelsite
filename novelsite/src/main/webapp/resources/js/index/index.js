/**
 * 这个是首页的获取数据js
 */
$(function() {
	// 登陆框弹出
	/* alertLogin(); */
	var registUrl = "/novelsite/readeroperation/regist";
	var loginUrl = "/novelsite/readeroperation/login"
	var autologinUrl = "/novelsite/readeroperation/autologin"
	$('#registsubmit').click(
			function() {
				var reader = {};
				var email = $('#regist-email').val();
				var username = $('#regist-username').val();
				var password = $('#regist-password').val();
				var passworded = $('#regist-passworded').val();
				var verifyCodeActual = $('#regist-j_captcha').val();
				if (email != "" && username != "" && password != ""
						&& passworded != "" && verifyCodeActual != "") {
					if (password == passworded) {
						reader.email = email;
						reader.nickName = username;
						reader.password = password;
						layer.msg('是否注册', {
							icon : 6,
							btn : [ '确定', '取消' ],
							time : 0,
							yes : function(index) {
								layer.close(index);
								// 确认注册
								var formData = new FormData();
								formData.append('verifyCodeActual',
										verifyCodeActual);
								formData.append('reader', JSON
										.stringify(reader));// 转换成json出入进去

								$.ajax({
									url : registUrl,
									type : 'POST',
									data : formData,
									contentType : false,// 因为要传文件和文字
									processData : false,
									cache : false,
									success : function(data) {
										if (data.success) {
											layer.msg('注册成功', {
												icon : 1
											}, function() {
												closeRegist();// 关闭注册窗口
											});
										} else {
											layer.msg("" + data.errMsg, {
												icon : 2
											});
										}
										// $('#captcha_img').click();//
										// 不管是提交失败还是成功都会更换验证码
									}
								});// 使用ajax传入后台
							}
						});
					} else {
						layer.alert('两次密码输入不一致', {
							icon : 6
						});
					}
				} else {
					layer.alert('注册信息不能为空', {
						icon : 6
					});
				}
			});
	// 自动登录
	var flag = true;
	$('#loginsubmit').click(function() {
		var reader = {};
		var email = $('#email').val();
		var password = $('#password').val();
		var verifyCodeActual = $('#login-j_captcha').val();
		if (email != "" && password != "" && verifyCodeActual != "") {
			reader.email = email;
			reader.password = password;
			// 确认登录
			var formData = new FormData();
			formData.append('verifyCodeActual', verifyCodeActual);
			formData.append('reader', JSON.stringify(reader));// 转换成json出入进去
			formData.append('flag', flag);
			$.ajax({
				url : loginUrl,
				type : 'POST',
				data : formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if (data.success) {
						layer.msg('登录成功', {
							icon : 1
						}, function() {
							closeLogin();// 关闭注册窗口
						});
					} else {
						layer.msg("" + data.errMsg, {
							icon : 2
						});
					}
					// 转发到已经登录的页面
					if (data.redirect) {
						window.location.href = data.url;
					}
					// $('#captcha_img').click();// 不管是提交失败还是成功都会更换验证码
				}
			});// 使用ajax传入后台

		} else {
			layer.alert('登录信息不能为空', {
				icon : 6
			});
		}
	});
	$('#autologin').change(function() {
		if (!flag) {
			flag = false;
		}

	});

	$('#loginOut').click(function() {

	});

	// 搜索
	$("#searchTop_submitBtn")
			.click(
					function() {
						var bookName = $("#searchTop_input").val();
						if (bookName == "") {
							layer.msg("搜索书籍名不能为空");
						} else {
							/*layer.msg(bookName);*/
							window.location.href = "/novelsite/search/searchbook?bookName="
									+ bookName + "&pageNum=1";
							window.event.returnValue = false;
						}
					});

});

var ozhe = document.getElementById("zhe");
// 退出事件
function loginOut() {
	$.ajax({
		url : '/novelsite/readeroperation/loginout',
		type : 'POST',
		success : function(data) {
			if (data.success) {
				layer.msg('退出成功');
				window.location.href = data.url;
			}
		}
	});// 使用ajax传入后台
}
function alertLogin() {
	var oLogin = document.getElementById("div_ywlogin");

	if (oLogin.style.display == "none") {
		oLogin.style.display = "block";
		ozhe.style.display = "block";
	} else {
		oLogin.style.display = "none";
		ozhe.style.display = "none";
	}
}

function alertRegist() {
	initRegist();
	var oRegist = document.getElementById("div_regist");
	if (oRegist.style.display == "none") {
		oRegist.style.display = "block";
		ozhe.style.display = "block";
	} else {
		oRegist.style.display = "none";
		ozhe.style.display = "none";
	}
}
function closeLogin() {
	var oLogin = document.getElementById("div_ywlogin");
	oLogin.style.display = "none";
	ozhe.style.display = "none";
}
function closeRegist() {
	var oLogin = document.getElementById("div_regist");
	oLogin.style.display = "none";
	ozhe.style.display = "none";
}

function initLogin() {

}
function initRegist() {
	var email = $('#regist-email').val("");
	var username = $('#regist-username').val("");
	var password = $('#regist-password').val("");
	var passworded = $('#regist-passworded').val("");
	var verifyCodeActual = $('#regist-j_captcha').val("");
}
