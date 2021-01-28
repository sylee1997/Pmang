//이미지 등록할 때 사진 리스트 추가 , 사진 갯수 (0/3) 구현해야함


//카테고리
$('#category1').on('click','button',function(){
//	alert($(this).text());
	let category1 = $(this).text();//Controller로 가져갈 변수.
	$('#choice').text($(this).text());
});//category2,3 도 동일하게 구현하면된다.


//제목 글자수 count

$('input[name=subject]').on('keyup', function() {
	var subjectText = $(this).val();
	$('#textLength').html('('+subjectText.length + '/40)');   
	
	if(subjectText.length >= 40){
		alert("최대 40자까지 입력 가능합니다.");
		$('#textLength').css('color', 'red');
	}else
		$('#textLength').css('color', 'black');
      
});

$('textarea[name=content]').on('keyup', function() {
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
	qtyVal = $('input[name=qty]').val();
	let qtyRule = /^[0-9]*$/; // * 이 기존에 {1,3}
	let reg1 = /[^0-9]/g;
	
	if(qtyVal.length > 0 && qtyVal.length <= 3 )
	if(!qtyRule.test(qtyVal)){
		$('input[name=qty]').val(qtyVal.replace(reg1,''));
	}
});

//가격 숫자만 입력
$('#priceparent').on('keyup','input',function(){
	let priceVal = $('input[name=price]').val();
	let priceRule = /^[0-9]*$/;// * 이 기존에 {0,9}
	let reg2 =/[^0-9]/g;   //

	if(priceVal.length > 0 && priceVal.length <= 9 )
	if(!priceRule.test(priceVal)){
		$('input[name=price]').val(priceVal.replace(reg2,''));
		//alert("숫자만 입력해주세요.");
	}
	
	if(priceVal < 100){
		$('#priceDiv').text('100원 이상 입력해주세요.');
	}else{
		$('#priceDiv').text('');
	}
	
	/*$('input[name=price]').val(addComma($('input[name=price]').val()));*/
});

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
































