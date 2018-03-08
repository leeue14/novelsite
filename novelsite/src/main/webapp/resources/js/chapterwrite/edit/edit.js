/**
 * 
 */

$(function() {
	// 获取最新草稿箱里面的内容
	// li点击事件
	addLiClick();
	var isNewChapter = 0;
	var clickLi = $("#draftList li:first");// 这个是点击的当前的li为了保存的时候获取章节的id号
	function addLiClick() {
		$("#draftList li").click(function() {
			var chapterId = $(this).data("chapterid");
			clickLi = $(this);// 当前点击的li对象先保存下来

			if (isNewChapter == 1) {
				layer.confirm('是否保存新章节？', {
					btn : [ '保存', '离开' ]
				// 按钮
				}, function() {
					// 保存
					saveChapter();
				}, function() {
					isNewChapter = 0;
					$("#create-button").data('id', -1);
					$("#draftList li:first").remove();
					clickLi = $("#draftList li:first");
					var formData = new FormData;
					formData.append("chapterId", chapterId);
					$.ajax({
						url : "/novelsite/chapteroperation/getlastchapter",
						type : "POST",
						data : formData,
						contentType : false,// 因为要传文件和文字
						processData : false,
						cache : false,
						async : false,
						success : function(data) {
							if (data.success) {
								$("#sectionEdit").html(data.divDate);
								/* layer.msg(data.chapter.chapterName); */
							}
						}
					});
					removeClass();
					clickLi.addClass('act');

				});
			} else {
				var formData = new FormData;
				formData.append("chapterId", chapterId);
				$.ajax({
					url : "/novelsite/chapteroperation/getlastchapter",
					type : "POST",
					data : formData,
					contentType : false,// 因为要传文件和文字
					processData : false,
					cache : false,
					async : false,
					success : function(data) {
						if (data.success) {
							/* alert(data.chapter.isVip); */
							$("#sectionEdit").html(data.divDate);
							// 这个select 选中

							$("#isVip").val(data.chapter.isVip);

						}
					}
				});
				removeClass();
				$(this).addClass('act');
			}
		});
	}
	// 移除选中 li样式
	function removeClass() {
		$("#draftList li").removeClass("act");
	}
	// 保存
	$("#saveDraftBtn").click(saveChapter);
	// 新建章节
	$("#create-button")
			.click(
					function() {
						var id = $(this).data("id");
						if (id == 0) {
							return;
						}
						if ($('#draftList li').length > 5) {
							layer.msg("草稿也是有限制的,试试发布吧!");
							return;
						}
						$(this).data('id', 0);// html页面看着没变,其实变了
						removeClass();
						var li = "<li class='act' data-chapterid='-1' > <div class='sectionBox'> "
								+ "<p> <em>无标题</em> </p> <p class='f12'> <i>"
								+ getNowDate() + "</i> </p> 	</div>	</li>";
						var divDate = "<input id='chapterTitleInput' name='chaptertitle' type='text'  "
								+ "placeholder='此处输入章节号与章节名。示例：“第十章 天降奇缘”'"
								+ " style='color: rgb(51, 51, 51);' />"
								+ "<textarea name='content' id='chapterContentInput'"
								+ "placeholder='请输入正文。请注意：根据国家相关法律法规要求，请勿上传任何色情、低俗、涉政等违法违规内容，我们将会根据法规进行审核处理和上报。'"
								+ "style='color: rgb(51, 51, 51);' ></textarea>";
						$("#sectionEdit").html(divDate);
						$("#draftList").prepend(li);

						isNewChapter = 1;
						clickLi = $("#draftList li:first");
					});

	// 发布章节
	$("#showPublishPopupBtn").click(function() {
		
		var chapterName = $("#chapterTitleInput").val();
		var isVip = $("#isVip option:selected").data("id");
		var chapterBody = $("#chapterContentInput").val();
		if (chapterBody != "" && chapterName != "") {
		var chapter = {};
		var chapterId = clickLi.data("chapterid");
		chapter.chapterId = chapterId;
		chapter.status = 1;//发布章节 status ==1
		chapter.chapterName = chapterName;
		chapter.body = chapterBody;
		chapter.isVip = isVip;
		url = "/novelsite/chapteroperation/updatechapter";
		layer.msg("发布了");
		var formData = new FormData();
		formData.append("chapterStr", JSON.stringify(chapter));
		$.ajax({
			url : url,
			type : "POST",
			data : formData,
			contentType : false,// 因为要传文件和文字
			processData : false,
			cache : false,
			success : function(data) {
				if (data.success) {
					layer.msg("发布成功", function() {
						if (data.redirct) {
							location.reload();
							/*window.location.replace(data.url);*/
							// parent.location.href = data.url;//这样父窗口就会刷新
						}
					});

				}

			}

		});}else{
			layer.msg("章节名或章节内容不能为空");
		}
		
	});
	
	
	// 保存章节
	function saveChapter() {
		var url = "/novelsite/chapteroperation/insertchapter";

		var chapterName = $("#chapterTitleInput").val();
		var isVip = $("#isVip option:selected").data("id");
		var chapterBody = $("#chapterContentInput").val();
		if (chapterBody != "" && chapterName != "") {
			var chapter = {};
			var chapterId = clickLi.data("chapterid");

			if (chapterId != -1) {
				chapter.chapterId = chapterId;
				url = "/novelsite/chapteroperation/updatechapter"
			}
			chapter.chapterName = chapterName;
			chapter.body = chapterBody;
			chapter.isVip = isVip;

			var formData = new FormData();
			formData.append("chapterStr", JSON.stringify(chapter));
			$.ajax({
				url : url,
				type : "POST",
				data : formData,
				contentType : false,// 因为要传文件和文字
				processData : false,
				cache : false,
				success : function(data) {
					if (data.success) {
						layer.msg("保存成功", function() {
							if (data.redirct) {
								location.reload();
							/*	window.location.replace(data.url);*/

								// parent.location.href = data.url;//这样父窗口就会刷新
							}
						});

					}

				}

			});
			/* chapter. */
		} else {
			layer.msg("章节名或章节内容不能为空");
		}
	}

	// 获取当前时间
	function getNowDate() {
		var nowDate = new Date();
		var year = "" + nowDate.getFullYear();
		var mouth = nowDate.getMonth() + 1;
		var date = nowDate.getDate();
		return year + "年" + mouth + "月" + date + "日";
	}

	// select 选中
	function isSelect() {
		$("#isVip").val("");
	}
	
	//删除章节
	$("#deleteDraftBtn").click(function(){
		layer.msg("删除");
		var chapterId = clickLi.data("chapterid");
		if(chapterId == -1){
			return;
		}
		var formData = new FormData();
		formData.append("chapterId", chapterId);
		$.ajax({
			url : "/novelsite/chapteroperation/deletechapter",
			type : "POST",
			data : formData,
			contentType : false,// 因为要传文件和文字
			processData : false,
			cache : false,
			success : function(data) {
				if (data.success) {
					layer.msg("删除成功", function() {
						location.reload();
					});

				}

			}
		});
		
		
	});
	

});