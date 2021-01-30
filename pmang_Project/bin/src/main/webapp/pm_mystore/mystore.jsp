<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 탭메뉴 구현할때 참고링크 -->
<!-- https://mynameisljy.tistory.com/2 -->

<link rel="stylesheet" href="/pmang/css/mystore.css">
<form id="mystoreForm">
	<div class="mystoreContainer">
		<div class="mystoreProfile">
			<div class="mystoreProfileImg" id="mystoreProfileImg">
				<!-- <img id="profileImg" alt="내상점프로필사진" src="../image/defaultProfile.png" width="100%"> -->
			</div>
			<!-- mystoreProfileImg -->
			<div id="mystoreName"
				style="font-family: sans-serif;">
				<h3>상점명</h3>
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
				<div class="infoName">상점명</div>
				<div id="storeNameModify">
					<button id="storeNameEditBtn">상점명 수정</button>
				</div><!-- storeNameModify -->
				<div id="storeNameModify1">
					<button id="storeNameEditBtn1">확인</button>
				</div><!-- storeNameModify1 -->
			</div><!-- mystoreInfoName -->
			<div id="mystoreSpec">
				<div id="mystoreSpec2">
					상점 오픈일
					<div id="mystoreOpenDate">00000일전</div>
					<!-- mystoreOpenDate -->
				</div>
				<!-- mystoreSpec2 - mystoreOpenDate -->
				<div id="mystoreSpec2">
					상점 방문수
					<div id="mystoreHit">000명</div>
					<!-- mystoreHit -->
				</div>
				<!-- mystoreSpec2 - mystoreHit -->
				<div id="mystoreSpec2">
					상품판매
					<div id="mystoreSold">000회</div>
					<!-- mystoreSold -->
				</div>
				<!-- mystoreSpec2 - mystoreSold -->
			</div>
			<!-- mystoreSpec -->
			<div id="mystoreIntroduce">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
			</div>
			<!-- mystoreIntroduce -->
			<div id="introEdit">
				
				<button id="storeIntroEditBtn">소개글 수정</button>
			</div><!-- introEdit -->
			<div class="introEdit1">
				<button id="storeIntroBtn">확인</button>
			</div><!-- introEdit1 -->
			
		</div>
		<!--mystoreInfo-->

		<div id="mystoreTab">
			<ul class="tab">
				<li data-tab="tab1" class="tabmenu" id="default"><a href="#">상품<span>0</span></a></li>
				<li data-tab="tab2" class="tabmenu"><a href="#">찜<span>0</span></a></li>				<!-- 로그인 했을때만 보이는 탭메뉴  -->
				<li data-tab="tab3" class="tabmenu"><a href="#">상점후기<span>0</span></a></li>
			</ul>
			<div id="tabContent"></div>
		</div>
		<!-- mystoreTab -->
	</div>
	<!-- mystoreContainer -->



</form>


<!-- 프로필 사진 업로드 form ,보이진않음-->
<form name="signform" method="post" enctype="multipart/form-data">
	<input type="file" id="profile" name="profile" style="display: none;"
		onchange="changeValue(this)"> <input type="hidden"
		name="profileUpload_url">
</form>
<!-- signform 프로필 사진 업로드 -->


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/pmang/js/mystore.js"></script>
<script>
//tab
$(document).ready(function() {
	$('.introEdit1').hide();
	$('#storeNameModify1').hide();
	
	// tab operation
	$('.tabmenu').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('li').css('background-color', 'rgb(250, 250, 250)');
		$(this).css('background-color', 'white');
		$.ajax({
			type : 'GET', //get방식으로 통신
			url : activeTab + ".jsp", //탭의 data-tab속성의 값으로 된 jsp파일로 통신
			dataType : "text", //text형식으로 값 읽기
			error : function() { //통신 실패시
				alert('통신실패!');
			},
			success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
				$('#tabContent').html(data);
			}
		});
	});
	$('#default').click();
});
</script>