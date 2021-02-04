/*카테고리 펼쳐지는 부분*/
$('.selectItem1').hover(function(){
	$('.down1').css('display', 'block')
},
function(){
	$('.down1').css('display', 'none')
});

$('.selectItem2').hover(function(){
	$('.down2').css('display', 'block')
},
function(){
	$('.down2').css('display', 'none')
});

$('.selectItem3').hover(function(){
	$('.down3').css('display', 'block')
},
function(){
	$('.down3').css('display', 'none')
});

/* down color 입히기 */
for(var i=1; i<4; i++){
	for(var j=0; j<$('.down'+i).children().length; j++){
		if($('.down'+i).children().eq(j).text().trim() == $('.top'+i).text().trim()){
			//$('.down'+i).children().eq(j).css('color', 'red');
			$('.down'+i).children().eq(j).addClass('select'+i);
		}
	}	
};


/* var firstCategory = ['패션', '디지털/가전', '도서/티켓', '리빙용품', '스포츠/레저', '뷰티/미용', '유아/출산', '기타', '커뮤니티' ] */
/*  secondCategory 종류  */
var fashion = ['여성의류', '남성의류', '패션잡화', ''];
	var women = ['아우터','티셔츠','니트','셔츠/블라우스','맨투맨/후드집업','원피스/세트','바지','스커트',''];
	var men = ['아우터','티셔츠','니트','셔츠','맨투맨/후드집업','바지','','',''];
	var goods = ['가방','신발','액세서리','시계','모자','','','',''];

var digital = ['모바일', '가전제품', '음반/영상기기', '컴퓨터/주변기기', '카메라', '게임', '', '', ''];
	var mobile = ['스마트폰', '태블릿', '액세서리/주변기기',''];
	var home = ['소형가전(밥솥/다리미)', '대형가전(냉장고/세탁기/TV)', '미용가전', '사무용품(복사기/팩스)'];
	var music = ['음향기기','비디오/프로젝터','CD/DVD/음반',''];
	var pc = ['데스크탑', '키보드/마우스', '모니터', 'CPU/메인보드/메모리/HDD/SDD', '노트북/넷북', '기타 액세서리(잉크,쿨러,케이블,USB)','','',''];
	var camera = ['DSLR/미러리스','필름카메라','디지털 카메라','기타 액세서리(메모리/렌즈/필름)'];
	var game = ['pc게임', '콘솔 게임(닌텐도/플스)', '게임 타이틀',''];
var book = ['도서', '티켓', '', ''];
	var read = ['학습/사전/참고서', '만화/아동', '인문/교양/소설', '경영/경제/사회', '과학/컴퓨터/인터넷','예술/디자인','기타 도서(여행/취미/건강)','',''];
	var ticket = ['기프티콘/쿠폰/상품권','예매권/항공권','',''];
var living = ['생활용품', '가구', '주방용품', ''];
	var daily = ['문구/학습', '침구', '욕실',''];
	var furniture = ['거실가구(쇼파/테이블)', '생활가구(침대/화장대)', '사무용가구(책상/의자)', '인테리어 소품'];
	var kitchen = ['식기세트','냄비/프라이팬','조리도구','수저/커트러리','컵/잔/텀블러', '주방 잡화','밀폐용기','커피용품',''];
var sports = ['실내', '실외', '', ''];
	var indoor = ['헬스','요가','골프','수영'];
	var out = ['축구', '야구', '농구','자전거/킥보드','등산','낚시/캠핑','','',''];
var beauty = ['스킨케어', '메이크업', '헤어/바디', '향수/아로마', '네일아트/케어', '뷰티소품','','',''];
	var skin = ['클렌칭/스크럽','스킨/토너/미스트','로션/에멀젼','에센스/크림','팩/마스크','썬케어','','',''];
	var makeup = ['색조메이크업','베이스메이크업','',''];
	var hair = ['샴푸/린스/트리트먼트','헤어스타일링','바티클렌저/로션','헤어/핸드/풋케어'];
	var perfume = ['여성향수','남성향수','공용향수',''];
	var nailArt = ['네일아트/스티커','매니큐어/페디큐어','네일케어도구'];
	var beautyTool = ['브러시/퍼프','파우치/정리함','거울',''];
var child = ['영아의류(-2세)', '여아의류(3-6세)', '남아의류(3-6세)', '육아잡화', '동화책/완구/인형/장난감','','','',''];
	var baby = ['상의', '하의', '기타',''];
	var girl = ['원피스/셋트', '아우터(니트,점퍼,코트)','상하의','티셔츠','바지','치마','','',''];
	var boy = ['아우터','상하의','티셔츠','바지','남방','','','',''];
	var babygoods = ['신발','모자','가방','양말'];
	var fairy = ['인형','교육/완구','장난감','물놀이도구','놀이터도구','','','',''];
var others = ['피망나눔','차량,오토바이', '기타',''];


$(document).ready(function(){
	//위치 검색
	if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	var lat = position.coords.latitude; //위도
		    	var lon = position.coords.longitude; //경도
		      	$('#lat').val(lat);
		    	$('#lon').val(lon);
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
	//처음 카테고리 창 구현
	$('.secondCategory').hide();
	$('.thirdCategory').hide();
	//alert($('.select1').text());
	if($('.select1').text() == '패션'){
		for(var i = 0; i < fashion.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select1').text() == '디지털/가전'){
		for(var i = 0; i < disital.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select1').text() == '도서/티켓'){
		for(var i = 0; i < book.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + book[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '리빙용품'){
		for(var i = 0; i < living.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + living[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '스포츠/레저'){
		for(var i = 0; i < sports.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + sports[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '뷰티/미용'){
		for(var i = 0; i < beauty.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + beauty[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '유아/출산'){
		for(var i = 0; i < child.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + child[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '기타'){
		for(var i = 0; i < others.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + others[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}
});


$('.selectItem1').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	//alert($(this).text())
	$('.select1').removeClass('select1');
	$(this).addClass('select1');
	$('.top1').html($(this).text() + img);
	
	$('.detailItem').show();
	//$('.top2').text('');
	$('.detailItemList1').remove();
	$('.detailItemList2').remove();
	$('.detailItemList3').remove();
	$('.secondCategory').hide();
	$('.thirdCategory').hide();
	$('.down1').hide();
	
	/* if($('.top2').text().trim().length){
		//alert($('.top2').text())
	}else{
		alert('secondCategory없음')
		$('.detailItem').show();
	} */
	 

	
	 if($('.select1').text() == '패션'|| $(this).text() == '패션'){
			for(var i = 0; i < fashion.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
				$('.detailItem').append(div);
			}		
		}else if($('.select1').text() == '디지털/가전' || $(this).text() == '디지털/가전'){
			for(var i = 0; i < digital.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + digital[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '도서/티켓' || $(this).text() == '도서/티켓'){
			for(var i = 0; i < book.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + book[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '리빙용품' || $(this).text() == '리빙용품'){
			for(var i = 0; i < living.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + living[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '스포츠/레저' || $(this).text() == '스포츠/레저'){
			for(var i = 0; i < sports.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + sports[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '뷰티/미용' || $(this).text() == '뷰티/미용'){
			for(var i = 0; i < beauty.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + beauty[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '유아/출산' || $(this).text() == '유아/출산'){
			for(var i = 0; i < child.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + child[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '기타' || $(this).text() == '기타'){
			for(var i = 0; i < others.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + others[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}
		
		
});


 $('.detailItem').on('click', '.detailItemList1', function(){
  if($(this).children('a').text() != ''){
	var down2 = new Array();
	for(var i = 0; i < $('.detailItem').children('div').length; i++){
		//alert($('#detailItemList'+i).text())
		down2[i] = $('#detailItemList'+i).text();
	}
	
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.secondCategory').show();
	$('.detailItemList1').remove();
	$('.down2').empty();
	$('.top2').html($(this).text() + img);
	
	for(var i = 0; i < down2.length; i++){
		if(down2[i] != ""){
			$('.down2').append('<a href="#">'+down2[i]+'</a>');	
		}
	} 
	
	
	for(var i=0; i<$('.down2').children().length; i++){
		if($('.down2').children().eq(i).text().trim() == $(this).children('a').text()){
			$('.down2').children().eq(i).addClass('select2');
		}
	}
	
	if($(this).text() == '여성의류'){
		for(var i = 0; i < women.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + women[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($(this).text() == '남성의류'){
		for(var i = 0; i < men.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + men[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '패션잡화'){
		for(var i = 0; i < goods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + goods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '모바일'){
		for(var i = 0; i < mobile.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + mobile[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '가전제품'){
		for(var i = 0; i < home.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + home[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '음반/영상기기'){
		for(var i = 0; i < music.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + music[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '컴퓨터/주변기기'){
		for(var i = 0; i < pc.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + pc[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '카메라'){
		for(var i = 0; i < camera.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + camera[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '게임'){
		for(var i = 0; i < game.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + game[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '도서'){
		for(var i = 0; i < read.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + read[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '티켓'){
		for(var i = 0; i < ticket.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + ticket[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '생활용품'){
		for(var i = 0; i < daily.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + daily[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '가구'){
		for(var i = 0; i < furniture.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + furniture[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '주방용품'){
		for(var i = 0; i < kitchen.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + kitchen[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '실내'){
		for(var i = 0; i < indoor.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + indoor[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '실외'){
		for(var i = 0; i < out.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + out[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '스킨케어'){
		for(var i = 0; i < skin.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + skin[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '메이크업'){
		for(var i = 0; i < makeup.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + makeup[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '헤어/바디'){
		for(var i = 0; i < hair.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + hair[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '향수/아로마'){
		for(var i = 0; i < perfume.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + perfume[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '네일아트/케어'){
		for(var i = 0; i < nailArt.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + nailArt[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '뷰티소품'){
		for(var i = 0; i < beautyTool.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + beautyTool[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '영아의류(-2세)'){
		for(var i = 0; i < baby.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + baby[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '여아의류(3-6세)'){
		for(var i = 0; i < girl.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + girl[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '남아의류(3-6세)'){
		for(var i = 0; i < boy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + boy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '육아잡화'){
		for(var i = 0; i < babygoods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + babygoods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '동화책/완구/인형/장난감'){
		for(var i = 0; i < fairy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + fairy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}
  }
});


$('.selectItem2').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select2').removeClass('select2');
	$(this).addClass('select2');
	$('.top2').html($(this).text() + img);
	
	
	//$('.top2').text('');
	$('.detailItemList1').remove();
	$('.detailItemList2').remove();
	$('.detailItemList3').remove();
	$('.thirdCategory').hide();
	$('.detailItem').show();
	$('.down2').hide();
	
	if($('.select2').text() == '여성의류' || $(this).text() == '여성의류'){
		for(var i = 0; i < women.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + women[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select2').text() == '남성의류' || $(this).text() == '남성의류'){
		for(var i = 0; i < men.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + men[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '패션잡화' || $(this).text() == '패션잡화'){
		for(var i = 0; i < goods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + goods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '모바일' || $(this).text() == '모바일'){
		for(var i = 0; i < mobile.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + mobile[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '가전제품' || $(this).text() == '가전제품'){
		for(var i = 0; i < home.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + home[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '음반/영상기기' || $(this).text() == '음반/영상기기'){
		for(var i = 0; i < music.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + music[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '컴퓨터/주변기기' || $(this).text() == '컴퓨터/주변기기'){
		for(var i = 0; i < pc.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + pc[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '카메라' || $(this).text() == '카메라'){
		for(var i = 0; i < camera.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + camera[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '게임' || $(this).text() == '게임'){
		for(var i = 0; i < game.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + game[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '도서' || $(this).text() == '도서'){
		for(var i = 0; i < read.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + read[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '티켓' || $(this).text() == '티켓'){
		for(var i = 0; i < ticket.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + ticket[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '생활용품' || $(this).text() == '생활용품'){
		for(var i = 0; i < daily.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + daily[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '가구' || $(this).text() == '가구'){
		for(var i = 0; i < furniture.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + furniture[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '주방용품' || $(this).text() == '주방용품'){
		for(var i = 0; i < kitchen.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + kitchen[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '실내' || $(this).text() == '실내'){
		for(var i = 0; i < indoor.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + indoor[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '실외' || $(this).text() == '실외'){
		for(var i = 0; i < out.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + out[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '스킨케어' || $(this).text() == '스킨케어'){
		for(var i = 0; i < skin.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + skin[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '메이크업' || $(this).text() == '메이크업'){
		for(var i = 0; i < makeup.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + makeup[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '헤어/바디' || $(this).text() == '헤어/바디'){
		for(var i = 0; i < hair.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + hair[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '향수/아로마' || $(this).text() == '향수/아로마'){
		for(var i = 0; i < perfume.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + perfume[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '네일아트/케어' || $(this).text() == '네일아트/케어'){
		for(var i = 0; i < nailArt.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + nailArt[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '뷰티소품' || $(this).text() == '뷰티소품'){
		for(var i = 0; i < beautyTool.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + beautyTool[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '영아의류(-2세)' || $(this).text() == '영아의류(-2세)'){
		for(var i = 0; i < baby.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + baby[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '여아의류(3-6세)' || $(this).text() == '여아의류(3-6세)'){
		for(var i = 0; i < girl.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + girl[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '남아의류(3-6세)' || $(this).text() == '남아의류(3-6세)'){
		for(var i = 0; i < boy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + boy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '육아잡화' || $(this).text() == '육아잡화'){
		for(var i = 0; i < babygoods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + babygoods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '동화책/완구/인형/장난감' || $(this).text() == '동화책/완구/인형/장난감'){
		for(var i = 0; i < fairy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + fairy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	} 
});

$('.detailItem').on('click', '.detailItemList2', function(){
	if($(this).children('a').text() != ''){
		var down3 = new Array();
		for(var i = 0; i < $('.detailItem').children('div').length; i++){
			//alert($('#detailItemList'+i).text())
			down3[i] = $('#detailItemList'+i).text();
		}
		
		var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
		$('.thirdCategory').show();
		$('.detailItemList2').remove();
		$('.down3').empty();
		$('.top3').html($(this).text() + img);
		$('.detailItem').hide();
		
		for(var i = 0; i < down3.length; i++){
			if(down3[i] != ""){
				$('.down3').append('<a href="#">'+down3[i]+'</a>');	
			}
		} 
		
		
		for(var i=0; i<$('.down3').children().length; i++){
			if($('.down3').children().eq(i).text().trim() == $(this).children('a').text()){
				$('.down3').children().eq(i).addClass('select3');
			}
		}
	}
});

$('.selectItem3').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select3').removeClass('select3');
	$(this).addClass('select3');
	$('.top3').html($(this).text() + img);
	$('.down3').hide();
		
});



/* 위치 모달 */
$('.locationSearch').click(function(){
	 $('.locationModal').css('display','block'); 
});

$('#x').click(function(){
	$('.locationModal').css('display','none');
});

$(document).click(function(e){
	if($('.locationModal').is(e.target)){
		$('.locationModal').css('display','none'); 
	}
}); 


/* 위치 검색 */

$('#gpsBtn').click(function(){
	 var position = new daum.maps.LatLng($('#lat').val(), $('#lon').val()); 
	 
	 searchDetailAddrFromCoords(position, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	          
	            var detailAddr = result[0].address.address_name;
	           
	            $('.detailAddr').html(detailAddr);
	            $('.locationModal').css('display','none');
	        }   
	    });
	 
});


$('#mainLocBtn').click(function(){
	  window.open("mainLoc.jsp", "주요위치", "width=1024, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
});

$('#mapBtn').click(function(){
	  window.open("map.jsp?lon=" + $('#lon').val() + "&lat=" + $('#lat').val(), "지도띄우기", "width=1000, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes,left=500, top=100");
});


function searchDetailAddrFromCoords(coords, callback) {
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}






