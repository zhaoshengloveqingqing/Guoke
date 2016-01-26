$(function(){
	var screen_width=document.body.scrollWidth;
	if(screen_width > 767){
		$('.joinus a').hover(
			function(){
				$(this).children('.join-content').addClass('show');
			},
			function(){
				$(this).children('.join-content').removeClass('show');
			}
		);
	}
});




jQuery(document).ready(function($){
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
	//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
			offset_opacity = 1200,
	//duration of the top scrolling animation (in ms)
			scroll_top_duration = 700,
	//grab the "back to top" link
			$back_to_top = $('a.top');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible');
		//if( $(this).scrollTop() > offset_opacity ) {
		//	$back_to_top.addClass('cd-fade-out');
		//}
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
					scrollTop: 0 ,
				}, scroll_top_duration
		);
	});

	$.ajax({
		type: "POST",
		url: Clips.siteUrl('about/getAboutBanner'),
		dataType: "",
		data: {},
		success : function(data){
			if(data){
				$.each(jQuery.parseJSON(data),function(n,c){
					var obj= jQuery.parseJSON(c.contents);
					$.each(obj,function(k,v){
						$('.banner h3').html(v.title);
						$('.banner .left p').html(v.title);
						$('.banner .right p').html(v.title);

                        var path = Clips.staticUrl('application/static/img/'+v.path);
						$('.banner').css('background-image','url('+path+')');
                    });
				});
			}else{
				alert('error');
			}
		}
	});

});
