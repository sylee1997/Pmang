<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pmang/css/footer.css">
<style type="text/css">
#wrap {
	width: 70%;
	height: 100%;
	overflow: hidden;
}

#header {
	height: 100px;
}

#container {
	position: relative;
	height: 500px;
}

#selection {
	width: 300px;
	float: left;
}

#aslide {
	float: left;
}

#footer {
	height: 100px;
}

/* 인기 카테고리 슬라이드 쇼 css*/
.slide_box {
	width: 200px;
	position: relative;
	left: 50%;
	margin-left: -100px;
	top: 400px;
	border: 5px blue solid;
	z-index: 100;
}

.slide_wrap {
	background: red;
	/* width: 1000px; */
	margin: 0;
	padding: 0;
}

.slide_item {
	background: green;
	width: 1325px;
	height: 200px;
	list-style: none;
	float: left;
	text-align: center;
	line-height: 50px;
}

.slide_item a {
	text-decoration: none;
	color: black;
}

#item {
	float: left;
}

#selection {
	align: "center";
}
</style>
<title>피망마켓에 오신것을 환영합니다.</title>
</head>
<body>

	<div id="wrap" style="border: 1px solid red">
		<div id="header" style="border: 1px solid red">
			<h2 id="logo">피망마켓</h2>
			<div id="search_Div">
				<input type="text" id="search" name="search"
					placeholder="상품명, #해시태그, @상점명 입력">
			</div>


	<div id="wrap">
		<div id="header" style="border: 1px solid red">
			<h2 id="logo">피망마켓</h2>
			<div id="search_Div">
				<input type="text" id="search" name="search"
					placeholder="상품명, #해시태그, @상점명 입력">
			</div>

		</div>

		

			<div id="container" style="border: 3px solid black">
				<!-- 인기카테고리 영역 -->
				<div class="slide">
					<ul class="slide_wrap"
						style="width: 6625px; height: 200px; border: 2px solid blue;">
						<li class="slide_item"><a href="#"><img
								src="image/bench.jpg" alt="벤치프레스" /></a></li>
						<li class="slide_item"><a href="#">2</a></li>
						<li class="slide_item"><a href="#">3</a></li>
						<li class="slide_item"><a href="#">4</a></li>
						<li class="slide_item"><a href="#">5</a></li>
					</ul>
				</div>


				<!-- 최근 상품 게시판 영역 -->
				<div id="selection"
					style="width: 1024px; height: 5729px; border: 3px solid pink">
					<div id="item"
						style="width: 210px; height: 320px; border: 4px solid green;">
						<div id="itemImg"
							style="width: 210px; height: 210px; border: 1px solid magenta;">
							<img src="" />
						</div>
						<div id="itemName"
							style="width: 210px; height: 50px; border: 1px solid orange;"></div>
						<div id="itemInfo" style="display: inline-block;">
							<div id="itemPrice"
								style="width: 100px; height: 50px; border: 1px solid blue;"></div>
							<div id="itemUpload"
								style="width: 100px; height: 50px; border: 1px solid red;"></div>
						</div>
					</div>


					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>
					<div id="item"
						style="width: 210px; height: 320px; border: 1px solid green;">
					</div>


				</div>


				<div id="aside" style="border: 3px solid black">찜, 피망톡, 최근 본
					상품</div>
			</div>

			<div id="footer" style="border: 1px solid blue">푸터</div>
		</div>

</div>

		<script>
			/* 인기 카테고리 슬라이드 쇼 이벤트 */
			var ul = document.querySelector('.slide_wrap');

			function move() {

				var curIndex = 0;

				setInterval(function() {
					ul.style.transition = '0.2s';
					ul.style.transform = "translate3d(-" + 1325
							* (curIndex + 1) + "px, 0px, 0px)";

					curIndex++;

					if (curIndex === 4) {
						curIndex = -1;
					}

				}, 1000);
			}
			document.addEventListener("DOMContentLoaded", function() {
				// 
				move();
			});
			/* 인기 카테고리 슬라이드 쇼 이벤트 */
		</script>


		<div class="footer">
			<!-- style="border:1px solid blue" -->
			<div class="footerCategoryArea">
				<div class="footerCategory">
					<a class="cIPDuS" href="#">공지사항</a> <a class="cIPDuS" href="#">자주묻는질문</a>
					<a class="cgGBdw" href="#">운영정책</a> <a class="cIPDuS" href="#">1:1문의하기</a>
					<a class="cgGBdw" href="#">사업자정보확인</a> <a class="cgGBdw" href="#">이용약관</a>
					<a class="cgGBdw" href="#">청소년보호정책</a> <a class="cgGBdw" href="#">위치기반서비스
						이용약관</a>
				</div>
			</div>

			<div class="footerContentArea">
				<div class="footerContent">
					<div class="footerContentMark">
						(피망장터이미지)피망장터
						<div class="footerContentMarkTitle">피나게 망하지 않을 만큼 판매하는
							장터입니다. 누구나, 무엇이든 쉽고 편하고 안전하게 거래할 수 있습니다.</div>
					</div>

					<div class="icon">
						<a href="#" target="_blank"> <img
							src="/pmang/footerImage/facebook.png" alt="facebook icon"
							style="margin: 0px 5px 0px 16px;">
						</a> <a href="#" target="_blank"> <img
							src="/pmang/footerImage/instagram.png" alt="instagram icon">
						</a>
					</div>
				</div>

				<div class="footerCompanyInfo">
					<div class="infomain">
						대표이사: 김우석 &nbsp;|&nbsp; 개인정보담당자: 구세주 &nbsp;|&nbsp; 사업자등록정보 :
						110-383-234... &nbsp;|&nbsp; 통신판매업신고 : 아직안했음 <br> 주소: 서울시 서초구
						강남대로... <br> "고객센터 대표번호: 1544-1234" &nbsp;|&nbsp; FAX
						02-345-6789 <br>

						<div class="CustomerService">
							<p>고객센터 운영시간:</p>
							<p>
								&nbsp;전화문의 : 9시 ~ 18시 (주말,공휴일 제외) &nbsp;|&nbsp; 1:1문의 : 9시~18시 <br>
								※점심시간 12~13시
							</p>
						</div>
						고객센터 문의 help@pmang.co.kr &nbsp;|&nbsp; 제휴문의 partner@pmang.co.kr <br>
						호스팅서비스 제공자: bitcamp <br> <br> “피망장터_컨시어지” 상점의 판매상품을 제외한
						모든 상품들에 대하여, 피망장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한
						상품정보 및 거래에 대해 책임을 지지 않습니다. <br>
					</div>

					<div>
						<div class="">Copyright ⓒ Pmangjangter Inc. All rights
							reserved.</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>