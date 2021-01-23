//프로필 사진 변경 -> 이건 DB랑 연동해야할거 같아서 일단 업로드창 띄우는거까지만 구현 210121(승은)
//https://doolyit.tistory.com/204 ************** 참고


//중복 클릭 방지 코드
  var doubleSubmitFlag = false;
    function doubleSubmitCheck(){
        if(doubleSubmitFlag){
            return doubleSubmitFlag;
        }else{
            doubleSubmitFlag = true;
            return false;
        }
    }


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
$('#storeNameEditBtn').on('click',function(){
	$('#storeNameModify').hide();
	$('.infoName').empty();
	
	$('.infoName').append('<input type=text id=storeNameEdit>');
	$('#storeNameModify1').show();
	
	$('#storeNameEditBtn1').click(function(){
		
		var storename=$('#storeNameEdit').val();
		if(storename==''){
			alert('상점명을 입력해주세요');
		}else{
			alert('수정하시겠습니까?');
			$('.infoName').text(storename);
			$('#storeNameModify').show();;
			$('#storeNameModify1').hide();
		}
		
	});
	});


// 소개글 수정
$('#storeIntroEditBtn').on('click', function() {
	
	$('#introEdit').hide();
	$('#mystoreIntroduce').empty();

	$('#mystoreIntroduce').append('<textarea id=storeIntro></textarea>');
	$('.introEdit1').show();

	// 소개글 수정하기 --->아직 구현 안했음(db)
	$('#storeIntroBtn').click(function() {
		
		
		
		alert('수정완료');
		var intro=$('#storeIntro').val();	//db에 저장해야함
		$('#mystoreIntroduce').text(intro);
		
		$('#introEdit').show();
		$('.introEdit1').hide();
		/* location.href='/mystore.jsp'; */
	});
});

// 셀렉트박스 커스텀
function CustomSelectBox(selector) {
	this.$selectBox = null, this.$select = null, this.$list = null,
			this.$listLi = null;
//https://medium.com/@bluesh55/javascript-prototype-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-f8e67c286b67 참고 사이트(.prototype)
	CustomSelectBox.prototype.init = function(selector) {		//.prototype은 자바스크립트의 상속기능을 사용하기 위해 사용함(class대체)
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
		$('#selectCategory').empty();
		
		$('#selectCategory').text($target.text());
		//db에서 카테고리에 맞는 상품게시글의 개수를 span태그에 넣어줘야함
		var su=0;
		$('#selectCategory').append('<span>'+su+'</span>');
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
	
	if(doubleSubmitCheck()) return;
	
	
	if (!$("input:checked[id='chk_li']").is(":checked")) {
		alert("삭제할 찜을 선택하세요.");
		$("#choice_chk").focus();
		return;
	}
});

//탭메뉴 - 찜 전체선택
$(document).on("click","input[id='choice_chk']",function(){
	if(doubleSubmitCheck()) return;
	
	
	var chk=$(this).is(":checked");
	if(chk){
		$(".favChoice input").prop('checked',true);
		
	}else{
		$(".favChoice input").prop('checked',false);
		
	}
});

