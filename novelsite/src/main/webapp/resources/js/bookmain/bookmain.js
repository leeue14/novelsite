$(function(){
	
	var bookId = getQueryString("bookid");
	getBookInfo();
	function getBookInfo(){
		var bookInfoUrl = "/novelsite/bookoperation/bookinfo?bookid="+bookId;
		$.getJSON(bookInfoUrl,function(data){
			if(data.success){
		
			}
		});
	}
})