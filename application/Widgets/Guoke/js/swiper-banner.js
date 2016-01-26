$(function(){

	$("label.submit").click(function(event){
		if($(this).hasClass('active')) {
			$('form[name=search]').submit();
		}
		else {
			$(this).prev().addClass('visble');
			$(this).addClass('active');
			event.preventDefault();
		}
	});
	$(".language").click(function(){
		$(".language-downdrop").toggle();
	});


	$(".icound_shoppping").hover(
		function(){
				$('.icound-more').addClass('icound-more-show');
		}
	);
	$("#right_fixed").hover(
			function(){
			},function(){
				if($('.icound-more').hasClass('icound-more-show')){
					$('.icound-more').removeClass('icound-more-show');
				}
			}
	);

	$(".meun-icon").click(function(){
		if($("#navigation").hasClass('show')) {
			$("#navigation").removeClass("show");
		}
		else {
			$("#navigation").addClass("show");
		}
	});

	var mySwiper = new Swiper ('.swiper-banner', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		// If we need pagination
		pagination: '.swiper-pagination',
		paginationClickable :true,
		// Navigation arrows
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev'
	});
	var mySwiper1 = new Swiper ('.swiper-container', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		// If we need pagination
		pagination: '.swiper-pagination1',
		paginationClickable :true,
		// Navigation arrows
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev'
	});
})

