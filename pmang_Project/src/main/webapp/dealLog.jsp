<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래내역</title>
<style type="text/css">
body * {
	box-sizing: border-box;
	font-family: "Noto Sans KR", -apple-system, BlinkMacSystemFont,
		"Helvetica Neue", Arial, sans-serif;
	outline: 0px;
	font-size: 16px;
}

.dealLogWrap {
	min-width: 320px;
	max-width: 640px;
	min-height: 100vh;
	margin: 0px auto;
	box-sizing: border-box;
}

.dealLogHeader {
	position: sticky;
	top: 0px;
	line-height: 3.125rem;
	font-weight: bold;
	text-align: center;
	color: rgb(30, 29, 41);
	background-color: rgb(255, 255, 255);
	z-index: 1;
}

.dealLogTab {
	display: flex;
	margin: 0 auto;
	justify-content: space-between;
	vertical-align: baseline;
	min-width: 320px;
	max-width: 800px;
	margin: 0 auto;
	background: #ffffff;
}

.logTabs li {
	background: white;
	width: 50%;
	border: 1px solid #eee;
	border-bottom-color: black;
	background: #fafafa;
	padding: 20px -0px;
	list-style: none;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	color:black;
}

.logTabs .current {
	color: green;
	border-top:2px solid green;
}

.logTabs {
	display: flex;
	width: 100%;
	/* display: inline-block; */
	margin: 0 auto;
	padding: 15px 0px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	justify-content: space-between;
	vertical-align: baseline;
}

.logTabContent {
	clear: both;
}

.logTabContent div {
	display: none;
}

.logTabContent div.current {
	margin-top: 10px;
	display: block;
	-webkit-box-align: center;
	align-items: center;
	width: 100%;
	border-bottom: 1px solid rgb(238, 238, 238);
}

.logCondition button {
	padding: 0px 0.5rem;
	height: 1.5rem;
	border-radius: 12px;
	text-align: center;
	font-size: 13px;
	color: black;
	border: solid 1px transparent;
	cursor: pointer;
	margin: 5px;
}

/*구매내역*/
#buyLogImg {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 6rem;
}

#buyLogInfo {
	display: flex;
	width: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	flex-direction: column;
	margin-left: 0.5rem;
	overflow: hidden;
	-webkit-box-pack: center;
}

#buyLogInfo span {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin: 2px 0;
}

#buyLogInfoName {
	font-size: 0.875rem;
}

#buyLogInfoPrice {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 4px 0px;
	font-size: 0.8125rem;
	line-height: 0.8125rem;
}

#buyLogInfoId {
	font-size: 0.75rem;
	color: gray;
}

#buyLogInfoTime {
	font-size: 0.75rem;
	color: gray;
	vertical-align: baseline;
}

/*판매내역*/
#sellLogImg {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 6rem;
}

#sellLogInfo {
	display: flex;
	width: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	flex-direction: column;
	margin-left: 0.5rem;
	overflow: hidden;
	-webkit-box-pack: center;
}

#sellLogInfo span {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin: 2px 0;
}

#sellLogInfoName {
	font-size: 0.875rem;
}

#sellLogInfoPrice {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 4px 0px;
	font-size: 0.8125rem;
	line-height: 0.8125rem;
}

#sellLogInfoId {
	font-size: 0.75rem;
	color: gray;
}

#sellLogInfoTime {
	font-size: 0.75rem;
	color: gray;
	vertical-align: baseline;
}

.dealLog {
	width: 640px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	border-bottom: 1px solid rgb(238, 238, 238);
}
</style>
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

		<!-- 클릭시 condition에 맞는 데이터를 가져와서 dealLog에 정보를 넣어줘야함.-->
		<div class="logCondition">
			<button id="logConditionAll">전체</button>
			<button id="logConditionIng">진행중</button>
			<button id="logConditionReserv">예약중</button>
			<button id="logConditionComplete">완료</button>
		</div>
		<!-- logCondition -->

		<div class="logTabContent">
			<div class="current">
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
				</a><a class="dealLog"> <span id="buyLogImg"> <img src=""
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

			<div><!-- 판매div -->
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

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('.logTabs li').click(function() {
			var idx = $(this).index();
			$('.logTabs li').removeClass('current');
			$('.logTabs li').eq(idx).addClass('current');
		

			$('.logTabContent > div').hide();
			$('.logTabContent > div').eq(idx).show();

		});
	});
</script>
</html>