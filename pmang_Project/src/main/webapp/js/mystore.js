
//중복 클릭 방지 코드
var doubleSubmitFlag = false;
function doubleSubmitCheck() {
	if (doubleSubmitFlag) {
		return doubleSubmitFlag;
	} else {
		doubleSubmitFlag = true;
		return false;
	}
}



// 내상점정보수정
$('#storeIntroEditBtn').on(
		'click',
		function(e) {
			// e.stopPropagation();
			if (doubleSubmitCheck())
				return; // 중복클릭방지
			// alert('클릭');

			// 상점명
			var infoName = $('.infoName span').text();
			// $('#storeNameModify').hide();
			$('.infoName').empty();

			$('.infoName').append(
					'<input type="text" id="storeNameEdit" value="' + infoName
							+ '">');
			// $('#storeNameModify1').show();

			// 소개글
			$('#introEdit').hide();
			var mystoreIntroduce = $('#mystoreIntroduce textarea').text();
			$('#mystoreIntroduce').empty();

			$('#mystoreIntroduce').append(
					'<textarea id="storeIntro">' + mystoreIntroduce+ '</textarea>');

			$('.introEdit1').show();

			// 내상점정보수정버튼 -> db로 가서 고쳐야댐
			$('#storeIntroBtn').on(
					'click',
					function() {

						$.ajax({
							type : 'post',
							url : '/pmang/board/mystoreModify',
							data : 'marketname=' + $('#storeNameEdit').val()
									+ '&marketcontent='
									+ $('#storeIntro').val(),
							success : function() {
								alert('내 상점 정보가 수정되었습니다.');
								location.href = 'mystore?userid='+$('#memid').val();
							},
							error : function(err) {
								console.log(err);
							}

						});
					});
		});
