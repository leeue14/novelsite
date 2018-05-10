/**
 * 这个作品管理中心的js代码
 */

$(function(){
	
	//获取作品
	$.get("/novelsite/localbookoperation/querybook",function(data){//请求获取下该作者的作品
	/*	layer.msg("哈哈哈");*/
		if(!data.success){
			window.location.href = '/novelsite/indexview/index';
			//layer.msg("请先登录");
		}
	});
	//插入作品
	
});