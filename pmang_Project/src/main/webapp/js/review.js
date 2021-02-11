//사진등록
$('.reviewPhoto').change(function(e) {
	var files = e.target.files;
	var arr = Array.prototype.slice.call(files);

	// 업로드 가능 파일인지 체크
	for (var i = 0; i < files.length; i++) {
		if (!checkExtension(files[i].name, files[i].size)) {
			return false;
		}
	}

	if ($('#photoCountHidden').val() == 1) {
		if (files.length < 3) {
			checkNumber(files, arr);
		} else {
			alert('사진 첨부는 최대 3장까지 가능합니다.');
		}
	} else if ($('#photoCountHidden').val() == 2) {
		if (files.length < 2) {
			checkNumber(files, arr);
		} else {
			alert('사진 첨부는 최대 3장까지 가능합니다.');
		}
	} else if ($('#photoCountHidden').val() == 3) {
		alert('사진 첨부는 최대 3장까지 가능합니다.');

	} else {
		checkNumber(files, arr);
	}
});

function checkNumber(files, arr) {
	if (files.length > 3) {
		alert('사진 첨부는 최대 3장까지 가능합니다.');

	} else {
		$('#photoCountHidden').val(
				parseInt($('#photoCountHidden').val()) + files.length);
		preview(arr);
	}
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
}

function preview(arr){
	if(parseInt($('#photoCountHidden').val())<=3){
		arr.forEach(function(f){
			
			//파일명이 길면 파일명 ... 으로 처리
			var fileName=f.name;
			if(fileName.length>10){
				fileName=fileName.substring(0,7)+"...";
			}
			
			//div에 이미지 추가
			var str='<li class="photoli" onclick="removeimg(this)">';
			
			//이미지 파일 미리보기
			if(f.type.match('image.*')){
				var reader=new FileReader();	//파일을 읽기 위한 FileReader객체생성
				reader.onload=function(e){		//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					str+='<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
					str+='</li></div>';
					$(str).appendTo('.reviewPhotoPreview');
					
				}
				reader.readAsDataURL(f);
			}else{
				str+='<img src="/pmang/image/bench.jpg" title="'+f.name+'" width=100 height=100 />';
				$(str).appendTo('.reviewPhotoPreview');
				
			}
		});//arr.foreach
		
			$('.reviewPhotoLi').css('border-color','rgb(195,194,204)');
			
		
	}else{
		alert('사진 첨부는 최대 3장까지 가능합니다.');
	}
	
	
	
}


function removeimg(value){
	var result=confirm('선택한 이미지를 삭제하시겠습니까?');
	
	if(result){
		$(value).remove();
	}else{
		
	}
}

// 리뷰내용 글자수 제한
$('.reviewContent').keyup(function(e) {
	var content = $(this).val();
	$('#counter').html("(" + content.length + " / 최대 200자)"); // 글자수 실시간 카운팅
	
	if (content.length > 200) {
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('#counter').html("(200 / 최대 200자)");
	}
});
$('.reviewContent').mouseover(function(){
	$('.reviewContentDiv').css('border','3px solid green');
});
$('.reviewContent').mouseout(function(){
	$('.reviewContentDiv').css('border','1px solid #cbcbcb');
});


// 스탬프 스코어

$('.scoreLevel input[type=radio]').on('click', function() {

	var radio_chk = $(this).attr('id');
	$('.reviewOkBtn').attr('disabled', false);
	$(this).next().children().attr('src', '../image/main_logo.JPG');

	imageChange(radio_chk);
	function imageChange(clicked) {
		var radioOn = clicked;

		var radio_chk1 = $('input[id=level1]').attr('id');
		var radio_chk2 = $('input[id=level2]').attr('id');
		var radio_chk3 = $('input[id=level3]').attr('id');

		if (radioOn == radio_chk1) {
			$('#scoreLevel2').attr('src', '../image/grayPmang.png');
			$('#scoreLevel3').attr('src', '../image/grayPmang.png');

		} else if (radioOn == radio_chk2) {
			$('#scoreLevel1').attr('src', '../image/grayPmang.png');
			$('#scoreLevel3').attr('src', '../image/grayPmang.png');

		} else if (radioOn == radio_chk3) {
			$('#scoreLevel2').attr('src', '../image/grayPmang.png');
			$('#scoreLevel1').attr('src', '../image/grayPmang.png');

		}
	}

});

$('.reviewOkBtn').click(function(){
	
	let formData=new FormData($('#reviewWriteForm')[0]);
	//alert(formData);
	$.ajax({
		type:'post',
		enctype:'multipart/form-data',
		processData:false,
		contentType:false,
		url:'/pmang/board/reviewWrite',
		data:formData,
		success:function(data){
			alert('리뷰 작성을 완료하였습니다.');
			
		},
		error:function(err){
			console.log(err);
		}
	});
});


	