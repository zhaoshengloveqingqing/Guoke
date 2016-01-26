$(function(){
	$('.num_opreation a.reduce').click(function(){
		var t=$(this).next();
		t.val(parseInt(t.val())-1);
		if(parseInt(t.val())<1){
			t.val(1);
		}
	});
	$('.num_opreation .plus').click(function(){
		var t=$(this).prev();
		t.val(parseInt(t.val())+1);
	});
	$( ".number" ).data('oldamount', 1);


	$( ".number" ).on('keyup', function (e) {
		var self=$(this);
		var amount=self.val();

		if(amount == '0') {
			self.data('oldamount', amount);
			self.val(1);
		}

		if(amount == '' ||  $.isNumeric(amount)) {
			self.data('oldamount', amount);
		}
		else {
			self.val(self.data('oldamount'));
		}
	});

	$( ".number" ).on('blur', function(){
		var self=$(this);
		var amount=self.val();

		if(amount == '' || String(amount).indexOf(".")>-1) {
			self.val(1);
		}
	});

	$('.virtual-product-details ul li a').bind('click',function(){
	    $('.virtual-product-details ul li a').removeClass('active');
	    $(this).addClass("active");
	});

});



