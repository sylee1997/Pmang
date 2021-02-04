
//처음 들어올때
$(document).ready(function(){
	$('#category2').hide();
	$('#category3').hide();
	
	//$('.imageCount').text('('+$('#imageCountHidden').val()+'/3)');
});


//이미지 등록할 때 사진 리스트 추가 , 사진 갯수 (0/3) 구현해야함


$('.imageChoice').change(function(e){
	alert($('#imageCountHidden').val());
	var files = e.target.files;
	var arr = Array.prototype.slice.call(files);

	//업로드 가능 파일인지 체크
	for(var i=0; i<files.length; i++){
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}
	}
	
	
	if($('#imageCountHidden').val() == 1){
		if(files.length < 3){
			checkNumber(files, arr);
		}else{
			alert('사진 첨부는 최대 3장까지 가능합니다.')
		}
	}else if($('#imageCountHidden').val() == 2){
		if(files.length < 2){
			checkNumber(files, arr);
		}else {
			alert('사진 첨부는 최대 3장까지 가능합니다.')
		}
	}else if($('#imageCountHidden').val() == 3){
		alert('사진 첨부는 최대 3장까지 가능합니다.')
	}else{
		checkNumber(files, arr);
	}
	
	
});


function checkNumber(files, arr){
	if(files.length > 3){
		alert('사진 첨부는 최대 3장까지 가능합니다.')
	}else{
		$('#imageCountHidden').val(parseInt($('#imageCountHidden').val()) + files.length);
		preview(arr);
	}
}



function checkExtension(fileName, fileSize){

    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 20971520;  //20MB
    
    if(fileSize >= maxSize){
      alert('파일 사이즈 초과');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    
    if(regex.test(fileName)){
      alert('업로드 불가능한 파일이 있습니다.');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    return true;
}
  

function preview(arr){
	if(parseInt($('#imageCountHidden').val()) <= 3){

	arr.forEach(function(f, index){
      
      //파일명이 길면 파일명...으로 처리
      var fileName = f.name;
      if(fileName.length > 10){
        fileName = fileName.substring(0,7)+"...";
      }
      
      //div에 이미지 추가
      var str = '<li class="imgli">';
      /*str += '<span>'+fileName+'</span><br>';*/
      
      //이미지 파일 미리보기
      if(f.type.match('image.*')){
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
          //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
          if(index == 0 && $('#imgrep').length == 0){
        	  str += '<div id="imgrep">대표이미지</div>';
          }
          str += '<img src="'+e.target.result+'" title="'+f.name+'" width=202 height=202 />';
          str += '<button id="imgpreBtn"><img src="/pmang/image/closeBtn.png" alt="close" width=20 height=20"></button>';
          str += '</li>';
          $(str).appendTo('.imageChoice_ul');
        } 
        reader.readAsDataURL(f);
      }else{
        str += '<img src="/pmang/image/bench.jpg" title="'+f.name+'" width=202 height=202 />';
        $(str).appendTo('.imageChoice_ul');
      }
    
    });//arr.forEach
		
		$('.imageCount').text('('+String($('#imageCountHidden').val())+'/3)');
		$('.imageChoice_li').css('border-color','rgb(195, 194, 204)');
		$('#imageCheck').hide();
  }else{
	  alert('사진 첨부는 최대 3장까지 가능합니다.');
  }
}



$('.imageChoice_ul').on('click','#imgpreBtn',function(){
	$(this).parent('.imgli').remove();
	$('.imageChoice_ul').children().eq(1).append($('<div id="imgrep">대표이미지</div>'));
	$('#imageCountHidden').val(parseInt($('#imageCountHidden').val())-1);
	$('.imageCount').text('('+String($('#imageCountHidden').val())+'/3)');
});





//카테고리
$('#category1').on('click','button',function(){
//	alert($(this).text());
	let category1 = $(this).text();//Controller로 가져갈 변수.
	$('#choice').text($(this).text());
});//category2,3 도 동일하게 구현하면된다.


//제목 글자수 count

$('input[name=itemSubject]').on('keyup', function() {
	var subjectText = $(this).val();
	$('#textLength').html('('+subjectText.length + '/40)');   
	
	if(subjectText.length >= 40){
		alert("최대 40자까지 입력 가능합니다.");
		$('#textLength').css('color', 'red');
	}else
		$('#textLength').css('color', 'black');
      
});


$('input[name=itemSubject]').click(function(){
	var subjectText = $(this).val();
	if(subjectText.length > 1){
		$('.itemSubjectText').css('border-color','rgb(195, 194, 204)');
		$('input[name=itemSubject]').css('border-color','rgb(195, 194, 204)');
		$('.itemSubjectDiv').hide();
	}
});


$('input[name=itemSubject]').focus(function(){
	$('.itemSubjectText').css('border-color','rgb(195, 194, 204)');
	$('input[name=itemSubject]').css('border-color','rgb(195, 194, 204)');
	$('.itemSubjectDiv').hide();
	
});

$('input[name=itemSubject]').blur(function(){
	var subjectText = $(this).val();
	if(subjectText.length < 2){
		$('.itemSubjectText').css('border-color','green');
		$('input[name=itemSubject]').css('border-color','green');
		$('.itemSubjectDiv').show();
	}
});

//x눌렀을 때 상품제목 글자 다 없애기
$("#textRemoveClick").click(function(){
	$('input[name=itemSubject]').val('');
	$('#textRemove').hide();
});





//상품내용
$('textarea[name=item_content]').on('keyup', function() {

	var contentText = $(this).val();
	$('#contentLength').html('('+contentText.length + '/2000)');   
	
	if(contentText.length >= 2000){
		alert("최대 2000자까지 입력 가능합니다.");
		$('#contentLength').css('color', 'red');
	}else
		$('#contentLength').css('color', 'black');
      
});

//수량 숫자만 입력
$('#qtyparent').on('keyup','input',function(){
	qtyVal = $('.qty_input').val();
	let qtyRule = /^[0-9]$/; // * 이 기존에 {1,3}
	let reg1 = /[^0-9]/g;
	
	if(!qtyRule.test(qtyVal)){
		$('.qty_input').val(qtyVal.replace(reg1,''));
		//alert("숫자만 입력해주세요.");
	}
});

//가격 숫자만 입력
/*$('#priceparent').on('keyup','input',function(e){
	
	let priceVal = $('input[name=item_price]').val();
	let priceRule = /^[0-9]$/;// * 이 기존에 {0,9}
	let reg2 =/[^0-9]/g;   
	
>>>>>>> refs/heads/main
	if(!priceRule.test(priceVal)){
		$('input[name=item_price]').val(priceVal.replace(reg2,''));
		//alert("숫자만 입력해주세요.");
	}
	
	if(priceVal < 100){
		$('#priceDiv').text('100원 이상 입력해주세요.');
	}else{
		$('#priceDiv').text('');
	}
	
	
	$('input[name=price]').val(addComma($('input[name=price]').val()));
});*/


$("input[name='item_price']").bind('keyup', function(e){
	var rgx1 = /\D/g; //\d의 반대인 \D(숫자가 아닌것들)은 반복검색해서 추출함.
	var rgx2 = /(\d+)(\d{3})/;
	var num = this.value.replace(rgx1,"");
	
	if($(this).val() < 100){
		$('#priceDiv').text('※100원 이상 입력해주세요.');
		$('.price_input').css('border','1px solid green');
		while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
		this.value = num;
	}else{
		$('#priceDiv').text('');
		$('.price_input').css('border','1px solid rgb(195, 194, 204)');
		while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
		this.value = num;
	}
	
	
	var realNum = $(this).val().replace(/\,/g,'');
	if(realNum < 100){
		$('#priceDiv').text('※100원 이상 입력해주세요.');
	}
	
/*	if(rgx3.test(this.val())){
		$('#priceDiv').text('※100원 이상 입력해주세요.');
	}else{
		$('#priceDiv').text('');
		$('.price_input').css('border','1px solid rgb(195, 194, 204)');
	}*/
	
});

//가격 콤마
/*	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	 
	//콤마풀기
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	 
	//값 입력시 콤마찍기
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}*/

//3자리마다 콤마. 결과는 잘 나오지만 특수문자(,) 를 하나의 문자로 인식하여 /^[0-9]{1,9}$/ 정규식에 의해 걸림..
/*function addComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp,',');
}*/

//해시태그추가
   //hashtag text에 글자입력하고 스페이스바 눌렀을때 이벤트 발생
var hashtag_count = 0;

$('#hashtag').on('keydown', function(e) {
    var text = $('#hashtag').val().trim();
    
    
	if(e.keyCode == 32){
		if(hashtag_count < 3){
			$('<li/>').append($('<button/>',{
				type: 'button',
				text: '#' + text,
				class: 'hashtag_button',
				name: 'hashtag' + (hashtag_count+1) //해시태그값을 저장해 놓은 변수. ajax에서 이용.
			})).append($('<button/>',{
				type: 'button',
				class: 'hashtag_closeBtn',
				id: 'hashtag_closeBtn'
			})).appendTo($('.hashtag_ul'));
				$('#hashtag').val('');
				hashtag_count ++;
		}
		/*else{
			alert('hashtag는 3개까지 입력 가능합니다.');
			$('#hashtag').val('');
		}*/
		if(hashtag_count == 3){
			$('#hashtagdetail2_div').hide();
		}
	}
    
});

$('#hashtag_div_this').on('click','#hashtag_closeBtn',function(){
	$(this).parent().remove();//li를 삭제.
	/*if(hashtag_count == 1){
		$('#hashtag_div_this').hidden();//만약 li태그가 한개도 없을때는 div영역을 삭제. 잘했따
	}else{
		
		$('#hashtagdetail2_div').show();
	}*/
	$('#hashtagdetail2_div').show();
	hashtag_count --;
});


//내 위치
$("#mylocation").click(function(){
	if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	var lat = position.coords.latitude; //위도
	    	var lon = position.coords.longitude; //경도
	      	positionCheck(lat, lon);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('현재 위치를 가져올 수 없습니다. \n 브라우저 설정의 위치정보 사용을 허용으로 바꾸어 주시거나 GPS사용을 on으로 변경 후 다시 시도해 주세요.');
	  }
	
});

function positionCheck(lat, lon){
	var position = new daum.maps.LatLng(lat, lon); 
	searchDetailAddrFromCoords(position, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          
            var detailAddr = result[0].address.address_name;
           
            $('.location_input').val(detailAddr);
        }   
    });
}

function searchDetailAddrFromCoords(coords, callback) {
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

//주소 검색
$("#searchlocation").click(function(){
	$('.searchlocationModal').css('display', 'flex');
	$('body').css('overflow','hidden');
/*	$('.searchlocationModal').on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
	});*/
});

$('.searchlocationCloseBtn').click(function(){
	$('.searchlocationModal').hide();
	$('.recentlyModal').hide();
	$('body').css('overflow','auto');
	$('.searchlocationInput').val('');
/*	$('.searchlocationModal').off('scroll touchmove mousewheel');
	$('.recentlyModal').off('scroll touchmove mousewheel');*/
});

$(document).click(function(e){
	if($('.searchlocationModal').is(e.target)){
		$('.searchlocationModal').hide(); 
		$('body').css('overflow','auto');
		$('.searchlocationInput').val('');
/*		$('.searchlocationModal').off('scroll touchmove mousewheel');*/
	}else if($('.recentlyModal').is(e.target)){
		$('.recentlyModal').hide(); 
		$('body').css('overflow','auto');
/*		$('.recentlyModal').off('scroll touchmove mousewheel');*/
	}
});

$('.searchlocationBtn').click(function(){
	$('.searchlocationList').empty();
	
	if($('.searchlocationInput').val() != ""){
		$.ajax({
			type: 'post',
			url : '/pmang/member/searchlocation',
			data : {'address' : $('.searchlocationInput').val()},
			dataType : 'json',
			success: function(data){
				if(data.list != ""){
					$('.searchlocationList').show();
					$.each(data.list, function(index, items){
						var address = items.sido + " " + items.sigungu + " " + items.yubmyundong;
						$('<li><button id="selectAddress">'+address+'</button></li>').appendTo($('.searchlocationList'));
						
					});
				}else {
					$('.searchlocationList').hide();
				}
			},
			error: function(err){
				console.log(err);
			}
		
		});
	}
	
});



//검색할 지역을 클릭했을 때
$('.searchlocationList').on('click','#selectAddress', function(){
	$('.location_input').val($(this).text());
	$('.searchlocationModal').hide(); 
	$('body').css('overflow','auto');
});



//최근 지역
$('#recentlylocation').click(function(){
	$('.recentlyModal').css('display', 'flex');
	$('.recentlyModal').on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
	});
});

