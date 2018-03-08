//本地书籍阅读操作

$(function(){
	var bookId = $("#bookId").val();
	var url = "/novelsite/localbook/querychapters";
	var index = getQueryString("index");
	index = Number(index);
	var preIndex  = index -1;
	var nextIndex = index + 1;
	//上一页下一页获取
 	$.ajax({
		url : url,
		type : 'GET',
		contentType : false,// 因为要传文件和文字
		processData : false,
		cache : false,
		success : function(data) {
			if(data.success){
				var chapters = data.chapters; 			
					if(nextIndex >= chapters.length){//说明没有下一章
						var length = chapters.length -1;
					
						$("#nextChapterBtn")
						.attr("href","/novelsite/localbook/querybookdetail?chapterId="+chapters[length].chapterId+"&index="+length+"&bookid="+bookId);
					}else{
						$("#nextChapterBtn")
						.attr("href","/novelsite/localbook/querybookdetail?chapterId="+chapters[nextIndex].chapterId+"&index="+nextIndex+"&bookid="+bookId);
					}
					if(preIndex <= 0){
						$("#preChapterBtn")
						.attr("href","/novelsite/localbook/querybookdetail?chapterId="+chapters[0].chapterId+"&index="+0+"&bookid="+bookId);
					}else{
						
						$("#preChapterBtn")
						.attr("href","/novelsite/localbook/querybookdetail?chapterId="+chapters[preIndex].chapterId+"&index="+preIndex+"&bookid="+bookId);
					}
				
			}else{
				layer.msg(data.errMsg,function(){
					window.location.href = "/novelsite/indexview/index";
				});
				
			}
		}
			
		
	 });// 使用ajax传入后台 */
 	
 	
	
});