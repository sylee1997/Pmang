$('.noticeArea').click(function(){
	$('.noticeContent').slideUp();
	
	if($(this).children('.noticeContent').is(':visible')){
		$(this).children('.noticeContent').slideUp();
	}else{
		$(this).children('.noticeContent').slideDown();
	}//if
	
});//noticeArea click

