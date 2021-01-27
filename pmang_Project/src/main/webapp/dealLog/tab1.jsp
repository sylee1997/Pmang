<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/pmang/css/dealLog.css">
<div class="dealLogConditionTab">
	<!-- radio버튼 누를때마다 해당 상태에 맞는 상품들을 가져와야함 -->
	<input type="radio" name="tab" id="tab1" checked="checked" />
	<label for="tab1" class="buyContentType">전체</label>
	<input type="radio" name="tab" id="tab2" />
	<label for="tab2" class="buyContentType">진행중</label>
	<input type="radio" name="tab" id="tab3" />
	<label for="tab3" class="buyContentType">예약중</label>
	<input type="radio" name="tab" id="tab4" />
	<label for="tab4" class="buyContentType">완료</label>
	
	<div class="dealLogInfo">
		<a href="#">
			<span id="buyLogImg"> 
				<img src="" alt="구매내역사진" width="96" height="96">
			</span><!-- buyLogImg  -->
			<span id="buyLogInfo"> 
				<span id="buyLogInfoName">상품명상품명상품명</span> 
				<span id="buyLogInfoPrice"><strong>50,000</strong>원</span>
				<span id="buyLogInfoId">작성자작성자</span> 
				<span id="buyLogInfoTime">거래상태를 변경한 날짜넣기</span>
			</span><!--  buyLogInfo -->
		</a>
	</div><!-- dealLogInfo -->
</div>