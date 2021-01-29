
//처음 들어올때
$(document).ready(function(){
	$('#category2').hide();
	$('#category3').hide();
	
	//$('.imageCount').text('('+$('#imageCountHidden').val()+'/3)');
});


//이미지 등록할 때 사진 리스트 추가 , 사진 갯수 (0/3) 구현해야함

$('.imageChoice').change(function(e){
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

		arr.forEach(function(f){
      
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
          str += '<img src="'+e.target.result+'" title="'+f.name+'" width=195 height=202 />';
          str += '</li></div>';
          $(str).appendTo('.imageChoice_ul');
        } 
        reader.readAsDataURL(f);
      }else{
        str += '<img src="/pmang/image/bench.jpg" title="'+f.name+'" width=195 height=202 />';
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




//카테고리
$('#category1').on('click','button',function(){
	$('.categoryChoice_div').css('border-color','rgb(195, 194, 204)');
	$('#categoryCheck').hide();
	//카테고리 목록
	var fashion = ['여성의류', '남성의류', '패션잡화'];
	var digital = ['모바일', '가전제품', '음반/영상기기', '컴퓨터/주변기기', '카메라', '게임'];
	var book = ['도서', '티켓'];
	var living = ['생활용품', '가구', '주방용품'];
	var sports = ['실내', '실외'];
	var beauty = ['스킨케어', '메이크업', '헤어/바디', '향수/아로마', '네일아트/케어', '뷰티소품'];
	var child = ['영아의류(-2세)', '여아의류(3-6세)', '남아의류(3-6세)', '육아잡화', '동화책/완구/인형/장난감'];
	var others = ['피망나눔','차량/오토바이', '기타'];
	
	
	
	$('.selectL').removeClass();
	$('.category2_li').remove();
//	alert($(this).text());
	let category1 = $(this).text();//Controller로 가져갈 변수.
	$(this).addClass('selectL');
	$('#choice').text($(this).text());
	
	
	$('#seller_categorySpanM').hide();
	$('#category2').show();
	$('#category3').hide();
	$('#seller_categorySpanS').show();
	
	if($('.selectL').text() == '패션'){
		for(var i = 0; i < fashion.length; i++){
			var button = '<button type="button" name="category2">'+fashion[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}		
	}else if($('.selectL').text() == '디지털/가전'){
		for(var i = 0; i < digital.length; i++){
			var button = '<button type="button" name="category2">'+digital[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}		
	}else if($('.selectL').text() == '도서/티켓'){
		for(var i = 0; i < book.length; i++){
			var button = '<button type="button" name="category2">'+book[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}else if($('.selectL').text() == '리빙용품'){
		for(var i = 0; i < living.length; i++){
			var button = '<button type="button" name="category2">'+living[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}else if($('.selectL').text() == '스포츠/레저'){
		for(var i = 0; i < sports.length; i++){
			var button = '<button type="button" name="category2">'+sports[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}else if($('.selectL').text() == '뷰티/미용'){
		for(var i = 0; i < beauty.length; i++){
			var button = '<button type="button" name="category2">'+beauty[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}else if($('.selectL').text() == '유아/출산'){
		for(var i = 0; i < child.length; i++){
			var button = '<button type="button" name="category2">'+child[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}else if($('.selectL').text() == '기타'){
		for(var i = 0; i < others.length; i++){
			var button = '<button type="button" name="category2">'+others[i]+'</button>';
			var categoryList = '<li class="category2_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category2');
		}
	}
});//category2,3 도 동일하게 구현하면된다.


$('#category2').on('click','button',function(){
	
	var women = ['아우터','티셔츠','니트','셔츠/블라우스','맨투맨/후드집업','원피스/세트','바지','스커트'];
	var men = ['아우터','티셔츠','니트','셔츠','맨투맨/후드집업','바지'];
	var goods = ['가방','신발','액세서리','시계','모자'];
	
	var mobile = ['스마트폰', '태블릿', '액세서리/주변기기'];
	var home = ['소형가전(밥솥/다리미)', '대형가전(냉장고/세탁기/TV)', '미용가전', '사무용품(복사기/팩스)'];
	var music = ['음향기기','비디오/프로젝터','CD/DVD/음반'];
	var pc = ['데스크탑', '키보드/마우스', '모니터', 'CPU/메인보드/메모리/HDD/SDD', '노트북/넷북', '기타 액세서리(잉크,쿨러,케이블,USB)'];
	var camera = ['DSLR/미러리스','필름카메라','디지털 카메라','기타 액세서리(메모리/렌즈/필름)'];
	var game = ['pc게임', '콘솔 게임(닌텐도/플스)', '게임 타이틀'];
	
	var read = ['학습/사전/참고서', '만화/아동', '인문/교양/소설', '경영/경제/사회', '과학/컴퓨터/인터넷','예술/디자인','기타 도서(여행/취미/건강)'];
	var ticket = ['기프티콘/쿠폰/상품권','예매권/항공권'];
	
	var daily = ['문구/학습', '침구', '욕실'];
	var furniture = ['거실가구(쇼파/테이블)', '생활가구(침대/화장대)', '사무용가구(책상/의자)', '인테리어 소품'];
	var kitchen = ['식기세트','냄비/프라이팬','조리도구','수저/커트러리','컵/잔/텀블러', '주방 잡화','밀폐용기','커피용품'];
	
	var indoor = ['헬스','요가','골프','수영'];
	var out = ['축구', '야구', '농구','자전거/킥보드','등산','낚시/캠핑'];
	
	var skin = ['클렌칭/스크럽','스킨/토너/미스트','로션/에멀젼','에센스/크림','팩/마스크','썬케어'];
	var makeup = ['색조메이크업','베이스메이크업'];
	var hair = ['샴푸/린스/트리트먼트','헤어스타일링','바티클렌저/로션','헤어/핸드/풋케어'];
	var perfume = ['여성향수','남성향수','공용향수'];
	var nailArt = ['네일아트/스티커','매니큐어/페디큐어','네일케어도구'];
	var beautyTool = ['브러시/퍼프','파우치/정리함','거울'];
	
	var baby = ['상의', '하의', '기타'];
	var girl = ['원피스/셋트', '아우터(니트,점퍼,코트)','상하의','티셔츠','바지','치마'];
	var boy = ['아우터','상하의','티셔츠','바지','남방'];
	var babygoods = ['신발','모자','가방','양말'];
	var fairy = ['인형','교육/완구','장난감','물놀이도구','놀이터도구'];
	
	$('.category3_li').remove();
	$('.selectM').removeClass();
	
	let category2 = $(this).text();//Controller로 가져갈 변수.
	$(this).addClass('selectM');
	$('#choice').text($('.selectL').text() + " > " + $(this).text());
	
	if($('.selectM').text() == '여성의류' || $(this).text() == '여성의류'){
		for(var i = 0; i < women.length; i++){
			var button = '<button type="button" name="category3">'+women[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}		
	}else if($('.selectM').text() == '남성의류' || $(this).text() == '남성의류'){
		for(var i = 0; i < men.length; i++){
			var button = '<button type="button" name="category3">'+men[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '패션잡화' || $(this).text() == '패션잡화'){
		for(var i = 0; i < goods.length; i++){
			var button = '<button type="button" name="category3">'+ goods[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '모바일' || $(this).text() == '모바일'){
		for(var i = 0; i < mobile.length; i++){
			var button = '<button type="button" name="category3">'+mobile[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '가전제품' || $(this).text() == '가전제품'){
		for(var i = 0; i < home.length; i++){
			var button = '<button type="button" name="category3">'+home[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '음반/영상기기' || $(this).text() == '음반/영상기기'){
		for(var i = 0; i < music.length; i++){
			var button = '<button type="button" name="category3">'+music[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '컴퓨터/주변기기' || $(this).text() == '컴퓨터/주변기기'){
		for(var i = 0; i < pc.length; i++){
			var button = '<button type="button" name="category3">'+pc[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '카메라' || $(this).text() == '카메라'){
		for(var i = 0; i < camera.length; i++){
			var button = '<button type="button" name="category3">'+camera[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '게임' || $(this).text() == '게임'){
		for(var i = 0; i < game.length; i++){
			var button = '<button type="button" name="category3">'+game[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '도서' || $(this).text() == '도서'){
		for(var i = 0; i < read.length; i++){
			var button = '<button type="button" name="category3">'+read[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '티켓' || $(this).text() == '티켓'){
		for(var i = 0; i < ticket.length; i++){
			var button = '<button type="button" name="category3">'+ticket[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '생활용품' || $(this).text() == '생활용품'){
		for(var i = 0; i < daily.length; i++){
			var button = '<button type="button" name="category3">'+daily[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '가구' || $(this).text() == '가구'){
		for(var i = 0; i < furniture.length; i++){
			var button = '<button type="button" name="category3">'+furniture[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '주방용품' || $(this).text() == '주방용품'){
		for(var i = 0; i < kitchen.length; i++){
			var button = '<button type="button" name="category3">'+kitchen[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '실내' || $(this).text() == '실내'){
		for(var i = 0; i < indoor.length; i++){
			var button = '<button type="button" name="category3">'+indoor[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '실외' || $(this).text() == '실외'){
		for(var i = 0; i < out.length; i++){
			var button = '<button type="button" name="category3">'+out[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '스킨케어' || $(this).text() == '스킨케어'){
		for(var i = 0; i < skin.length; i++){
			var button = '<button type="button" name="category3">'+skin[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '메이크업' || $(this).text() == '메이크업'){
		for(var i = 0; i < makeup.length; i++){
			var button = '<button type="button" name="category3">'+makeup[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '헤어/바디' || $(this).text() == '헤어/바디'){
		for(var i = 0; i < hair.length; i++){
			var button = '<button type="button" name="category3">'+hair[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '향수/아로마' || $(this).text() == '향수/아로마'){
		for(var i = 0; i < perfume.length; i++){
			var button = '<button type="button" name="category3">'+perfume[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '네일아트/케어' || $(this).text() == '네일아트/케어'){
		for(var i = 0; i < nailArt.length; i++){
			var button = '<button type="button" name="category3">'+nailArt[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '뷰티소품' || $(this).text() == '뷰티소품'){
		for(var i = 0; i < beautyTool.length; i++){
			var button = '<button type="button" name="category3">'+beautyTool[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '영아의류(-2세)' || $(this).text() == '영아의류(-2세)'){
		for(var i = 0; i < baby.length; i++){
			var button = '<button type="button" name="category3">'+baby[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '여아의류(3-6세)' || $(this).text() == '여아의류(3-6세)'){
		for(var i = 0; i < girl.length; i++){
			var button = '<button type="button" name="category3">'+girl[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '남아의류(3-6세)' || $(this).text() == '남아의류(3-6세)'){
		for(var i = 0; i < boy.length; i++){
			var button = '<button type="button" name="category3">'+boy[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '육아잡화' || $(this).text() == '육아잡화'){
		for(var i = 0; i < babygoods.length; i++){
			var button = '<button type="button" name="category3">'+babygoods[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	}else if($('.selectM').text() == '동화책/완구/인형/장난감' || $(this).text() == '동화책/완구/인형/장난감'){
		for(var i = 0; i < fairy.length; i++){
			var button = '<button type="button" name="category3">'+fairy[i]+'</button>';
			var categoryList = '<li class="category3_li">'+button+'</li>';
			
			$(categoryList).appendTo('.category3');
		}
	} 
	
	
	$('#seller_categorySpanS').hide();
	$('#category3').show();
});


$('#category3').on('click','button',function(){
	$('.selectS').removeClass();

	let category3 = $(this).text();//Controller로 가져갈 변수.
	$(this).addClass('selectS');
	$('#choice').text($('.selectL').text() + " > " + $('.selectM').text() + " > " + $(this).text());
	
	$('#seller_categorySpanM').hide();
	$('#category3').show();
});



//제목 글자수 count, 유효성 검사, input이벤트
//최소입력수, 최대입력수
$('input[name=itemSubject]').on('keyup', function() {
	var subjectText = $(this).val();
	$('#textLength').html('('+subjectText.length + '/40)');   
	
	if(subjectText.length >= 40){
		alert("최대 40자까지 입력 가능합니다.");
		$('#textLength').css('color', 'red');
	}else
		$('#textLength').css('color', 'black');
	
	if(subjectText.length > 1 ){
		$('.itemSubjectDiv').hide();
		$('.itemSubjectText').css('border-color','rgb(195, 194, 204)');
		$('input[name=itemSubject]').css('border-color','rgb(195, 194, 204)');
	}else if(subjectText.length > 0 || subjectText.length < 2){
		$('.itemSubjectDiv').show();
		$('.itemSubjectText').css('border-color','green');
		$('input[name=itemSubject]').css('border-color','green');
		$('#textRemove').hide();
	}
	
	if(subjectText.length != 0){
		$('#textRemove').show();
	}
      
});

//최소 입력수
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
		//alert("숫자만 입력해주세요.");
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
		$('#priceDiv').text('※100원 이상 입력해주세요.');
		$('.price_input').css('border','1px solid green');
	}else{
		$('#priceDiv').text('');
		$('.price_input').css('border','1px solid rgb(195, 194, 204)');
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
				id: 'hashtag' + (hashtag_count+1),
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
	$('.searchlocationModal').on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
	});
});

$('.searchlocationCloseBtn').click(function(){
	$('.searchlocationModal').hide();
	$('.recentlyModal').hide();
	$('.searchlocationModal').off('scroll touchmove mousewheel');
	$('.recentlyModal').off('scroll touchmove mousewheel');
});

$(document).click(function(e){
	if($('.searchlocationModal').is(e.target)){
		$('.searchlocationModal').hide(); 
		$('.searchlocationModal').off('scroll touchmove mousewheel');
	}else if($('.recentlyModal').is(e.target)){
		$('.recentlyModal').hide(); 
		$('.recentlyModal').off('scroll touchmove mousewheel');
	}
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


//등록하기 버튼 클릭 -> db전송
$('.itemWriteBtn').click(function(){
	//전송할 formData 생성!
	var formData = new FormData($('#sellerWriteForm')[0]); 
	
	for(var i = 1; i < 4; i++){
		if($("#hashtag"+i).text() != ""){
			formData.append("hashtag"+i, $("#hashtag"+i).text());
		}
	}
	
	var category1 = $(".selectL").text();
	var category2 = $(".selectM").text();
	var category3 = $(".selectS").text();
	
	formData.append("category1",category1);
	formData.append("category2",category2);
	formData.append("category3",category3);

	//데이터 잘 들어왔는지 확인
	/*for (var pair of formData.entries()) { console.log(pair[0]+ ', ' + pair[1]); }*/

	
	
	
	//유효성 검사
	$('#imageCheck').hide();
	$('.itemSubjectDiv').hide();
	$('#categoryCheck').hide();
	$('#priceDiv').text("");
	
	$('.imageChoice_ul').css('border-color','rgb(195, 194, 204)');
	$('.itemSubjectText').css('border-color','rgb(195, 194, 204)');
	$('input[name=itemSubject]').css('border-color','rgb(195, 194, 204)');
	$('.categoryChoice_div').css('border-color','rgb(195, 194, 204)');
	$('.price_input').css('border','1px solid rgb(195, 194, 204)');
	
	if($('#imageCountHidden').val() == 0){ //이미지 등록 확인
		$('#imageCheck').show();
		$('.imageChoice_li').css('border-color','green');
		
		var offset = $('.main_sectionFrame').offset();
		$('html').animate({scrollTop : offset.top}, 400);
		
	}else if($('input[name=itemSubject]').val().length < 2){ //제목 수 확인
		$('input[name=itemSubject]').css('border-color','green');
		$('input[name=itemSubject]').css('border-color','green');
		$('.itemSubjectDiv').show();
		
		var offset = $('.imageChoice_div').offset();
		$('html').animate({scrollTop : offset.top}, 400);
		
	}else if($('#choice').text() == ""){ //카테고리 확인
		$('.categoryChoice_div').css('border-color','green');
		$('#categoryCheck').show();
		
		var offset = $('.imagecontent').offset();
		$('html').animate({scrollTop : offset.top}, 400);
		
	}else if($('.price_input').val() == "" || $('.price_input').val() < 100){ //가격확인
		$('#priceDiv').text('※100원 이상 입력해주세요.');
		$('.price_input').css('border','1px solid green');
		
		var offset = $('.locationText_div').offset();
		$('html').animate({scrollTop : offset.top}, 400);
		
	}else if($('.qty_input').val() == ""){ //수량 확인
		$('.qty_input').val('1');
	}else {
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false, //데이터를 컨텐트 타입에 맞게 변환 여부
			contentType: false,//요청 컨텐트 타입
			url: '/pmang/member/sellerWrite',
			data: formData,
			success: function(data){
				alert('상품 등록 완료');
				location.href='/spring/index'; //추후에 상품관리 페이지로 바뀌게 해야함!
			},
			error: function(err){
				console.log(err);
			}
		});
		
	}
});


























