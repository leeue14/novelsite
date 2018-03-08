/**
 * 
 */

$(function(){
	var totalPage = $("#page-go").data("total");
	$("#page-go")
			.click(
					function() {
						var pageNum = $("#page-input").val();
						if (pageNum >= 1 && pageNum <= totalPage
								) {
							// 跳转页面
							window.location.href = "/novelsite/usercenter/bookshelf?pageNum="
									+ pageNum;
						}
						if (pageNum >= 1 && pageNum <= totalPage
								&& link == "/novelsite/search/searchbook") {
							// 跳转页面
							window.location.href = "/novelsite/usercenter/bookshelf?pageNum="
									+ pageNum;
						}
						if(pageNum == ""){
							layer.msg("页数不能为空");
						}
					});

});