<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#wrap {
	width: 100%;
	height: 100%;
}

#header {
	height: 100px;
}

#container {

	position: relative;
	height : 500px;
}

#selection {
	width: 300px;
	float: left;
 	
}

#aslide {
	float: left;
}
#footer {
	height : 100px;
}


</style>
<title>피망마켓에 오신것을 환영합니다.</title>
</head>
<body>
<div id="wrap" style="border:1px solid red">
	<div id="header" style="border:1px solid red">
		<h2 id="logo">피망마켓</h2>
		<div id="search_Div">
			<input type="text" id="search" name="search" placeholder="상품명, #해시태그, @상점명 입력">
		</div>
		
	</div>
	
	<div id="container" style="border:3px solid black">	<!-- 세주,유라,승은파트 -->
		<div id="slide" style="height:100px; border:2px solid red">인기 카테고리 슬라이드 영역</div>
		<div id="selection" style="width: 800px; border:3px solid pink">
		최근 상품 게시판 영역
		
		</div>
		
		<div id="aside" style="border:3px solid black">
		찜, 피망톡, 최근 본 상품

		</div>
	</div>
	
	<div id="footer" style="border:1px solid blue">
	푸터
	</div>
</div>
</body>
</html>