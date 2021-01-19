<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


#item{
	
	float:left;
}

#selection{
	align:"center";
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
			<div id="selection" style="width: 1024px; height:5729px; border: 3px solid pink">
				<div id="item" style="width:210px; height:320px; border:4px solid green;">
					<div id="itemImg" style="width:210px;height:210px; border:1px solid magenta;"><img src=""/></div>
					<div id="itemName" style="width:210px;height:50px; border:1px solid orange;"></div>
					<div id="itemInfo" style="display:inline-block;">
						<div id="itemPrice" style="width:100px;height:50px;border:1px solid blue;"></div>
						<div id="itemUpload" style="width:100px;height:50px;border:1px solid red; "></div>	
					</div>
				</div>
				
				
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				<div id="item" style="width:210px; height:320px; border:1px solid green;">
				</div>
				
				
				</div>
				
				
			<div id="aside" style="border: 3px solid black">찜, 피망톡, 최근 본 상품</div>
		</div>

		<div id="footer" style="border: 1px solid blue">푸터</div>
	</div>


	<script>
		/* 인기 카테고리 슬라이드 쇼 이벤트 */
		var ul = document.querySelector('.slide_wrap');

		function move() {

			var curIndex = 0;

			setInterval(function() {
				ul.style.transition = '0.2s';
				ul.style.transform = "translate3d(-" + 1325 * (curIndex + 1)
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