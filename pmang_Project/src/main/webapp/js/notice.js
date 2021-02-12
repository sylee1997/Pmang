$('.prohibitedLink').click(function() {
	$(location).attr("href", "/pmang/board/notice?tabNo=4");
	//거래항목 check조건은 index <script>에 포함됨
	
	$('#postArea_prohibitedItem').children('.postContent').slideDown();
	$('#postArea_prohibitedItem').children(".arrowImg").stop().css({'transform': 'rotate(180deg)'},200);
});


$('.bulletinArea').on('click',function(){
	$('.bulletinContent').slideUp();
	$(".arrowImg").stop().css({'transform': 'rotate(0deg)'},1000);
	
	if($(this).children('.bulletinContent').is(':visible')){
		$(this).children('.bulletinContent').slideUp();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(0deg)'},200);
	}else{
		$(this).children('.bulletinContent').slideDown();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(180deg)'},200);
	}//if

});//bulletinArea click


$('.postArea').click(function(){
	$('.postContent').slideUp();
	$(".arrowImg").stop().css({'transform': 'rotate(0deg)'},1000);
	
	if($(this).children('.postContent').is(':visible')){
		$(this).children('.postContent').slideUp();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(0deg)'},200);
	}else{
		$(this).children('.postContent').slideDown();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(180deg)'},200);
	}//if
	
});//postArea click


if($('#footerTabNo').val()=='1'){
	$('#tab1').attr('checked', true);
	
}else if($('#footerTabNo').val()=='2'){
	$('#tab2').attr('checked', true);
	
}else if($('#footerTabNo').val()=='3'){
	$('#tab3').attr('checked', true);
	
}else if($('#footerTabNo').val()=='4'){
	$('#tab3').attr('checked', true);
	$('#menu2').attr('checked', true);
	
}/*else{
	console.log($('#footerTabNo').val());
	$('#tab1').attr('checked', true);
}*/





//공지사항 불러오기
$('#noticeLabel').on('click',function(event){
	
	$.ajax({
		type: 'post',
		url: '/pmang/board/getNoticeList',
		dataType:'json',
		error: function(err){
			console.log(err)
		},
		success: function(result){
			
			console.log(result);
			console.log(result.list);
			
			$.each(result.list, function(index, items){
				$('<div/>',{
					class:'bulletinArea'})
							.append($('<div/>',{
								class:'arrowImg'})
										.append($('<img/>',{
											src:'/pmang/image/open.png',
											width:'20',
											height:'20'})))
							.append($('<div/>',{
								class:'bulletinTitle',
								text:'items.noticeSubject'}))
								
							.append($('<div/>',{
								class:'bulletinDate',
								text:'items.logtime'}))
								
							.append($('<div/>',{
								class:'bulletinContent',
								text:'items.noticeContent'}))
								
				.appendTo($('#bulletinDiv'));
			});//for
		}//success
	});//ajax
});//ajax












