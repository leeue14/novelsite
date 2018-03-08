/**
 * 后台管理登录js
 */

$(function(){
	$("#login").click(function(){
		var email = $("#email").val();
		var password = $("#password").val();
		
		if(email != "" && password != ""){
			var formData = new FormData();
			formData.append("email",email);
			formData.append("password",password);
			
			$.ajax({
				url:"/novelsite/adminoperation/adminlogin",
				type:"POST",
				data:formData,
				contentType:false,
				processData:false,
				cache:false,
				success:function(data){
					if(!data.success){
						/*layer.msg(data.success);*/

						layer.msg(data.errMsg);
					}
					if(data.success){
						window.location.replace(data.url);
					}
				}
			});
		}else{
			layer.msg("email或密码不能为空");
		}
	});
	
	
});