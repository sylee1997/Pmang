<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="/pmang/css/itemView.css">
<style>
</style>
<input type="hidden" id="item_seq" name="item_seq" value="${item_seq}">
<input type="hidden" id="comment_seq" name="comment_seq" value="">
<input type="hidden" id="userId" name="userId" value="hiddenId"> <!-- 나중에 세션에서 받는 값으로 변경 -->
<input type="hidden" id="commentIndex" name="commentIndex" value="1">



<div id="itemViewDiv">
   <div class="selection01">
	<div class="categoryDiv">
		<div class="home">
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAkRJREFUSA3tlb9LHEEUx2/vzhQXESxsTau1aWxsFDkQA0ljEcv78RfY2EQbwT/hflU2KjGkCASRgI1FQEVstNU2QkD0YnXn5x03x7vZXXfnXGzMwPBm3pv5fubNj10vNUCpVCpDTNuibpfL5e8DSKTSrpME6nneDvOWqLv1en3RVUPGO4ENtN1uf2RukzrUarW+4l8QMZcSG2xBb9Lp9DSgdRbxBrtH5nkXsBdncAB0tlgsnstcYmuYL2z/A/UD/gPxR5VI8FNQI27g9P9lMpnFQqHwy8TC7JPgOFAjrOBNjmGBzA9NLMiGnrELVIR5VmuYdWqOc//Bmc/QDi2BGbtCtbrK/I5tz7PtRzpu2r6MnwMVUZX5ME/tZ6PRkNvvK30ZPxeq1VXmt/jnWdBvHe9lnCRUACrzEbr7ZP5egzsZW9AU7zFfKpX29cBB29Vq9Vv3S/cXjTkWdCpaWRsqTsA3Yk1hTI4nMmn6YZYzvUf4UseB/un2R9E9YCGzJHWWRXCF4DjOE6yI5/REaQsU0WPbb/dFA1/flqoxsqB7GJsk8jnLQ9/AITXFao4JTEk7pDQRv7BjzHmLb8L26z6LX4YlC+uUrGnEsQJlm3wZ1Wq1qTg7ohm9W62dL9H+D36JXe4wnC4Xt3eMi1SyV8fFemf7ovpOYMTGgVSiROPEY4GBydenGiXIc7uKGmPiscB8Bq+ZUDaTkrCv7zkFbjVn+kk+g0lsKS9hkuqTCgQzahW4b3CSjj4wt1J+2r0/SJKg7svoST4CXawe/d9nd+gAAAAASUVORK5CYII=" 
			width="15" height="15" alt="카테고리 네비게이션 아이콘">
			홈
		</div>
		
		<div class="firstCategory">
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
			 width="6" height="10" alt="카테고리 선택그룹 아이콘">
		 	<div class="selectItem1">
		 		<div class="top1">
		 		패션     
		 			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" 
		 			width="10" height="6" alt="카테고리 화살표 아이콘">
		 		</div>
		 		
		 		<div class="down1">
		 			<a href="#">패션</a>
		 			<a href="#">디지털/가전</a>
		 			<a href="#">도서/티켓</a>
		 			<a href="#">리빙용품</a>
		 			<a href="#">스포츠/레저</a>
		 			<a href="#">뷰티/미용</a>
		 			<a href="#">유아/출산</a>
		 			<a href="#">기타</a>
		 			<a href="#">커뮤니티</a>
		 		</div>
		 	</div> <!-- selectItem -->
		</div><!-- firstCategory -->
		
		<div class="secondCategory">
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
		 	width="6" height="10" alt="카테고리 선택그룹 아이콘">
		 	<div class="selectItem2">
		 		<div class="top2">
		 			여성의류
		 			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" 
		 			width="10" height="6" alt="카테고리 화살표 아이콘">
		 		</div>
		 		
		 		<div class="down2">
		 			
		 		</div>
		 	</div> <!-- selectItem -->
		</div><!-- secondCategory -->
		
		<div class="thirdCategory">
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
		 	width="6" height="10" alt="카테고리 선택그룹 아이콘">
		 	<div class="selectItem3">
		 		<div class="top3">
		 			아우터
		 			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" 
		 			width="10" height="6" alt="카테고리 화살표 아이콘">
		 		</div>
		 		
		 		<div class="down3">
		 			<a href="#">아우터</a>
		 			<a href="#">티셔츠</a>
		 			<a href="#">니트</a>
		 			<a href="#">셔츠/블라우스</a>
		 			<a href="#">맨투맨/후드집업</a>
		 			<a href="#">원피스/세트</a>
		 			<a href="#">바지</a>
		 			<a href="#">스커트</a>
		 		</div>
		 	</div><!-- selectItem -->
		 </div><!-- thirdCategory -->
		
	</div><!-- categoryDiv -->
	
	<div class="detailItemDiv">
		<div class="detailItem">
			<a class="entireView" href="#" style="text-decoration: none;">
			전체보기
			</a>
		</div>
	</div>
	</div>

	

	<!-- 상품 영역 -->

	<div id="itemDiv">

		<!-- 상품 이미지 영역 -->
		<div id="imageArea">
			<img id="itemPic" src="/pmang/image/itemPic.jpg" alt="item pic">

			<!-- 확대 버튼 -->
			<input type="checkbox" id="imgCheckBox">
			<label id="imgDetailBtn" for="imgCheckBox">
				<img src="/pmang/image/imageModalBtn.png" width="35" height="35">
			</label>
			
			<!-- 모달 영역 -->
			<div id="modalView" class="modalComp">
				<div id="slideShowPage">
					<!-- 상풍명 -->
					<span id="modalItemName" class="nameSpan">DB에러</span>
					<!-- 슬라이드 쇼 영역-->		
					<div id="slideShowArea">
						<div id="slideShowDiv">
							<div id="slideShow">
								<div>
									<img src="/pmang/image/itemPic.jpg">
								</div>
								<div>
									<img src="/pmang/image/itemPic.jpg">
								</div>
								<div>
									<img src="/pmang/image/itemPic.jpg">
								</div>
							</div>
						</div>
					</div>
					<!-- 슬라이드 쇼 영역 끝-->
					<!-- 종료버튼 -->
					<label id="closeBtn" for="imgCheckBox">
						<img src="/pmang/image/imgClose.png" width="30" height="30">
					</label>
				</div>
			<!-- 배경 -->
			<label id="blackBackground" class="modalComp" for="imgCheckBox"></label>
			</div>
			<!-- 모달영역 끝 -->
			
			<!-- 왼쪽 사진 버튼 -->
			<a id="imgLeftBtn" >
				<img src="/pmang/image/imgLeft.png" width="50" height="50">
			</a>
			
			<!-- 오른쪽 사진 버튼 -->
			<a id="imgRightBtn"  >
				<img src="/pmang/image/imgRight.png" width="50" height="50">
			</a>
			
		</div>
		<!-- 상품 이미지 영역 -->
		

		<!-- 상품 정보 영역 -->
		<div id=itemArea>
			<!-- 상품 설명 -->
			<div>
				<!-- 상품명, 상품가 -->
				<div id="nameNPrice">
					<div id="itemName">
						<h4><span class="nameSpan">DB에러</span></h4>
					</div>

					<div id="itemPrice">
						<h4>
							<span class="priceSpan"> DB에러 </span>원
						</h4>
					</div>
				</div>

				<!-- 상품 게시글 정보 -->
				<div id="postInfo">
					<div id="likeHitDate">
						<div class="likeDateHit">
							<img src="/pmang/image/like.jpg" alt="찜수" width="20" height="20">
							<span class="likeSpan">DB에러</span>
						</div>
						<div class="likeDateHit">
							<img src="/pmang/image/hit.jpg" alt="조회수" width="20" height="20">
							<span class="hitSpan">DB에러</span>
						</div>
						<div class="likeDateHit" style="width:200px;">
							<img src="/pmang/image/date.jpg" alt="게시일" width="20" height="20">
							<span class="dateSpan">DB에러</span>
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
						<div class="infoA"><span class="conditionSpan">DB에러</span></div>
					</div>
					<div class="dealInfo">
						<div class="infoQ">흥정가능</div>
						<div class="infoA"><span class="negoSpan">DB에러</span></div>
					</div>
					<div class="dealInfo">
						<div class="infoQ">상품수량</div>
						<div class="infoA"><span class="qtySpan">DB에러</span></div>
					</div>
					<div class="dealInfo">
						<div class="infoQ">거래지역</div>
						<div class="infoA"><span class="locationSpan">DB에러</span></div>
					</div>

				</div>
			</div>
			<!-- 상품 설명 -->

			<!-- 버튼 영역 -->
			<div id="buttonArea">
				<div id="like"><img src="/pmang/image/zzimNo.png" width="35" height="35">찜하기</div>
				<div id="contact"><img src="/pmang/image/contactIcon.png" width="35" height="35">연락하기</div>
				<!-- <div id="pay">바로구매</div> -->
			</div>
			<!-- 버튼 영역 -->
		</div>
		<!-- 상품 정보 영역 -->
	</div>
	<!-- 상품 영역 -->
</div>
<!-- 페이지 영역 -->

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

<!-- 상품상세 +문의 -->
<div id="content">
	<!-- 탭메뉴 -->
	<div id="contentMenuDiv">
		<ul id="contentMenu">
			<li class="contentMenu current" data-tab="contentSection01">상품정보</li>
			<li class="contentMenu" data-tab="contentSection02">상품문의 (<span
				class="commentNum">DB에러</span>)
			</li>
			<!-- 상품문의 옆에 댓글개수 나오도록 구현해야합니다~ -->
		</ul>
	</div>
	<!-- ---------------탭메뉴 -->


	<!-- 상품정보 -->
	<div id="contentSection01" class="contentSection">
		<h3>상품정보</h3>
		<hr width="90%" align="left" size="1px" color="#eee" noshade="noshade" >
		<br>
		<div><span class="commentSpan">DB에러</span></div>
		<br><br>
		
		<!-- 거래지역, 카테고리, 상품태그 div -->
		<div id="productInfo">
			<div class="productInfo">
				<div class="productInfoDiv">거래지역</div>
	
				<div><a href="#"><span class="locationSpan">DB에러</span></a></div>			
	
			</div>
			<div class="productInfo border">
				<div class="productInfoDiv">카테고리</div>
				<div><a href="#">
					<span class="category1Span">DB에러</span>
					<span class="category2Span"></span>
					<span class="category3Span"></span>
					</a></div>
			</div>
			<div class="productInfo border">
				<div class="productInfoDiv">상품태그</div>
				<div><a href="#">
					<span class="hashtag1Span">DB에러</span>
					<span class="hashtag2Span"></span>
					<span class="hashtag3Span"></span>
					</a></div>
			</div>
		</div>
		<!-- --거래지역, 카테고리, 상품태그 div  -->
	</div>
	<!-- 상품정보div -->
	<br><br>
	<!-- 상품문의 -->
	<div id="contentSection02" class="contentSection">
	
		<h3>상품문의 <span class="commentNum" style="color: green;">DB에러</span></h3>
		
		<div id="reply"><!-- 댓글창 -->
			<div class="replyDiv text"><!-- 댓글 test입력 -->
				<textarea id="replyText" maxlength="300">111</textarea>
			</div>
			
			<div class="replyDiv"><!-- 댓글 글자제한/등록버튼 -->
				<span><span id="count">0</span> / 300</span>
				<button id="replyBtn">등록</button>
			</div>
		</div>
		<div class="replyList"><!-- 댓글들 list 5개씩 출력, 상품문의 더보기 -->
			<!-- 댓글하나 상단에 패딩넣어줌
			<div class="replyUser">
				<a href="#">
					<img alt="프사" src="" width="50" height="50">
				</a>
				
				<div class="replyTot">
					<div class="CommentArea">
						<div class="replyUserName">유저닉네임</div>
						<div class="replyDate" align="right">방금전</div>
						시간넣어주세요
					</div>
					<div class="replyContent">댓글 내용을 넣어주세요</div>
					<div>
						<div>
							<a href="#">덧글달기</a>
						</div>
						<div>
							<a href="#">신고하기</a>
						</div>
					</div>
				</div>
					<hr width="100%"> 
			</div> 댓글 하나 -->
		</div>
	</div>
	<div id="moreBtn"><img src="/pmang/image/moreBtn.png" width="20" height="20">상품문의 더보기</div>
	<!-- 상문문의div-->
</div>
<!-- 상품상세 + 문의 div -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/pmang/js/itemView.js"></script>

