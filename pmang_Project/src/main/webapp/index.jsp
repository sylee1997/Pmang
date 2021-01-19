<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pmang/css/pm_index.css">
<title>피망마켓에 오신것을 환영합니다.</title>
</head>
<body>
<div id="wrap">
	<div id="header" style="border:3px solid red">
		<div class="header_logo">
				<div class="logo-wrap">
		        	<img src="./image/main_logo.jpg" alt="main_logo" />
		        	<h2>피망장터</h2>
		      	</div>
		      	<div class="search-wrap">
		        	<input type="text" placeholder="상품명,지역명,@상점명입력" />
		      	</div>
		      	<nav>
		        <ul>
		          <li>
		            <img src="./image/main_logo.jpg" alt="sale" />
		            <span>판매하기</span>
		          </li>
		          <li>
		            <span class="vertical">|</span>
		          </li>
		          <li>
		            <img src="./image/main_logo.jpg" alt="store" />
		            <span>내상점</span>
		          </li>
		          <li>
		            <span class="vertical">|</span>
		          </li>
		          <li>
		            <img src="./image/main_logo.jpg" alt="login" />
		            <span>로그인</span>
		          </li>
		        </ul>
		      </nav>
	     </div>
		
   		<div id="header_category">
      		<nav id="categoryNav">
         	<ul>
            	<li id="categlryIcon"><a href="#"><img alt="" src="../image/category.png"> 카테고리</a>
               <ul class="category1Menu">
                  <li><a href="#">여성의류</a>
                     <ul class="category2Menu">
                        <li><a href="#">원피스</a></li>
                        <li><a href="#">블라우스</a></li>
                        <!-- 추가해야함... -->
                     </ul></li>
                  <li><a href="#">패션잡화</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">남성의류</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">기타</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">등등..</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
               </ul></li>
         	</ul>
		</nav>
  	 </div>
	</div>
	
	<div id="container" style="border:3px solid black">
		<div class="content">
			<div id="slide" style="height:400px; border:3px solid green">
			<!-- 	<ul class="slide_wrap" style="border: 2px solid blue;">
						<li class="slide_item"><a href="#"><img src="image/bench.jpg" alt="벤치프레스" /></a></li>
						<li class="slide_item"><a href="#"></a></li>
						<li class="slide_item"><a href="#"></a></li>
						<li class="slide_item"><a href="#"></a></li>
						<li class="slide_item"><a href="#"></a></li>
				</ul> -->
			</div>
			
			<div id="selection" style="border: 3px solid pink">
				<div id="item">
						<div id="itemImg"style="width: 210px; height: 210px; border: 1px solid magenta;">
							<img src="" />
						</div>
						<div id="itemName" style="width: 210px; height: 50px; border: 1px solid orange;"></div>
						<div id="itemPrice" style="width: 100px; height: 50px; border: 1px solid blue; float: left;"></div>
						<div id="itemUpload" style="width: 100px; height: 50px; border: 1px solid red; float: right;"></div>
				</div>


					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>
					<div id="item"></div>

				</div>
		</div>
		
		<div id="aside" style="border:3px solid yellow">
			<div class="asideDiv">
				<div class="likebag">찜한상품
					<div class="bag_click">
						<a class="bag_clickA" href="#">
						<img src="/pmang/image/zeroBag.png" style="padding-top:5px; width:18px; height:18px; cursor:pointer;">
						0 <!-- 계속 바꿔줘야 되는것 -->
						</a>
					</div>
				</div>
				
				
				<div class="recentlyLook">
					최근본상품
					<br>
					0 <!-- 계속 바꿔줘야 되는것 -->
					<br>
					<img src="/pmang/image/aside_1.JPG" style="width:50px; height:20px;">
					<div class="goods">
						<div id="goods_img1" style="width: 80px; height: 80px; border : 1px solid black"></div>
						<div id="goods_img2" style="width: 80px; height: 80px; border : 1px solid black"></div>
						<div id="goods_img3" style="width: 80px; height: 80px; border : 1px solid black"></div>
					</div>
				</div>
				
				<div class="topBtn">
					<a id="topA" href="#header">TOP</a>
				</div>
				
				<div class="pmangTok">
					<a class="pmangTokA" href="#">
					<img src="/pmang/image/pmangTok.png" style="padding-left: 2px; width: 90px; height:70px;">
						피망Tok
					</a>
				</div>
			</div>

		</div>
	</div>
	
	<div class="footer" style="border:3px solid blue">
		<div class="footerCategoryArea">
			<div class="footerCategory">
				<a class="cIPDuS" href="#">공지사항</a>
				<a class="cIPDuS" href="#">자주묻는질문</a>
				<a class="cgGBdw" href="#">운영정책</a>
				<a class="cIPDuS" href="#">1:1문의하기</a>
				<a class="cgGBdw" href="#">사업자정보확인</a>
				<a class="cgGBdw" href="#">이용약관</a>
				<a class="cgGBdw" href="#">청소년보호정책</a>
				<a class="cgGBdw" href="#">위치기반서비스 이용약관</a>
			</div>
		</div>
		
		<div class="footerContentArea">
			<div class="footerContent">
				<div class="footerContentMark">(피망장터이미지)피망장터
					<div class="footerContentMarkTitle">피나게 망하지 않을 만큼 판매하는 장터입니다. 누구나, 무엇이든 쉽고 편하고 안전하게 거래할 수 있습니다.</div>
				</div>
				
				<div class="icon">
					<a href="#" target="_blank">
						<img src="/pmang/image/facebook.png" alt="facebook icon" style="margin: 0px 5px 0px 16px;">
					</a>
					
					<a href="#" target="_blank">
						<img src="/pmang/image/instagram.png" alt="instagram icon">
					</a>
				</div>
			</div>
			
			<div class="footerCompanyInfo">
				<div class="infomain">
					대표이사: 김우석 &nbsp;|&nbsp; 개인정보담당자: 구세주 &nbsp;|&nbsp; 사업자등록정보 : 110-383-234...
					&nbsp;|&nbsp; 통신판매업신고 : 아직안했음
					<br>
					주소: 서울시 서초구 강남대로...
					<br>
					"고객센터 대표번호: 1544-1234" &nbsp;|&nbsp; FAX 02-345-6789
					<br>
					
					<div class="CustomerService">
						<p>고객센터 운영시간:</p>
						<p>
							&nbsp;전화문의 : 9시 ~ 18시 (주말,공휴일 제외) &nbsp;|&nbsp; 1:1문의 : 9시~18시
							<br>
							※점심시간 12~13시
						</p>
					</div>
					고객센터 문의 help@pmang.co.kr &nbsp;|&nbsp; 제휴문의 partner@pmang.co.kr
					<br>
					호스팅서비스 제공자: bitcamp
					<br>
					<br>
					“피망장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 피망장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
					<br>
				</div>
				
				<div>
					<div class="">
						Copyright ⓒ Pmangjangter Inc. All rights reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
		/* 인기 카테고리 슬라이드 쇼 이벤트 */
		var ul = document.querySelector('.slide_wrap');
		function move() {
			var curIndex = 0;
			setInterval(function() {
				ul.style.transition = '0.5s';
				ul.style.transform = "translate3d(-" + 1024 * (curIndex + 1)
						+ "px, 0px, 0px)";
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
</body>
</html>