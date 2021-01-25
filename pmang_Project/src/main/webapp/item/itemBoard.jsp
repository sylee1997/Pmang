<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


html, body, div {
	margin: 0px;
    padding: 0px;
    border: 0px;
	
}

/* 전체를 감싸주는 div */
#catagoryClick {
	width : 1024px;
	background-color: rgb(249, 249, 249);
	padding-top: 30px;
}

/* select01 */


/* 카테고리 바 영역 */
.categoryDiv {
	display : flex;
}

.home {
	margin: 6px 1px;
	display: flex;
	float : left;
	font-size: 12px;
	align-items: center;
}

.firstCategory, .secondCategory, .thirdCategory {
	align-items: center;
	position: relative;
	display: flex;
}

.selectItem1, .selectItem2, .selectItem3 {
    border: 1px solid rgb(238, 238, 238);
    display: flex;
    width: 190px;
    max-width : 200px;
    height: 28px;
    align-items: center;
    position: relative;
    font-size: 12px;
    color: rgb(77, 77, 77);
    background: rgb(255, 255, 255);
}

.firstCategory > img, .secondCategory > img, .thirdCategory > img  {
	margin: 0px 10px;
}

 .select1, .select2, .select3 {
	color : red;
} 

.top1, .top2, .top3 {
	display: flex;
    align-items: center;
    padding: 0px 25px 0px 10px;
    position: relative;
    width: 100%;
}

.top1 img, .top2 img, .top3 img {
	position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
}


.down1, .down2, .down3 {
	position: absolute;
    top: 27px;
    left: -1px;
    /* width: calc(100% + 2px); */
    width : 100%;
    background: rgb(255, 255, 255);
    max-height: 300px;
    overflow-y: auto;
    z-index: 1;
    border-left: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    display: none;
}

.down1 a, .down2 a, .down3 a  {
	/* width: 100%; */
    height: 28px;
    padding: 0px 10px;
    display: flex;
    align-items: center;
}

.down1 a:hover, .down2 a:hover, .down3 a:hover  {
	color: red;
}


/* 아이템 클릭 영역 */
.detailItemDiv {
	margin-top: 20px;
    /* height: 244px; */
    transition: height 0.3s ease-in-out 0s;
    overflow: hidden;
}

.detailItem {
	width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.detailItem div {
	width: 204px;
    height: 48px;
    margin-bottom: 1px;
}

.detailItem div a {
	margin : 0;
	padding: 0;
	width: 100%;
    height: 100%;
    background: rgb(255, 255, 255);
    font-size: 12px;
    align-items: center;
    display: flex;
    padding: 0px 20px;
    box-shadow: rgb(238, 238, 238) 0px 1px 0px 0px;
}

.entireView {
	width: 204px; height: 48px;
    margin-bottom: 1px;
    background: rgb(255, 255, 255);
    box-shadow: rgb(238, 238, 238) 0px 1px 0px 0px;
    padding: 0px 20px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 12px;
    font-weight: 500;
}

*, ::before, ::after {
    box-sizing: border-box;
}

a {
	text-decoration: none;
	color: rgb(33, 33, 33);
}





/* selection02 */


.locationSearch {
	width: 100%;
    max-width: 76.8rem;
    display: inline-block;
    padding: 0px 10px 10px 10px;
    margin: 0 auto;
    text-align: left;
}

.locationSpan {
	font-size: 15px;
    font-weight: 700;
    color: #2e2e2e;
    display: flex;
    width: 300px;
    cursor: pointer;
    align-items: center;
}

.locationSpan:before {
	content: "";
    display: inline-block;
    vertical-align: middle;
    width: 1.5rem;
    height: 1.3rem;
    background: url(//yaimg.yanolja.com/joy/sunny/static/images/ico-position-pink.svg) no-repeat;
}

.locationSpan img {
    margin: 0 auto;
}


#selection {
    margin: auto;
    padding: 3.5rem 0px 1.5rem;
}

.selection1{
    position: relative;
    overflow: hidden;
}

.selection3{
    display: flex;
    flex-wrap: wrap;
}

/* 게시물 */
.itemFrame:nth-child(5n) {
    margin-right: 0px;
}

.itemFrame {
    width: 196px;
    margin-right: 11px;
    margin-bottom: 11px;
    background: rgb(255, 255, 255);
}

.itemLink {
    border: 1px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    display: block;
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
    background-color: transparent;
}

.itemImageArea {
    position: relative;
    width: 100%;
    height: 194px;
}


.itemImageArea>img {
   vertical-align: bottom;
   border-style: none;
}

.imageAreaDiv {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
}

.itemContent {
    padding: 15px 10px;
    height: 80px;
}

.itemName {
    position: relative;
    font-size: 14px;
    padding-bottom: 20px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.itemPriceAndTime {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    height: 20px;
}

.itemPrice {
    font-size: 16px;
    font-weight: 600;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.itemTime {
    font-size: 12px;
    color: rgb(136, 136, 136);
}

h2 {
    margin: 50px 0px 25px;
}

.itemLocation {
	height: 40px;
    border-top: 1px solid rgb(238, 238, 238);
    font-size: 12px;
    display: block;
    padding: 14px 10px 14px 35px;
    color: rgb(102, 102, 102);
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    position: relative;
}

.itemLocation img {
	position: absolute;
    left: 10px;
    top: calc(50% - 8px);

}




/* 위치 모달 */
.locationModal { /* background */
	display: none;
	position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.locationModalContent {
	background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    width: 50%;
    min-width: 1024px;
    border-radius: 20px;
    height: 130px;
}

.locationModal_header {
	position : absolute;
	width: 100%;
	margin-top : -20px;
}

#x {
	position : relative;
	font-size : 30pt;
	cursor: pointer;
}


.locationModal_section{
	width: 100%;
	 margin: 0 auto;
}

.locationModal_section ul {
	overflow: auto;
	padding-left: 30px;
	padding: 2% 5% 0% 15%;
	margin: 0 auto;
}

.locationModal_section ul li {
	display: flex;
    flex-wrap: wrap;
    list-style: none;
    float: left;
    width: 30%;
    height: 50px;
    cursor: pointer;
    margin: 0px 5px;
    align-items: center;
}

.locationModal_section ul li img{
	width: 20px;
    height: 20px;
}


.locationModal_section ul li:hover {
	background: rgba(0,0,0,0.1);
}

.locationModal_section a {
	padding: 0.3rem 0.5rem;
	text-align: center;
}


</style>
</head>
<body>
<input type="hidden" id="lon">
<input type="hidden" id="lat">

<div id="catagoryClick">
	<div id="locationModal" class="locationModal">
		<div class="locationModalContent">
			<div class="locationModal_header">
				<span id="x">x</span> 
			</div>
			<div class="locationModal_section">
				<ul>
					<li><img src="../image/searchLocation.png"><a id="gpsBtn" href="#">현위치로 검색</a></li>
					<li><img src="../image/appointLocation.png"><a id="mainLocBtn" href="#">주요위치로 검색</a></li>
					<li><img src="../image/mapSearch.png"><a id="mapBtn" href="#">지도로 위치 검색</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	
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
	
	<div class="selection02">
		<h2>찾으시는 상품</h2>
            
		<div class="locationSearch">
			<span class="locationSpan">
			<div class="detailAddr">위치검색</div>
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
			 width="6" height="10" alt="카테고리 선택그룹 아이콘">
			</span>
		</div>
            
            <div class="selection1">
               <div class="selection2">
                  <div class="selection3">
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                           <div class="itemLocation">
                               <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
                                 	 width="15" height="17" alt="위치 아이콘">
                                 	 전국
                          </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     
                  </div><!-- selection3 -->
               </div><!-- selection2 -->
            </div><!-- selection1 -->
	
	</div>
</div>
</body>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26152d095dcbd98e75d86172615ba45b&libraries=services"></script>
<script type="text/javascript">
<!-- 카테고리 펼쳐지는 부분 -->
$('.selectItem1').hover(function(){
	$('.down1').css('display', 'block')
},
function(){
	$('.down1').css('display', 'none')
});

$('.selectItem2').hover(function(){
	$('.down2').css('display', 'block')
},
function(){
	$('.down2').css('display', 'none')
});

$('.selectItem3').hover(function(){
	$('.down3').css('display', 'block')
},
function(){
	$('.down3').css('display', 'none')
});

/* down color 입히기 */
for(var i=1; i<4; i++){
	for(var j=0; j<$('.down'+i).children().length; j++){
		if($('.down'+i).children().eq(j).text().trim() == $('.top'+i).text().trim()){
			//$('.down'+i).children().eq(j).css('color', 'red');
			$('.down'+i).children().eq(j).addClass('select'+i);
		}
	}	
};


/* var firstCategory = ['패션', '디지털/가전', '도서/티켓', '리빙용품', '스포츠/레저', '뷰티/미용', '유아/출산', '기타', '커뮤니티' ] */
/*  secondCategory 종류  */
var fashion = ['여성의류', '남성의류', '패션잡화', ''];
	var women = ['아우터','티셔츠','니트','셔츠/블라우스','맨투맨/후드집업','원피스/세트','바지','스커트',''];
	var men = ['아우터','티셔츠','니트','셔츠','맨투맨/후드집업','바지','','',''];
	var goods = ['가방','신발','액세서리','시계','모자','','','',''];

var digital = ['모바일', '가전제품', '음반/영상기기', '컴퓨터/주변기기', '카메라', '게임', '', '', ''];
	var mobile = ['스마트폰', '태블릿', '액세서리/주변기기',''];
	var home = ['소형가전(밥솥/다리미)', '대형가전(냉장고/세탁기/TV)', '미용가전', '사무용품(복사기/팩스)'];
	var music = ['음향기기','비디오/프로젝터','CD/DVD/음반',''];
	var pc = ['데스크탑', '키보드/마우스', '모니터', 'CPU/메인보드/메모리/HDD/SDD', '노트북/넷북', '기타 액세서리(잉크,쿨러,케이블,USB)','','',''];
	var camera = ['DSLR/미러리스','필름카메라','디지털 카메라','기타 액세서리(메모리/렌즈/필름)'];
	var game = ['pc게임', '콘솔 게임(닌텐도/플스)', '게임 타이틀',''];
var book = ['도서', '티켓', '', ''];
	var read = ['학습/사전/참고서', '만화/아동', '인문/교양/소설', '경영/경제/사회', '과학/컴퓨터/인터넷','예술/디자인','기타 도서(여행/취미/건강)','',''];
	var ticket = ['기프티콘/쿠폰/상품권','예매권/항공권','',''];
var living = ['생활용품', '가구', '주방용품', ''];
	var daily = ['문구/학습', '침구', '욕실',''];
	var furniture = ['거실가구(쇼파/테이블)', '생활가구(침대/화장대)', '사무용가구(책상/의자)', '인테리어 소품'];
	var kitchen = ['식기세트','냄비/프라이팬','조리도구','수저/커트러리','컵/잔/텀블러', '주방 잡화','밀폐용기','커피용품',''];
var sports = ['실내', '실외', '', ''];
	var indoor = ['헬스','요가','골프','수영'];
	var out = ['축구', '야구', '농구','자전거/킥보드','등산','낚시/캠핑','','',''];
var beauty = ['스킨케어', '메이크업', '헤어/바디', '향수/아로마', '네일아트/케어', '뷰티소품','','',''];
	var skin = ['클렌칭/스크럽','스킨/토너/미스트','로션/에멀젼','에센스/크림','팩/마스크','썬케어','','',''];
	var makeup = ['색조메이크업','베이스메이크업','',''];
	var hair = ['샴푸/린스/트리트먼트','헤어스타일링','바티클렌저/로션','헤어/핸드/풋케어'];
	var perfume = ['여성향수','남성향수','공용향수',''];
	var nailArt = ['네일아트/스티커','매니큐어/페디큐어','네일케어도구'];
	var beautyTool = ['브러시/퍼프','파우치/정리함','거울',''];
var child = ['영아의류(-2세)', '여아의류(3-6세)', '남아의류(3-6세)', '육아잡화', '동화책/완구/인형/장난감','','','',''];
	var baby = ['상의', '하의', '기타',''];
	var girl = ['원피스/셋트', '아우터(니트,점퍼,코트)','상하의','티셔츠','바지','치마','','',''];
	var boy = ['아우터','상하의','티셔츠','바지','남방','','','',''];
	var babygoods = ['신발','모자','가방','양말'];
	var fairy = ['인형','교육/완구','장난감','물놀이도구','놀이터도구','','','',''];
var others = ['피망나눔','차량,오토바이', '기타',''];


$(document).ready(function(){
	//위치 검색
	if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	var lat = position.coords.latitude; //위도
		    	var lon = position.coords.longitude; //경도
		      	$('#lat').val(lat);
		    	$('#lon').val(lon);
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
	//처음 카테고리 창 구현
	$('.secondCategory').hide();
	$('.thirdCategory').hide();
	//alert($('.select1').text());
	if($('.select1').text() == '패션'){
		for(var i = 0; i < fashion.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select1').text() == '디지털/가전'){
		for(var i = 0; i < disital.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select1').text() == '도서/티켓'){
		for(var i = 0; i < book.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + book[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '리빙용품'){
		for(var i = 0; i < living.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + living[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '스포츠/레저'){
		for(var i = 0; i < sports.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + sports[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '뷰티/미용'){
		for(var i = 0; i < beauty.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + beauty[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '유아/출산'){
		for(var i = 0; i < child.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + child[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select1').text() == '기타'){
		for(var i = 0; i < others.length; i++){
			var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + others[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}
});


$('.selectItem1').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	//alert($(this).text())
	$('.select1').removeClass('select1');
	$(this).addClass('select1');
	$('.top1').html($(this).text() + img);
	
	$('.detailItem').show();
	//$('.top2').text('');
	$('.detailItemList1').remove();
	$('.detailItemList2').remove();
	$('.detailItemList3').remove();
	$('.secondCategory').hide();
	$('.thirdCategory').hide();
	
	/* if($('.top2').text().trim().length){
		//alert($('.top2').text())
	}else{
		alert('secondCategory없음')
		$('.detailItem').show();
	} */
	 

	
	 if($('.select1').text() == '패션'|| $(this).text() == '패션'){
			for(var i = 0; i < fashion.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + fashion[i] + '</a></div>');
				$('.detailItem').append(div);
			}		
		}else if($('.select1').text() == '디지털/가전' || $(this).text() == '디지털/가전'){
			for(var i = 0; i < digital.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + digital[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '도서/티켓' || $(this).text() == '도서/티켓'){
			for(var i = 0; i < book.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + book[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '리빙용품' || $(this).text() == '리빙용품'){
			for(var i = 0; i < living.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + living[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '스포츠/레저' || $(this).text() == '스포츠/레저'){
			for(var i = 0; i < sports.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + sports[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '뷰티/미용' || $(this).text() == '뷰티/미용'){
			for(var i = 0; i < beauty.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + beauty[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '유아/출산' || $(this).text() == '유아/출산'){
			for(var i = 0; i < child.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + child[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}else if($('.select1').text() == '기타' || $(this).text() == '기타'){
			for(var i = 0; i < others.length; i++){
				var div = $('<div class = "detailItemList1" id="detailItemList' + i +'"><a href="#">' + others[i] + '</a></div>');
				$('.detailItem').append(div);
			}
		}
		
		
});


 $('.detailItem').on('click', '.detailItemList1', function(){
  if($(this).children('a').text() != ''){
	var down2 = new Array();
	for(var i = 0; i < $('.detailItem').children('div').length; i++){
		//alert($('#detailItemList'+i).text())
		down2[i] = $('#detailItemList'+i).text();
	}
	
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.secondCategory').show();
	$('.detailItemList1').remove();
	$('.down2').empty();
	$('.top2').html($(this).text() + img);
	
	for(var i = 0; i < down2.length; i++){
		if(down2[i] != ""){
			$('.down2').append('<a href="#">'+down2[i]+'</a>');	
		}
	} 
	
	
	for(var i=0; i<$('.down2').children().length; i++){
		if($('.down2').children().eq(i).text().trim() == $(this).children('a').text()){
			$('.down2').children().eq(i).addClass('select2');
		}
	}
	
	if($(this).text() == '여성의류'){
		for(var i = 0; i < women.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + women[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($(this).text() == '남성의류'){
		for(var i = 0; i < men.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + men[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '패션잡화'){
		for(var i = 0; i < goods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + goods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '모바일'){
		for(var i = 0; i < mobile.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + mobile[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '가전제품'){
		for(var i = 0; i < home.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + home[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '음반/영상기기'){
		for(var i = 0; i < music.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + music[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '컴퓨터/주변기기'){
		for(var i = 0; i < pc.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + pc[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '카메라'){
		for(var i = 0; i < camera.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + camera[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '게임'){
		for(var i = 0; i < game.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + game[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '도서'){
		for(var i = 0; i < read.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + read[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '티켓'){
		for(var i = 0; i < ticket.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + ticket[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '생활용품'){
		for(var i = 0; i < daily.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + daily[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '가구'){
		for(var i = 0; i < furniture.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + furniture[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '주방용품'){
		for(var i = 0; i < kitchen.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + kitchen[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '실내'){
		for(var i = 0; i < indoor.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + indoor[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '실외'){
		for(var i = 0; i < out.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + out[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '스킨케어'){
		for(var i = 0; i < skin.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + skin[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '메이크업'){
		for(var i = 0; i < makeup.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + makeup[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '헤어/바디'){
		for(var i = 0; i < hair.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + hair[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '향수/아로마'){
		for(var i = 0; i < perfume.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + perfume[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '네일아트/케어'){
		for(var i = 0; i < nailArt.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + nailArt[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '뷰티소품'){
		for(var i = 0; i < beautyTool.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + beautyTool[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '영아의류(-2세)'){
		for(var i = 0; i < baby.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + baby[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '여아의류(3-6세)'){
		for(var i = 0; i < girl.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + girl[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '남아의류(3-6세)'){
		for(var i = 0; i < boy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + boy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '육아잡화'){
		for(var i = 0; i < babygoods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + babygoods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($(this).text() == '동화책/완구/인형/장난감'){
		for(var i = 0; i < fairy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + fairy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}
  }
});


$('.selectItem2').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select2').removeClass('select2');
	$(this).addClass('select2');
	$('.top2').html($(this).text() + img);
	
	
	//$('.top2').text('');
	$('.detailItemList1').remove();
	$('.detailItemList2').remove();
	$('.detailItemList3').remove();
	$('.thirdCategory').hide();
	$('.detailItem').show();
	
	if($('.select2').text() == '여성의류' || $(this).text() == '여성의류'){
		for(var i = 0; i < women.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + women[i] + '</a></div>');
			$('.detailItem').append(div);
		}		
	}else if($('.select2').text() == '남성의류' || $(this).text() == '남성의류'){
		for(var i = 0; i < men.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + men[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '패션잡화' || $(this).text() == '패션잡화'){
		for(var i = 0; i < goods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + goods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '모바일' || $(this).text() == '모바일'){
		for(var i = 0; i < mobile.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + mobile[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '가전제품' || $(this).text() == '가전제품'){
		for(var i = 0; i < home.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + home[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '음반/영상기기' || $(this).text() == '음반/영상기기'){
		for(var i = 0; i < music.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + music[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '컴퓨터/주변기기' || $(this).text() == '컴퓨터/주변기기'){
		for(var i = 0; i < pc.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + pc[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '카메라' || $(this).text() == '카메라'){
		for(var i = 0; i < camera.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + camera[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '게임' || $(this).text() == '게임'){
		for(var i = 0; i < game.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + game[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '도서' || $(this).text() == '도서'){
		for(var i = 0; i < read.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + read[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '티켓' || $(this).text() == '티켓'){
		for(var i = 0; i < ticket.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + ticket[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '생활용품' || $(this).text() == '생활용품'){
		for(var i = 0; i < daily.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + daily[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '가구' || $(this).text() == '가구'){
		for(var i = 0; i < furniture.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + furniture[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '주방용품' || $(this).text() == '주방용품'){
		for(var i = 0; i < kitchen.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + kitchen[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '실내' || $(this).text() == '실내'){
		for(var i = 0; i < indoor.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + indoor[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '실외' || $(this).text() == '실외'){
		for(var i = 0; i < out.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + out[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '스킨케어' || $(this).text() == '스킨케어'){
		for(var i = 0; i < skin.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + skin[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '메이크업' || $(this).text() == '메이크업'){
		for(var i = 0; i < makeup.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + makeup[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '헤어/바디' || $(this).text() == '헤어/바디'){
		for(var i = 0; i < hair.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + hair[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '향수/아로마' || $(this).text() == '향수/아로마'){
		for(var i = 0; i < perfume.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + perfume[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '네일아트/케어' || $(this).text() == '네일아트/케어'){
		for(var i = 0; i < nailArt.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + nailArt[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '뷰티소품' || $(this).text() == '뷰티소품'){
		for(var i = 0; i < beautyTool.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + beautyTool[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '영아의류(-2세)' || $(this).text() == '영아의류(-2세)'){
		for(var i = 0; i < baby.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + baby[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '여아의류(3-6세)' || $(this).text() == '여아의류(3-6세)'){
		for(var i = 0; i < girl.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + girl[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '남아의류(3-6세)' || $(this).text() == '남아의류(3-6세)'){
		for(var i = 0; i < boy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + boy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '육아잡화' || $(this).text() == '육아잡화'){
		for(var i = 0; i < babygoods.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + babygoods[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	}else if($('.select2').text() == '동화책/완구/인형/장난감' || $(this).text() == '동화책/완구/인형/장난감'){
		for(var i = 0; i < fairy.length; i++){
			var div = $('<div class = "detailItemList2" id="detailItemList' + i +'"><a href="#">' + fairy[i] + '</a></div>');
			$('.detailItem').append(div);
		}
	} 
});

$('.detailItem').on('click', '.detailItemList2', function(){
	if($(this).children('a').text() != ''){
		var down3 = new Array();
		for(var i = 0; i < $('.detailItem').children('div').length; i++){
			//alert($('#detailItemList'+i).text())
			down3[i] = $('#detailItemList'+i).text();
		}
		
		var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
		$('.thirdCategory').show();
		$('.detailItemList2').remove();
		$('.down3').empty();
		$('.top3').html($(this).text() + img);
		$('.detailItem').hide();
		
		for(var i = 0; i < down3.length; i++){
			if(down3[i] != ""){
				$('.down3').append('<a href="#">'+down3[i]+'</a>');	
			}
		} 
		
		
		for(var i=0; i<$('.down3').children().length; i++){
			if($('.down3').children().eq(i).text().trim() == $(this).children('a').text()){
				$('.down3').children().eq(i).addClass('select3');
			}
		}
	}
});

$('.selectItem3').on('click', 'a', function(){
	var img = '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAOCAYAAAAvxDzwAAAAAXNSR0IArs4c6QAAASVJREFUOBGlks9qwkAQxrMLihRKQXyUHjx58dBLEXqxUPCavIKvkpCQgxcTD0LpSQQfoBfpRXwHj16av37fYWWrJhvqwDCbb2d+O5NdYcFc120hzIQQkW3bS2pNzPf9blEUC+ROUffNGkEYQWVZvuE7xfq9CRR1T8hfw5/hR/jIcZyN8DyPsDEEZUZoEASPeZ6vUNdXRYi/aOZVYjGHp9pGC4kRDmLHV4bOHrIs+7qAWYDtoW0lx+OYqDRCwzDsIO8TPtBPQv0PYEOMfGCHVhNoHMftJEl4YcMqGHWhb3JMjguNt64slVJOoH/AR0pk1DtT+h8gxQqoyj/HWzBuXgEpmqBVsEpgHbQOVgu8BTXBjEAdCthOPQ3qdxn+6QsedO8uyH+LT8nvvwPGjeHzAAAAAElFTkSuQmCC" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select3').removeClass('select3');
	$(this).addClass('select3');
	$('.top3').html($(this).text() + img);
		
});



/* 위치 모달 */
$('.locationSearch').click(function(){
	 $('.locationModal').css('display','block'); 
});

$('#x').click(function(){
	$('.locationModal').css('display','none');
});

$(document).click(function(e){
	if($('.locationModal').is(e.target)){
		$('.locationModal').css('display','none'); 
	}
}); 


/* 위치 검색 */

$('#gpsBtn').click(function(){
	 var position = new daum.maps.LatLng($('#lat').val(), $('#lon').val()); 
	 
	 searchDetailAddrFromCoords(position, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	          
	            var detailAddr = result[0].address.address_name;
	           
	            $('.detailAddr').html(detailAddr);
	            $('.locationModal').css('display','none');
	        }   
	    });
	 
});


$('#mainLocBtn').click(function(){
	  window.open("mainLoc.jsp", "주요위치", "width=1024, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
});

$('#mapBtn').click(function(){
	  window.open("map.jsp?lon=" + $('#lon').val() + "&lat=" + $('#lat').val(), "지도띄우기", "width=1000, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes,left=500, top=100");
});


function searchDetailAddrFromCoords(coords, callback) {
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}







</script>
</html>