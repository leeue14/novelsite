/**
 * 
 */

$(function() {
	var totalPage = $("#page-go").data("total");
	var link = $("#page-go").data("link");
	var bookName = $("#page-go").data("name");
	$("#page-go")
			.click(
					function() {
						var pageNum = $("#page-input").val();
					
						if (pageNum >= 1 && pageNum <= totalPage
								&& link == "/novelsite/search/searchindex") {
							// 跳转页面
							window.location.href = "/novelsite/search/searchindex?pageNum="
									+ pageNum;
						}
						if (pageNum >= 1 && pageNum <= totalPage
								&& link == "/novelsite/search/searchbook") {
							// 跳转页面
							window.location.href = "/novelsite/search/searchbook?pageNum="
									+ pageNum+"&bookName="+bookName;
						}
						if(pageNum == ""){
							layer.msg("页数不能为空");
						}
					});

	// 搜索
	$("#searchTop_submitBtn")
			.click(
					function() {
						var bookName = $("#searchTop_input").val();
						if (bookName == "") {
							layer.msg("搜索书籍名不能为空");
						} else {
							window.location.href = "/novelsite/search/searchbook?bookName="
									+ bookName + "&pageNum=1";
						}
					});
});
