<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="/pmang/css/itemView.css">
<style>
</style>

<!-- 페이지 영역 -->
<div id="itemViewDiv">

	<!-- 카테고리 탭 -->
	<div id="categoryDiv">
		<!-- 카테고리 블록 -->
		<div id="categoryArea">
			<!-- 홈 버튼 이미지 -->
			<div class="homeicon">
				<img src="/pmang/image/home.png" alt="홈" width="20" height="20">Home</div>
				
			
			<!-- 카테고리 영역-->
			<div class="categoryArea1">
				<div class="category">
					<img src="/pmang/image/arrow.png" alt="화살표" width="20" height="20">
					디지털/가전
					<img src="/pmang/image/down.png" alt="아래 화살표" width="20" height="20">
					<div class="categoryDetail">
						<a href="#">패션</a>
						<a href="#">리빙</a>
						<a href="#">디지털/가전</a>
						<a href="#">뷰티/미용</a>
						<a href="#">육아/출산</a>
						<a href="#">스포츠/레저</a>
						<a href="#">도서/음반</a>
						<a href="#">기타/나눔</a>
					</div>
				</div>
			</div>
			
			<div class="categoryArea2">
				<div class="category">
					<img src="/pmang/image/arrow.png" alt="화살표" width="20" height="20">
					컴퓨터/주변기기
					<img src="/pmang/image/down.png" alt="아래 화살표" width="20" height="20">
					<div class="categoryDetail">
						<a href="#">모바일</a>
						<a href="#">가전제품</a>
						<a href="#">음반/영상기기</a>
						<a href="#">컴퓨터/주변기기</a>
						<a href="#">카메라</a>
						<a href="#">게임</a>					
					</div>
				</div>
			</div>
			
			<div class="categoryArea3">
				<div class="category">
					<img src="/pmang/image/arrow.png" alt="화살표" width="20" height="20">
					노트북/넷북
					<img src="/pmang/image/down.png" alt="아래 화살표" width="20" height="20">
					<div class="categoryDetail">
						<a href="#">데스크탑</a>
						<a href="#">키보드/마우스</a>
						<a href="#">모니터</a>
						<a href="#">CPU/메인보드/램/저장장치</a>
						<a href="#">노트북/넷북</a>
						<a href="#">기타 액세서리</a>
					</div>
				</div>
			</div>
		</div><!-- 카테고리 블록 -->
	</div><!-- 카테고리 탭­-->
	
	
	<!-- 상품 영역 -->
	<div>
		<div id="itemDiv">
		
			<!-- 이미지 영역 -->
			<div id="itemPic">
				<img src="/pmang/image/itemPic.jpg" alt="item pic">
			</div>
		
			<!-- 상품 정보 영역 -->
			<div id=itemArea>
				<!-- 상품 설명 -->
				<div>
					<!-- 상품명, 상품가 -->
					<div id="nameNPrice">
						<div id="itemName">
							<h4>토마토 한우 버섯 그라탕</h4>
						</div>
						
						<div id="itemPrice">
							<h4><span id="priceSpan">
							130,000 </span>원</h4>
						</div>
					</div>
					
					<!-- 상품 게시글 정보 -->
					<div id="postInfo">
						<div id="likeHitDate">
							<div class="likeDateHit">
								<img src="/pmang/image/like.jpg" alt="찜수" width="20" height="20">
								127
							</div>
							<div class="likeDateHit">
								<img src="/pmang/image/hit.jpg" alt="조회수" width="20" height="20">
								152	
							</div>
							<div class="likeDateHit">
								<img src="/pmang/image/date.jpg" alt="게시일" width="20" height="20">
								방금 전	
							</div>			
							<div id="reportBtn">
								<img src="/pmang/image/reportBtn.JPG" alt="신고하기" width="20" height="20">
								신고하기
							</div>
						</div>
					</div>
					<!-- 상세 설명 -->
					<div>
						<div class="dealInfo">
							<div class="infoQ">상품상태</div>
							<div class="infoA">중고</div>
						</div>
						<div class="dealInfo">
							<div class="infoQ">교환여부</div>
							<div class="infoA">교환 불가</div>
						</div>
						<div class="dealInfo">
							<div class="infoQ">배송비</div>
							<div class="infoA">배송비 별도</div>
						</div>
						<div class="dealInfo">
							<div class="infoQ">거래지역</div>
							<div class="infoA">"서울특별시 종로구 대학로"</div>
						</div>
															
					</div>
				</div><!-- 상품 설명 -->
				
				<!-- 버튼 영역 -->
				<div id="buttonArea">
					<div id="like">찜하기</div>
					<div id="contact">연락하기</div>
					<div id="pay">바로구매</div>
				</div><!-- 버튼 영역 -->
			</div><!-- 상품 정보 영역 -->
		</div><!-- 상품 영역 -->
	</div>
</div><!-- 페이지 영역 -->	

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	
	<!-- 상품상세 +문의 -->
<div id="content">
	<!-- 탭메뉴 -->
	<div id="contentMenuDiv">
	<ul id="contentMenu">
		<li class="contentMenu current" data-tab="contentSection01" >상품정보</li>
		<li class="contentMenu" data-tab="contentSection02">상품문의 (<span class="comment">'문의댓글 수가 나와야합니다'</span>)</li><!-- 상품문의 옆에 댓글개수 나오도록 구현해야합니다~ -->
	</ul>
	</div>
<!-- ---------------탭메뉴 -->

<!-- 상품정보 -->
<div id="contentSection01" class="contentSection">
	<h3>상품정보</h3>
	<hr width="90%" align="left" size="1px" color="#eee" noshade="noshade" >
	<br>
	<div>판매자가 업로드한 내용이 올라와야 합니다.</div>
	<br><br>
	
	<!-- 거래지역, 카테고리, 상품태그 div -->
	<div id="productInfo">
		<div class="productInfo">
			<div class="productInfoDiv">거래지역</div>
			<div><a a href="#">사용자가 지정한 위치</a></div>			
		</div>
		<div class="productInfo border">
			<div class="productInfoDiv">카테고리</div>
			<div><a href="#">사용자가 지정한 카테고리</a></div>
		</div>
		<div class="productInfo border">
			<div class="productInfoDiv">상품태그</div>
			<div><a href="#">사용자가 설정한 태그</a></div>
		</div>
	</div>
	<!-- --거래지역, 카테고리, 상품태그 div  -->
</div>
<!-- 상품정보div -->
<br><br>
<!-- 상품문의 -->
<div id="contentSection02" class="contentSection">
	
	<h3>상품문의 <span class="commentNum" style="color: green;">'문의댓글 수가 나와야합니다'</span></h3>
	
	<div id="reply"><!-- 댓글창 -->
		<div class="replyDiv text"><!-- 댓글 test입력 -->
			<textarea id="replyText" maxlength="300"  placeholder="상품문의 입력" ></textarea>
		</div>
		
		<div class="replyDiv"><!-- 댓글 글자제한/등록버튼 -->
			<span><span id="count">0</span> / 300</span>
			<button id="replyBtn">등록</button>
		</div>
	</div>
	<div class="replyList"><!-- 댓글들 list 5개씩 출력, 상품문의 더보기 -->
		<div class="replyUser"><!-- 댓글하나 상단에 패딩넣어줌-->
			
			<a href="#"><!-- 프로필사진 누르면 유저판매페이지??로 넘어감 -->
				<img alt="프로필이미지" src="여기에 유저프로필사진 넣어주세요" width="50" height="50">
			</a>
			
			<div class="replyTot">
				<div>
					<div class="replyUserName">유저닉네임</div>
					<div class="replyDate" align="right">방금전</div><!-- 시간넣어주세요 -->
				</div>
				
				<div class="replyContent">댓글 내용을 넣어주세요</div>
				
				<div>
					<div class="replyComment"><a href="#">덧글달기</a></div>
					<div class="replyNotify"><a href="#">신고하기</a></div>
				</div>
			</div>
			<hr width="100%">
			
		</div>
	</div>
</div><!-- 상문문의div-->

</div><!-- 상품상세 + 문의 div -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/pmang/js/itemView.js"></script>

