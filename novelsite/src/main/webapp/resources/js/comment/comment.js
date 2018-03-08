/**
 * 评论框的js
 */

$(function(){
	
	//发布按钮
	var url = "/novelsite/comment/addcomment";
	$("#submitCommentBtn").click(function(){
		var commentTitle = $("#commentTitle").val();
		var body = $("#commentContent").val();
		var verifyCodeActual = $("#verifyInput").val();
		var bookId = $("#bookId").val();
		var bookTitle = $("#bookTitle").val();
		if(commentTitle != "" && body != "" && verifyCodeActual != ""){
			var comment = {};
			comment.commentTitle = commentTitle;
			comment.body = body;
			var formData = new FormData();
	
			formData.append("verifyCodeActual",verifyCodeActual);
			formData.append("bookId",bookId);
			formData.append("bookTitle",bookTitle);
			formData.append("commentStr",JSON.stringify(comment));//转换成json
			$.ajax({
				url : url,
				type : 'POST',
				data : formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if (data.success) {
						layer.msg('评论成功', function() {
							window.location.reload();//刷新当前页面
							});
					}else{
						layer.msg(data.errMsg);
					}
				}
				
			});
		}else{
			layer.msg("输入信息不能为空");
		}
	});
	
});