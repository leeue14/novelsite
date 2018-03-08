/**
 * 
 */

$(function(){
	var bookId = $("#bookId").val();
	var author = $("#author").val();
	var bookName = $("#bookName").val();
	var title=$("#title").val();
	$("#addBookShelf").click(function(){
		if(bookId.length > 5){//站外书籍
			var formData = new FormData();
			var site = "zhuishuvip";
			var bookShelf = {};
			bookShelf.bookId = bookId;
			bookShelf.author = author;
			bookShelf.bookName = bookName;
			bookShelf.title=title;
			bookShelf.site = site;
			
			formData.append('bookShelf', JSON
					.stringify(bookShelf));// 转换成json出入进去
			$.ajax({
				url : "/novelsite/bookshelfoperation/insertbookshelf",
				type : 'POST',
				data : formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if(data.success){
						layer.msg("加入书籍成功");
					}else{
						layer.msg(data.errMsg);
					}
				}
			});

		}else{
			//站内书籍
			var formData = new FormData();
			var site = "novelsite";
			var bookShelf = {};
			bookShelf.bookId = bookId;
			bookShelf.author = author;
			bookShelf.bookName = bookName;
			bookShelf.title=title;
			bookShelf.site = site;
			formData.append('bookShelf', JSON
					.stringify(bookShelf));// 转换成json出入进去
			$.ajax({
				url : "/novelsite/bookshelfoperation/insertbookshelf",
				type : 'POST',
				data : formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if(data.success){
						layer.msg("加入书籍成功");
					}else{
						layer.msg(data.errMsg);
					}
				}
			});
		}
	});
	
//	删除操作
	
	$("#deletebookShelf").click(function(){
		var bookShelfId = $("#deletebookShelf").data("id");
		var formData = new FormData();
		formData.append('bookShelfId', bookShelfId);// 转换成json出入进去
		$.ajax({
			url : "/novelsite/bookshelfoperation/deletebookshelf",
			type : 'POST',
			data : formData,
			contentType : false,// 因为要传文件和文字
			processData : false,
			cache : false,
			success : function(data) {
				if(data.success){
					layer.msg("移除书籍成功",function(){
						location.reload();
					});
				}else{
					layer.msg(data.errMsg);
				}
			}
		});
	});

	
});