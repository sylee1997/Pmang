<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 탭메뉴 구현할때 참고링크 -->
<!-- https://mynameisljy.tistory.com/2 -->

<link rel="stylesheet" href="/pmang/css/mystore.css">
<form id="mystoreForm">
	<div class="mystoreContainer">
		<div class="mystoreProfile">
			<div class="mystoreProfileImg" id="mystoreProfileImg">
			<input type="file" class="profileImgModify" name="img" accept="image/jpg, image/jpeg, image/png">
				<!-- <img id="profileImg" alt="내상점프로필사진" src="../image/defaultProfile.png" width="100%"> -->
			</div>
			<!-- mystoreProfileImg -->
			<div id="mystoreName"
				style="font-family: sans-serif;">
				<h3></h3>
			</div>
			<!-- mystoreName -->
			<div id="mystoreBtns" >
				<button onclick="window.location.href='#'">내 상점 관리</button>
			</div>
			<!-- mystoreBtns -->
		</div>
		<!-- mystoreProfile -->
		<div class="mystoreInfo" >
			<div id="mystoreInfoName" >
				<div class="infoName"><span></span></div>
				<div id="storeNameModify">
					<!-- <button id="storeNameEditBtn">상점명 수정</button> -->
				</div><!-- storeNameModify -->
				<!-- <div id="storeNameModify1">
					<button id="storeNameEditBtn1">확인</button>
				</div> --><!-- storeNameModify1 -->
			</div><!-- mystoreInfoName -->
			<div id="mystoreSpec">
				<div id="mystoreSpec2">
					<img src="/pmang/image/mystoreOpen.jpg" alt="상점오픈일" width="14" height="13">상점 오픈일
					<div id="mystoreOpenDate"></div>
					<!-- mystoreOpenDate -->
				</div>
				<!-- mystoreSpec2 - mystoreOpenDate -->
				<div id="mystoreSpec2">
					<img src="../image/mystoreHit.jpg" alt="상점방문수" width="14" height="13">상점 방문수
					<div id="mystoreHit"></div>
					<!-- mystoreHit -->
				</div>
				<!-- mystoreSpec2 - mystoreHit -->
				<div id="mystoreSpec2">
					<img src="../image/mystoreSold.jpg" alt="상점판매수" width="14" height="13">상품판매수
					<div id="mystoreSold"><span></span></div>
					<!-- mystoreSold -->
				</div>
				<!-- mystoreSpec2 - mystoreSold -->
			</div>
			<!-- mystoreSpec -->
			<div id="mystoreIntroduce"><textarea disabled readonly style="background:transparent;font-family:sans-serif;"></textarea>
			</div>
			<!-- mystoreIntroduce -->
			<div id="introEdit">
				
				<button id="storeIntroEditBtn">내상점 정보 수정</button>
			</div><!-- introEdit -->
			<div class="introEdit1">
				<button id="storeIntroBtn">확인</button>
			</div><!-- introEdit1 -->
			
		</div>
		<!--mystoreInfo-->

		<div id="mystoreTab">
			<ul class="tab">
				<li data-tab="mystoreTab1" class="tabmenu" id="default"><a href="#">상품<span></span></a></li>
				<li data-tab="mystoreTab2" class="tabmenu" id="wish"><a href="#">찜<span></span></a></li>				<!-- 로그인 했을때만 보이는 탭메뉴  -->
				<li data-tab="mystoreTab3" class="tabmenu" id="re"><a href="#">상점후기<span></span></a></li>
			</ul>
			<div id="tabContent">
				
			</div>
		</div>
		<!-- mystoreTab -->
	</div>
	<!-- mystoreContainer -->
</form>





<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/pmang/js/mystore.js"></script>
<!-- <script type="text/javascript" src="/pmang/js/mystoreTab2.js"></script> -->
<!-- <script type="text/javascript" src="/pmang/js/mystoreTab3.js"></script> -->
<script>
//tab
$(document).ready(function() {
	
	$('.introEdit1').hide();
	$('#storeNameModify1').hide();
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystore',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			$('.infoName span').text(data.sellerDTO.marketname);
			$('#mystoreName h3').text(data.sellerDTO.marketname);
			$('#mystoreHit').text(data.sellerDTO.markethit+" 명");
			$('#mystoreIntroduce textarea').text(data.sellerDTO.pf_content);
			
			//상점 오픈일 날짜 계산
			var openDate=new Date(data.sellerDTO.marketdate);
			var today=new Date();
			var dateDiff=Math.ceil((today.getTime()-openDate.getTime())/(1000*3500*24));

			$('#mystoreOpenDate').text(dateDiff+'일전');
		},
		error:function(err){
			console.log(err);
		}
	});
	
	
	// tab operation
	$('.tabmenu').on('click',function() {
		var activeTab = $(this).attr('data-tab');
		$('li').css('background-color', 'rgb(250, 250, 250)').css('border-top','2px solid transparent');
		$(this).css('background-color', 'white').css('border-top','2px solid green');
		
		$.ajax({
			type : 'GET', //get방식으로 통신
			url : "/pmang/board/"+activeTab+'?pg=1' , //탭의 data-tab속성의 값으로 된 jsp파일로 통신
			dataType : "text", //text형식으로 값 읽기
			error : function(err) { //통신 실패시
				alert('통신실패!');
				alert(activeTab);
			},
			success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
				$('#tabContent').html(data);
			}
		});
	});
	$('#default').click();
	
	
	
	
});
</script>