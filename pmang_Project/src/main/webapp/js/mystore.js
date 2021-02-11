
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

// 프로필사진 변경

/*$('.profileImgModify').change(
		function(e) {
			if (doubleSubmitCheck())
				return; // 중복클릭방지

			var files = e.target.files;

			// 업로드 가능 파일인지 체크
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
			}

			// var result=confirm('프로필 사진을 변경하시겠습니까?');

			priview(files);
			
});

function priview(f){
	//프로필사진변경 div에 추가

		var reader=new FileReader();
		reader.onload=function(e){
			$('.mystoreProfileImg').empty();
			var str='<div class="mystoreProfileImg"><img src="'+e.target.result+'" title="'+f.name+'" width=150 height=150/>';
			str+='</div>';
			
			$(str).appendTo('.mystoreProfile');
		}
		reader.readAsDataURL(f);
	
	
}
function changeValue(obj){
	let formData = new FormData($('#mystoreForm')[0]);

	//alert('실행');
	$.ajax({
		type : 'post',
		enctype : 'multipart/form-data',
		processData : false,
		contentType : false,
		url : '/pmang/board/profileImgModify',
		dataType : formData,
		error : function(err) {
			alert('프로필 사진 변경 실패');
		},
		success : function(data) {
			$('.mystoreProfileImg').css('background',
					'url(' + e.target.result + ')');

		}
	});
}
function checkExtension(fileName, fileSize) {
	var ragex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 20971520; // 20MB

	if (fileSize >= maxSize) {
		alert('파일 사이즈 초과');
		$("input[type='file']").val(""); // 파일 초기화
		return false;
	}

	if (ragex.test(fileName)) {
		alert('업로드 불가능한 파일이 있습니다.');
		$("input[type='file']").val(""); // 파일 초기화
		return false;
	}
	return true;
}*/


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
					'<textarea id="storeIntro">' + mystoreIntroduce
							+ '</textarea>');

			$('.introEdit1').show();

			// 내상점정보수정버튼 -> db로 가서 고쳐야댐
			$('#storeIntroBtn').on(
					'click',
					function() {

						$.ajax({
							type : 'post',
							url : 'mystoreModify',
							data : 'marketname=' + $('#storeNameEdit').val()
									+ '&marketcontent='
									+ $('#storeIntro').val(),
							success : function() {
								alert('내 상점 정보가 수정되었습니다.');
								location.href = 'mystore';
							},
							error : function(err) {
								console.log(err);
							}

						});
					});
		});
