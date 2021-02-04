$(document).ready(function(){
	
});

$('.postArea').click(function(){
	$('.postContent').slideUp();
	
	if($(this).children('.postContent').is(':visible')){
		$(this).children('.postContent').slideUp();
	}else{
		$(this).children('.postContent').slideDown();
	}//if
	
});//postArea click


$('.prohibitedLink').click(function(){
	console.log("ㅇㅇㅇ");
	
	$('#tab2').prop('checked', true);
	$('#tab2').attr('checked', true);
});//prohibitedItem click


$('.bulletinArea').click(function(){
	$('.bulletinContent').slideUp();
	$(".arrowImg").stop().css({'transform': 'rotate(0deg)'},1000);
	
	if($(this).children('.bulletinContent').is(':visible')){
		$(this).children('.bulletinContent').slideUp();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(0deg)'},10);
	}else{
		$(this).children('.bulletinContent').slideDown();
		$(this).children(".arrowImg").stop().css({'transform': 'rotate(180deg)'},10);
	}//if
	
});//bulletinArea click