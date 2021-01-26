<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래내역</title>

<link rel="stylesheet" href="/pmang/css/dealLog.css">
</head>
<body>
	<div class="dealLogWrap">
		<div class="dealLogHeader">
			<h1>거래 내역</h1>
		</div>
		<!-- dealLogHeader -->

		<div class="dealLogTab">
			<ul class="logTabs">
				<li class="current">구매</li>
				<li>판매</li>

			</ul>
		</div>
		<!-- dealLogTab -->



		<div class="logTabContent">
			<div class="current">
				<!-- 클릭시 condition에 맞는 데이터를 가져와서 dealLog에 정보를 넣어줘야함.-->
				<p class="logCondition">
					<input type="radio" name="tab" id="tab1" checked="checked"/>
					<label for="tab1" class="contentType">전체</label>
					<input type="radio" name="tab" id="tab2"/>
					<label for="tab2" class="contentType">진행중</label>
					<input type="radio" name="tab" id="tab3"/>
					<label for="tab3" class="contentType">예약중</label>
					<input type="radio" name="tab" id="tab4"/>
					<label for="tab4" class="contentType">완료</label>
				</p>
				<!-- logCondition -->
				<a class="dealLog"> <span id="buyLogImg"> <img src=""
						alt="구매내역사진" width="96" height="96">
				</span> <!-- buyLogImg --> <span id="buyLogInfo"> <span
						id="buyLogInfoName">상품명상품명상품명</span> <span id="buyLogInfoPrice"><strong>50,000</strong>원</span>
						<span id="buyLogInfoId">작성자작성자</span> <span id="buyLogInfoTime">거래상태를
							변경한 날짜넣기</span>
				</span> <!-- buyLogInfo -->
				</a>
				<!-- 이건 임의로 넣은거 -->

				<a class="dealLog"> <span id="buyLogImg"> <img src=""
						alt="구매내역사진" width="96" height="96">
				</span> <!-- buyLogImg --> <span id="buyLogInfo"> <span
						id="buyLogInfoName">상품명상품명상품명</span> <span id="buyLogInfoPrice"><strong>50,000</strong>원</span>
						<span id="buyLogInfoId">작성자작성자</span> <span id="buyLogInfoTime">거래상태를
							변경한 날짜넣기</span>
				</span> <!-- buyLogInfo -->
				</a>
				<a class="dealLog"> 
					<span id="buyLogImg"> <img src=""
						alt="구매내역사진" width="96" height="96">
					</span> <!-- buyLogImg --> <span id="buyLogInfo"> <span
						id="buyLogInfoName">상품명상품명상품명</span> <span id="buyLogInfoPrice"><strong>50,000</strong>원</span>
						<span id="buyLogInfoId">작성자작성자</span> <span id="buyLogInfoTime">거래상태를
							변경한 날짜넣기</span>
				</span> <!-- buyLogInfo -->
				</a>
				<!-- 이건 임의로 넣은거 -->


			</div>
			<!-- current -->

			<div>
				<!-- 판매div -->
				<p class="logCondition">
					<input type="radio" name="tab" id="tab1" checked="checked"/>
					<label for="tab1" class="contentType">전체</label>
					<input type="radio" name="tab" id="tab2"/>
					<label for="tab2" class="contentType">진행중</label>
					<input type="radio" name="tab" id="tab3"/>
					<label for="tab3" class="contentType">예약중</label>
					<input type="radio" name="tab" id="tab4"/>
					<label for="tab4" class="contentType">완료</label>
				</p>
				<a class="dealLog"> <span id="sellLogImg"> <img src=""
						alt="판매내역사진" width="96" height="96">
				</span> <!-- buyLogImg --> <span id="sellLogInfo"> <span
						id="sellLogInfoName">상품명상품명상품명</span> <span id="sellLogInfoPrice"><strong>50,000</strong>원</span>
						<span id="sellLogInfoId">작성자작성자</span> <span id="sellLogInfoTime">거래상태를
							변경한 날짜넣기</span>
				</span> <!-- buyLogInfo -->
				</a>
				<!-- 이건 임의로 넣은거 -->


			</div>
		</div>
		<!-- logTabContent -->
	</div>
	<!-- dealLogWrap -->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="/pmang/js/dealLog.js"></script>
</body>
</html>