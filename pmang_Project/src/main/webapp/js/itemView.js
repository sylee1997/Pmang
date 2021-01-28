$(document).ready(function(){
	
	$('.contentMenu').click(function(){
		var contentSection = $(this).attr('data-tab');/* 매뉴탭 data-tab값 */
		/* content 탭메뉴 선택 */
		$('li').removeClass('current');
		$(this).addClass('current');
		
		/* To스크롤 */
		var offset = $("#"+contentSection).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
		
		
	});
	/* 문의댓글 글자 수 제한 */
	$('#replyText').on('keyup', function(e) {
		var replyText = $(this).val();
		$(this).height(((replyText.split('\n').length + 1) * 1.5) + 'em');
		$('#count').html(replyText.length);	
		if(replyText.length >= 300){
			 alert("최대 300자까지 입력 가능합니다.");
			 $('#count').css('color', 'red');
		}else
			$('#count').css('color', 'black');

		
	});
	$('#count').keyup();
	
	/* 댓글등록버튼 */
	$('#replyBtn').click(function() {
		/* 댓글 공백 유효성 검사 */
		if($('#replyText').val()==''){
			alert('댓글내용을 입력해주세요');
			 $('#replyText').focus();
		}
	});

});