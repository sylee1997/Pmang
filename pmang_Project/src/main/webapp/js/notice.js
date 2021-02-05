$('.prohibitedLink').click(function() {
	$(location).attr("href", "/pmang/board/notice?tabNo=4");
	//거래항목 check조건은 index <script>에 포함됨
	
	$('#postArea_prohibitedItem').children('.postContent').slideDown();
	$('#postArea_prohibitedItem').children(".arrowImg").stop().css({'transform': 'rotate(180deg)'},200);
});







$('.bulletinArea').click(function(){
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







