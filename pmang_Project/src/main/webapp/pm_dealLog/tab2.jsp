<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/pmang/css/dealLog.css">
<div class="dealLogConditionTab">
	<input type="radio" name="tab" id="tab1" checked="checked" /> 
	<label for="tab1" class="sellContentType">전체</label> 
	<input type="radio" name="tab" id="tab2" /> 
	<label for="tab2" class="sellContentType">진행중</label>
	<input type="radio" name="tab" id="tab3" /> 
	<label for="tab3" class="sellContentType">예약중</label> 
	<input type="radio" name="tab" id="tab4" /> 
	<label for="tab4" class="sellContentType">완료</label>

	<div class="dealLogInfo">
		<a class="dealLog"> 
			<span id="sellLogImg"> 
				<img src="" alt="판매내역사진" width="96" height="96">
			</span> <!-- buyLogImg  -->
			<span id="sellLogInfo"> 
				<span id="sellLogInfoName">상품명상품명상품명</span>
				<span id="sellLogInfoPrice"><strong>50,000</strong>원</span> 
				<span id="sellLogInfoId">작성자작성자</span> 
				<span id="sellLogInfoTime">거래상태를 변경한 날짜넣기</span>
		</span> <!-- sellLogInfo -->
		</a>
	</div>
	<!-- dealLogInfo -->
</div>
<!-- dealLogConditionTab -->