$(function(){
	$('.qr-image').bind('click',function(){
		$(this).parent().parent().hide().next().show();
	});
	$('.back-btn').bind('click',function(){
		$(this).parent().hide().prev().show();
	});

	function getCheckcode(){
		$.ajax({
			type: "POST",
			url: Clips.siteUrl('login/get_checkcode'),
			dataType: "",
			data: {},
			success : function(data){
				if(data){
					$('#checkCode img').attr('src',data);
				}else{
					alert('error');
				}
			}
		});
	}
	$('.other a').bind('click',function(){
		getCheckcode();
	});
	getCheckcode();

});


