$(document).on("turbolinks:load",function(){
	var count = $('.bannerPic>li').length;
	var picWidth = $('.bannerPic>li').eq(0).width();
	var circle = "";
	var picNum = 1;
	var index;
	
	$(window).resize(function(){
		picWidth = $('.bannerPic>li').eq(0).width();
	});
	$(window).scroll(function(){
		if($(window).scrollTop() > 50){
			$('.topCon').fadeIn(300);
		}else{
			$('.topCon').fadeOut(300);
		}
	});
	$('.bannerControl ul').on('click','li',function(e){
		clearInterval(t);
		index = $(e.target).index();
		$('.bannerPic>li').eq(0).animate({marginLeft: -(index*picWidth)},500);
		$('.bannerControl ul li').removeClass('focus');
		$(e.target).addClass('focus');
	});
	$('.bannerControl').on('mouseleave','ul',function(){
		picNum = index;
		t = setInterval(function(){
			if(picNum > count -1) picNum = 0;
				bannerMove(picNum,picWidth);
				picNum++;
			},6000);
	});
	if($('.bannerPic').length > 0){
		for (var i = count - 1; i >= 0; i--) {
			circle += "<li></li>"
		}
		var t = setInterval(function(){
			if(picNum > count -1) picNum = 0;
			bannerMove(picNum,picWidth);
			picNum++;
		},6000);
		$('.bannerControl ul').html(circle);
		$('.bannerControl ul li').eq(0).addClass('focus');
	}
	
	$('.topCon').click(function(){
		topCon();
	});
	$('.video').click(function(){
		var videoSrc = $('.video-box iframe').attr('s');
		$('.video-box').css('display','block');
		$('.video-box iframe').attr('src',videoSrc);
	});
	$('.pCreate').click(function(){
		$('.pc').css('display','block');
	});
	$('.ea').click(function(){
		$('.pc-about').css('display','block');
	});
	$('.close').click(function(e){
		if($(e.target).parents('.video-box').length > 0){
			$('.video-box').css('display','none');
			$('.video-box iframe').attr('src','');
		}
		if($(e.target).parents('.pc').length > 0){
			$('.pc').css('display','none');
		}
		if ($(e.target).parents('.alert').length > 0) {
			$('.alert').css('display','none');
		}
		if($(e.target).parents('.pc-about').length > 0){
			$('.pc-about').css('display','none');
		}
		
	});

});

function bannerMove(picNum,picWidth){
	$('.bannerPic>li').eq(0).animate({marginLeft: -(picNum*picWidth)},500);
	$('.bannerControl ul li').removeClass('focus');
	$('.bannerControl ul li').eq(picNum).addClass('focus');
};
function topCon(){
	$('document,html,body').animate({scrollTop: 0},500);
}