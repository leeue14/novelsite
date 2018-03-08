/**
 * 
 */

$(function(){
	var registUrl = "/novelsite/authoroperation/registauthor";
//注册
	$('#regist').click(function(){
		var author = {};
		var penName = $('#penName').val();
		var realName = $('#realName').val();
		var idCard = $('#idCard').val();
		var email = $('#email').val();
		var qqNum = $('#qqNum').val();
		var shortInfo = $('#shorInfo').val();
		var phone = $('#phone').val();
		var verifyCodeActual = $('#regist-j_captcha').val();
		if(penName != "" && realName != "" && idCard != "" && email != "" && qqNum != ""
			&& shortInfo != "" && phone != "" && verifyCodeActual != ""){
			
			author.penName = penName;
			author.realName = realName;
			author.idCard = idCard;
			author.qqNum = qqNum;
			author.email = email;
			author.shortInfo = shortInfo;
			author.phone = phone;
			var formData = new FormData();
			formData.append('verifyCodeActual',
					verifyCodeActual);
			formData.append('author', JSON
					.stringify(author));// 转换成json出入进去
			$.ajax({
				url:registUrl,
				type:'POST',
				data:formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if (data.success) {
						layer.msg('注册成功', {
							icon : 1
						},function(){
							alert("跳转到作家专区");
							window.location.href = "/novelsite/author/authorcenter";
						});
					} else {
						layer.msg("" + data.errMsg, {
							icon : 2
						});
					}
					// $('#captcha_img').click();//
					// 不管是提交失败还是成功都会更换验证码
				}
			});
			
		}else{
			layer.alert('注册信息不能为空', {
				icon : 6
			});
		}
	});//注册end
});