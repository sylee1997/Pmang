<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 탭메뉴 구현할때 참고링크 -->
<!-- https://mynameisljy.tistory.com/2 -->

<link rel="stylesheet" href="/pmang/css/mystore.css">
<form id="mystoreForm">
	<div class="mystoreContainer" style="border: 1px solid red">
		<div class="mystoreProfile" style="border: 1px solid light-grey;">
			<div class="mystoreProfileImg" id="mystoreProfileImg"
				style="border: 1px solid red;">
				<!-- <img id="profileImg" alt="내상점프로필사진" src="../image/defaultProfile.png" width="100%"> -->
			</div>
			<!-- mystoreProfileImg -->
			<div id="mystoreName"
				style="font-family: sans-serif; border: 1px solid black;">
				<h3>상점명</h3>
			</div>
			<!-- mystoreName -->
			<div id="mystoreBtns" style="border: 1px solid blue;">
				<!-- 여기에 c:if 태그 달아서 로그인 여부로 인해 보여주는 버튼들이 다름.
				로그인을 안했을경우 '번개톡','팔로잉'버튼이있고
				로그인을 했을경우 '내 상점관리'버튼이 있음.
				
				현재 구현은 로그인을 안했을 경우로 만듬. -->
				<button onclick="window.location.href='#'">팔로잉</button>
				<!--팔로잉을 구현안하게되면 빼버리기-->
				<button onclick="window.location.href='#'">피망톡</button>

			</div>
			<!-- mystoreBtns -->
		</div>
		<!-- mystoreProfile -->
		<div class="mystoreInfo" style="border: 1px solid magenta;">
			<div id="mystoreInfoName" style="border: 1px solid pink;">
				<div class="infoName">상점명</div>
				<button id="storeNameEditBtn">상점명 수정</button>
			</div>
			<!-- mystoreName -->
			<div id="mystoreSpec" style="border: 1px solid green">
				<div id="mystoreSpec2" style="border: 1px solid black">
					상점 오픈일
					<div id="mystoreOpenDate">00000일전</div>
					<!-- mystoreOpenDate -->
				</div>
				<!-- mystoreSpec2 - mystoreOpenDate -->
				<div id="mystoreSpec2" style="border: 1px solid black">
					상점 방문수
					<div id="mystoreHit">000명</div>
					<!-- mystoreHit -->
				</div>
				<!-- mystoreSpec2 - mystoreHit -->
				<div id="mystoreSpec2" style="border: 1px solid black">
					상품판매
					<div id="mystoreSold">000회</div>
					<!-- mystoreSold -->
				</div>
				<!-- mystoreSpec2 - mystoreSold -->
			</div>
			<!-- mystoreSpec -->
			<div id="mystoreIntroduce" style="border: 1px solid blue"></div>
			<!-- mystoreIntroduce -->
			<div id="introEdit">
				<button id="storeIntroEditBtn">소개글 수정</button>
			</div>
			<!-- introEdit -->
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
	// tab operation
	$('.tabmenu').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');
		$.ajax({
			type : 'GET', //get방식으로 통신
			url : activeTab + ".jsp", //탭의 data-tab속성의 값으로 된 html파일로 통신
			dataType : "text", //html형식으로 값 읽기
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