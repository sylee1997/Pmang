

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

//프로필사진 변경
$('.profileImgModify').change(function(e){
	if(doubleSubmitCheck()) return;	//중복클릭방지
	
	var files=e.target.files;
	
	//업로드 가능 파일인지 체크
	for(var i=0;i<files.length;i++){
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}
	}
	
	var result=confirm('프로필 사진을 변경하시겠습니까?');
	
	let formData=new FormData($('#mystoreForm')[0]);
	
	if(result){	//yes
		$.ajax({
			type:'POST',
			enctype:'multipart/form-data',
			processData:false,
			contentType:false,
			url:'/pmang/board/profileImgModify',
			dataType:formData,
			error:function(err){
				alert('프로필 사진 변경 실패');
			},
			success:function(data){
				$('.mystoreProfileImg').css('background','url('+e.target.result+')');
				
			}
		});
	}else{
		//no
	}
	
});
function checkExtension(fileName,fileSize){
	var ragex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 20971520; // 20MB
	
	if(fileSize>=maxSize){
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



//내상점정보수정
$('#storeIntroEditBtn').on('click',function(e){
	//e.stopPropagation();
	if(doubleSubmitCheck()) return;	//중복클릭방지
	//alert('클릭');
	
	//상점명
	var infoName=$('.infoName span').text();
	//$('#storeNameModify').hide();
	$('.infoName').empty();
	
	$('.infoName').append('<input type="text" id="storeNameEdit" value="'+infoName+'">');
	//$('#storeNameModify1').show();
	
	//소개글
	$('#introEdit').hide();
	var mystoreIntroduce=$('#mystoreIntroduce textarea').text();
	$('#mystoreIntroduce').empty();

	$('#mystoreIntroduce').append('<textarea id="storeIntro">'+mystoreIntroduce+'</textarea>');
	
	$('.introEdit1').show();
	
	//내상점정보수정버튼 -> db로 가서 고쳐야댐
	$('#storeIntroBtn').on('click',function(){
		
		
		
		$.ajax({
			type:'post',
			url:'mystoreModify',
			data:'marketname='+$('#storeNameEdit').val()+'&marketcontent='+$('#storeIntro').val(),
			success:function(){
				alert('내 상점 정보가 수정되었습니다.');
				location.href='mystore';
			},
			error:function(err){
				console.log(err);
			}
			
		});
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




