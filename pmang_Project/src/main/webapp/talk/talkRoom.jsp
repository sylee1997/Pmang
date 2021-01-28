<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pmang/css/talk.css">
</head>
<body>

<div id="root">
	<div>
		<div class="talk_Area">
			<div class="talk_area_div" style="border:1px solid black;">
				<header class="talk_header">
					<button type="button" class="talk_itemName_button">
						<span class="itemName">item명 받아오기</span>
					</button>
					
					<div class="talk_item_detailDiv">
						<button class="talk_item_detailBtn">
						</button>
					</div>
				</header>
				
				<div class="talk_itemInfo" style="border:1px solid green">
					<a class="itemboard_move">
						<img src="/pmang/image/maesae.jpg" alt="상품이미지" width="40px" height="40px">
						
						<div class="talk_itemList" style="border:1px solid orange">
							<div class="item_price_div">0,000
							<small>원</small>
							</div>
							
							<div class="item_subject_div">상품명</div>
						</div>
					</a><!-- 클릭하면 상품 판매 게시판으로이동 -->
					<button type="button" class="price_change">가격변경</button> <!-- 판매자일때만 띄우주기 -->
				</div>
				
				<!-- 메시지창 -->
				<div id="talkContentDiv">
					<div class="talkDateDiv" >
						<div class="talkDate" align="center"><!-- 하루처음보내는 톡 -->
						201*.**.** *요일
						</div>
						<div class="talkReciveDiv"><!-- 받은톡 -->
							<div class="talkReciveProfile"><!-- 받은 톡은 상대방의 프사 -->
								<img src="../image/profileimg.png" width="36" height="36" alt="프로필 이미지">
							</div>
							<div class="talkReciveTooltip"><!-- 받은 메세지 말풍선모양 -->
								<div class="talkReciveContent">상대방이 보낸 메세지입니다. 길이를 늘리는 중,,, 두줄 세줄 네줄 늘리는중</div>
							</div>
							<div class="talkReciveTime">보낸시간</div>
						</div>
					</div>
				   
					<div class="talkSendDiv"><!-- 보낸톡 -->
						<div class="talkTimeDiv">
							<div>안읽음</div>
							<div class="talkSendTime">보낸시간</div>
						</div>
						<div class="talkSendTooltip"><!-- 보낸메세지 말풍선모양 -->
							<div class="talkSendContent"> 보내기</div>
						</div>
					</div>
					<div class="talkReciveDiv"></div><!-- 받은톡 위와 동일 -->
				</div>

				<!-- 메시지창 -->
				<div class="talk_footer">
					<div class="talk_send_Area">
						<div class="message_option_Area">
							<button type="button" class="message_option_Btn"></button>
						</div>
						
						<div class="message_text_Area">
							<form class="message_text_form">
								<textarea placeholder="메시지를 입력하세요" class="talk_message" rows="1"></textarea>
								<input type="submit" id="sendBtn" value="▶">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/talk.js"></script>
</body>
</html>