$(document).ready(function() {
	// 더보기버튼 모달
	$('.addBtn').on('click', function() {
		$('.all_modal').addClass('on');
		$('.modal_div').css('position', 'fixed');
		$('.modal_div').css('right', '50%');
		$('.modal_div').css('bottom', '50%');
		
		//모달바탕 클릭했을때(꺼짐)
		$('.on').click(function() {
			$('.all_modal').removeClass('on');
			$('.modal_div').css('position', 'static');
		});
		//알림끄기

		//차단
		
		//신고
		
		//나가기
	});

});