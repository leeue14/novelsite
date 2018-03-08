/**
 * 作者中心js
 */

$(function(){
	
	var readerId=$("#readerId").val();
	var authorUrl = '/novelsite/authoroperation/queryauthor?readerId='+readerId;
	//点击作者中心弹窗
	$("#writer").click(function(){
		$.ajax({
			url:authorUrl,
			type:'POST',
			dataType : "json",
			success:function(data){
				/*alert(data.success);*/
				if(data.success){
					window.location.href = data.url;
				}else{
					layer.confirm('你还没有注册作者，是否注册?', {
						  btn: ['是','否'] //按钮
						}, function(){
							//打开作者注册界面
							window.location.href = '/novelsite/author/regist';
						}, function(){
						});
				}
			}
			
		});
		
	});
});