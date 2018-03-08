/**公共js**/


function changeVerifyCode(img){
	img.src = "/novelsite/Kaptcha?"+Math.floor(Math.random()*100);//生成4位的随机数
}

/**从url上获取bookId**/

function getQueryString(name){
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r != null){
		return decodeURIComponent(r[2]);
	}
	return "";
}
//退出事件
function loginOut(){
	$.ajax({
		url : '/novelsite/readeroperation/loginout',
		type : 'POST',
		success : function(data) {
			if(data.success){
				layer.msg('退出成功');
				window.location.href = data.url;
			}
		}
	});// 使用ajax传入后台
}



