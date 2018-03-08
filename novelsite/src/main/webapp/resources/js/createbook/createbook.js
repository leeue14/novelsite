/**
 * 这个是创建书籍的js
 */
$(function(){
	//获取分类列表
	getCategoryList();
	$("#create-book").click(function(){//创建书籍
		var book  = {};
		var cover = $("#cover")[0].files[0];
	//	var cover = $(" input[ type='file' ]").val();
		book.name = $("#name").val();
	//	book.cover = cover;
		book.categoryId = $("#categoryId option:selected").data("id");
		book.cat = $("#cat").val();
		book.shortInfo  = $("#shortInfo").val();
		if(book.name!=""&& book.categoryId != "" && book.cat != "" && book.shortInfo != ""){
			var formData = new FormData();
			formData.append("cover",cover);
			formData.append("bookStr",JSON.stringify(book));
			$.ajax({
				url:"/novelsite/localbookoperation/insertbook",
				type:"POST",
				data:formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success:function(data){
					if(data.success){
						layer.msg("创建书籍成功",function(){
							if(data.redirct){
								var  frameindex= parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引   
								  window.location.replace(data.url);
								// parent.location.href = data.url;//这样父窗口就会刷新
								 parent.layer.close(frameindex); //再执行关闭
							}
						});
						
					}else{
						layer.msg(""+data.errMsg,function(){
							if(data.redirct){
								var  frameindex= parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引   
								 parent.layer.close(frameindex); //再执行关闭
								 parent.location.href = data.url;//这样父窗口就会刷新
							}
						});
					}
					
				}
			});
		}else {
			layer.alert('书籍信息不能为空', {
				icon : 6
			});
		}
		
		
		
		
	});
	
	$("#categoryParentId").change(function(){
		var categoryParentId = $("#categoryParentId option:selected").data("id");
		
		var formData = new FormData();
		formData.append("categoryParentId",categoryParentId);
		$.ajax({
			url:"/novelsite/category/getparentcategorylist",
			type:"POST",
			data:formData,
			contentType : false,// 因为要传文件和文字
			processData : false,
			cache : false,
			success:function(data){
				var tempHtml="";
				data.categories.map(function(item,index){
					tempHtml += '<option data-id = "' +item.categoryId+'">'+item.categoryName+'</option>';
				});
				$("#categoryId").html(tempHtml);
			}
		});
	});
	
	//获取分类列表
	function getCategoryList(){	
		$.ajax({
			url:"/novelsite/category/getparentcategorylist",
			type:"POST",
			success:function(data){
				if(data.success){
					var tempParentHtml = "";
					var tempHtml="";
					data.categorieParents.map(function(item,index){
						tempParentHtml += '<option data-id = "' +item.categoryId+'">'+item.categoryName+'</option>';
					});
					data.categories.map(function(item,index){
						tempHtml += '<option data-id = "' +item.categoryId+'">'+item.categoryName+'</option>';
					});
					$("#categoryParentId").html(tempParentHtml);
					$("#categoryId").html(tempHtml);
				}
			}
		});
	}
	function closeIfream(){
		var  frameindex= parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引   
		 parent.layer.close(frameindex); //再执行关闭
	}
	
});
