/**
 * 
 */

$(function() {
	var totalPage = $("#page-go").data("total");
/*	var link = $("#page-go").data("link");
	var bookName = $("#page-go").data("name");*/
	// /novelsite/stack/indexstack?pageNum=1&categoryParentId=1&parentId=1&minor=异界大陆
	var categoryParentId = getQueryString("categoryParentId");
	var parentId = getQueryString("parentId");
	var minor = getQueryString("minor");

	$("#page-go")
			.click(
					function() {
						var pageNum = $("#page-input").val();
						
						if (pageNum >= 1 && pageNum <= totalPage
								/*&& link == "/novelsite/search/searchindex"*/) {
							// 跳转页面
							window.location.href = "/novelsite/stack/indexstack?pageNum="+pageNum +
									"&categoryParentId=" +categoryParentId+
									"&parentId=" +parentId+
									"&minor="+minor;
						}
						if (pageNum >= 1 && pageNum <= totalPage
								/*&& link == "/novelsite/search/searchbook"*/) {
							// 跳转页面
							window.location.href = "/novelsite/stack/indexstack?pageNum="+pageNum +
							"&categoryParentId=" +categoryParentId+
							"&parentId=" +parentId+
							"&minor="+minor;
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
