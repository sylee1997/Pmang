$(document).ready(function() {
	//구매,판매 탭메뉴
	$('.logTabs li').click(function() {
		var idx = $(this).index();
		$('.logTabs li').removeClass('current');
		$('.logTabs li').eq(idx).addClass('current');

		$('.logTabContent > div').hide();
		$('.logTabContent > div').eq(idx).show();

	});
	
	//거래상태 탭메뉴
	
	$(".current > a").last().hide();
	var radioContent=$(".current > a");
	
	$("input[type='radio']").click(function(){
			radioContent.hide();
			radioContent.eq($("input[type='radio']").index(this)).show();
		});
});