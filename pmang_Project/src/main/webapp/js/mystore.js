//프로필 사진 변경 -> 이건 DB랑 연동해야할거 같아서 일단 업로드창 띄우는거까지만 구현 210121(승은)
//https://doolyit.tistory.com/204 ************** 참고
function changeValue(obj) {
	document.signform.submit();
}

$('#mystoreProfileImg').click(
		function(e) {
			document.signform.profileUpload_url.value = document
					.getElementById('mystoreProfileImg').src;
			e.preventDefault();
			$('#profile').click();
		});

// 상점명 수정
$('#storeNameEditBtn').on(
		'click',
		function() {
			$('#mystoreInfoName').empty();

			$('#mystoreInfoName').append('<input type=text id=storeNameEdit>')
					.append('<input type=button id=storeNameBtn value=확인>');

			// 수정할 상점명 유효성 검사 및 수정하기 --> 수정하기는 아직 구현안했음.(db)
			$('#storeNameBtn').click(function() {
				if ($('#storeNameEdit').val() == '')
					alert('상점명을 입력해주세요');
			});
		});

// 소개글 수정
$('#storeIntroEditBtn').on('click', function() {
	$('#introEdit').empty();
	$('#mystoreIntroduce').empty();

	$('#mystoreIntroduce').append('<textarea id=storeIntro></textarea>');
	$('#introEdit').append('<input type=button id=storeIntroBtn value=확인>');

	// 소개글 수정하기 --->아직 구현 안했음(db)
	$('#storeIntroBtn').click(function() {
		alert('수정완료');
		/* location.href='/mystore.jsp'; */
	});
});

// 셀렉트박스 커스텀
function CustomSelectBox(selector) {
	this.$selectBox = null, this.$select = null, this.$list = null,
			this.$listLi = null;
	CustomSelectBox.prototype.init = function(selector) {
		this.$selectBox = $(selector);
		this.$select = this.$selectBox.find('.box .select');
		this.$list = this.$selectBox.find('.box .selectList');
		this.$listLi = this.$list.children('li');
	}
	CustomSelectBox.prototype.initEvent = function(e) {
		var that = this;
		this.$select.on('click', function(e) {
			that.listOn();
		});
		this.$listLi.on('click', function(e) {
			that.listSelect($(this));
		});
		$(document).on('click', function(e) {
			that.listOff($(e.target));
		});
	}
	CustomSelectBox.prototype.listOn = function() {
		this.$selectBox.toggleClass('on');
		if (this.$selectBox.hasClass('on')) {
			this.$list.css('display', 'block');
		} else {
			this.$list.css('display', 'none');
		}
		;
	}
	CustomSelectBox.prototype.listSelect = function($target) {
		$target.addClass('selected').siblings('li').removeClass('selected');
		this.$selectBox.removeClass('on');
		this.$select.text($target.text());
		this.$list.css('display', 'none');
	}
	CustomSelectBox.prototype.listOff = function($target) {
		if (!$target.is(this.$select) && this.$selectBox.hasClass('on')) {
			this.$selectBox.removeClass('on');
			this.$list.css('display', 'none');
		}
		;
	}
	this.init(selector);
	this.initEvent();
}
// 셀렉스박스 인스턴스 생성
var select = new CustomSelectBox('.select_box');


// 탭메뉴 - 찜(선택삭제) 유효성검사
$(document).on("click",".choiceDeleteBtn",function(){
	if (!$("input:checked[id='choice_chk']").is(":checked")) {
		alert("삭제할 찜을 선택하세요.");
		$("#choice_chk").focus();
		return;
	}
});

//탭메뉴 - 찜 전체선택
$(document).on("click","input[id='choice_chk']",function(){
	var chk=$(this).is(":checked");
	if(chk){
		$(".mystoreFav input").prop('checked',true);
		
	}else{
		$(".mystoreFav input").prop('checked',false);
		
	}
});

