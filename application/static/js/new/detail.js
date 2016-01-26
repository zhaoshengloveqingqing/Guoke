$(function(){
	$('.menubar  a').hover(function(){
		$('.menubar  a').removeClass("active");
		$(this).addClass("active");
		var index=$(this).attr("data");
		$('.data-control .data').removeClass("on");
		$('.data-control .'+index).addClass("on");
	});

	$('.menubar a').bind('click',function(){
		var categoryId = $(this).attr('id');
		$.ajax({
			type: "POST",
			url: Clips.siteUrl('service/set_session_category_id'),
			dataType: "",
			data: {categoryId:categoryId},
			success : function(data){
				console.log(data);
				if(data){
					location.href = Clips.siteUrl('service/index/'+categoryId);
				}else{
					console.log('error');
				}
			}
		});

	});

	$('.pre').bind('click',function(){
		var id = parseInt($(this).parent().attr('id'))-1;
		location.href = Clips.siteUrl("service/news_detail/"+id);
	});

	$('.next').bind('click',function(){
		var id = parseInt($(this).parent().attr('id'))+1;
		location.href = Clips.siteUrl("service/news_detail/"+id);
	});

});


