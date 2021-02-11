<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pmang/css/talkRoom.css">
</head>
<body>

<input type="hidden" id="item_seq" value="${param.item_seq }">
<input type="hidden" id="sender_user_id" value="${sessionScope.userId }">
<input type="hidden" id="receiver_user_id" value="${sellerItem.partner_userId }">
<input type="hidden" id="receiver_user_profileImage" value="${sellerItem.pf_Photo }">
<%-- <input type="hidden" id="roomkey" value="${roomkey }"> --%>

<div id="root">
   <div>
         <div class="room_setting_modal">
            <div class="room_setting_modal_area"></div>
            <div class="room_setting_content">
               <button class="room_setting_notification_Btn">
               알림
               <b>ON</b>
               </button>
               
               <button class="room_setting_report">신고</button>
               <button class="room_setting_reportCheck">신고조회</button>
               <button class="room_setting_cutOff">차단</button>
               <button class="room_setting_out">나가기</button>
            </div>
         </div>
         <!-- 여기부터 -->
      <div class="modalDiv">
         <div class="header_modal">
         </div>
         <!-- 여기부터 하단모달 -->
         <div class="all_modal">
         </div>
         <div class="item_choice_nav">
                <div class="item_choice_div">상품선택</div><button class="item_choice_closeBtn">x</button>
                <button class="opponent_item_choice">상대방상점의 상품 선택하기</button><!-- 상대방 아이디 세션필요. -->
            <button class="my_item_choice">내상점 상품 선택하기</button>
         </div>
         <!-- 하단모달끝 -->
         
      
      
         <div class="modal_area"></div>
             <div class="modal_marketInfo_div">
            <div class="modal_marketInfo_detail_div">
               <a href="/pmang/board/mystore" class="market_info_a">
                   <div class="market_info_textDiv">상점후기</div>
                   <div class="market_review_dataArea">
                      <div class="market_review_data">
                         <img src="/pmang/image/main_logo.JPG" alt="좋아요">
                         <b>3</b> <!-- DB에서 상점후기count 불러오기 -->
                         <img src="/pmang/image/main_logo.JPG" alt="보통">
                         <b>5</b> <!-- DB에서 상점후기count 불러오기 -->
                         <img src="/pmang/image/main_logo.JPG" alt="싫어요">
                         <b>7</b> <!-- DB에서 상점후기count 불러오기 -->
                      </div>
                   </div>
               </a>
             
               <a href="내상점 - 내상품페이지" class="market_info_a">
                   <div class="market_info_textDiv">판매상품</div>
                   <div class="market_review_dataArea">
                      <b>2</b><!-- DB 에서 상품갯수 count 하기 -->
                   </div>
               </a>
               
               <!-- <button type="button" class="market_info_a">
                  <div class="market_info_textDiv">판매내역</div>
                  <div class="market_review_dataArea">
                     <b>4</b>실제 판매 거래완료 개수 카운터하기
                  </div>
               </button> --> <!-- 우리는 직거래밖에 없으니까 제거, 혹시사용하게 되면 사용할게 -->
               
               <div class="sales_details_div">
                  <div class="market_info_textDiv">판매내역</div>
                  <div class="market_review_dataArea">
                     <b>4</b>  <!-- 실제 판매 거래완료 개수 카운터하기 -->
                  </div>
               </div>
               
               <div class="contact_time_div">
                  <div class="market_info_textDiv">연락시간</div>
                  <div class="market_review_dataArea">24시간 연락가능</div>
               </div>
            </div>
            
            <div class="market_info_Btns">
               <button type="button" class="Fraud_report_Btn">사기 신고조회</button> <!-- 윈도우창 띄워줘야함 -->
               <a href="판매자상점으로 바로가기" class="seller_market_a">상점 바로가기</a> <!-- session에 판매자 상점key 기억 후, 이동? 해야하나.. -->
            </div>   
       
         </div>
      </div>
      
      
      <div class="talk_Area">
         <div class="talk_area_div">
            <header class="talk_header"><!-- class명 item이 아니라 marketName이다. 변경해라 -->
               <button type="button" class="talk_itemName_button">
                  <span class="itemName">${sellerItem.marketName }</span>
                  <span class="itemName_arrow"></span>
               </button>
               
               <div class="talk_item_detailDiv">
                  <button class="talk_item_detailBtn">
                  </button>
                  
               </div>
               <!-- 드롭다운 메뉴바 -->
               <div><!-- 상점메뉴바 -->
               </div>
               <div><!-- 기타메뉴바 -->
               </div>
            </header>
            
            <div class="talk_itemInfo">
               <a class="itemboard_move">
                  <img src="/pmang/image/${sellerItem.img1 }" alt="상품이미지" width="40px" height="40px">
                  
                  <div class="talk_itemList">
                     <div class="item_price_div">${sellerItem.item_price }
                     <small>원</small>
                     </div>
                     
                     <div class="item_subject_div">${sellerItem.item_Subject }</div>
                  </div>
               </a><!-- 클릭하면 상품 판매 게시판으로이동 -->
               <button type="button" class="price_change">가격변경</button> <!-- 판매자일때만 띄우주기 -->
            </div>
            
            <!-- 메시지창 -->
            <div id="talkContentDiv">
               <!-- <div class="talkDateDiv" >
                  <div class="talkDate" align="center">하루처음보내는 톡
                  201*.**.** *요일
                  </div>
                  <div class="talkReciveDiv">받은톡
                     <div class="talkReciveProfile">받은 톡은 상대방의 프사
                        <img src="../image/profileimg.png" width="36" height="36" alt="프로필 이미지">
                     </div>
                     <div class="talkReciveTooltip">받은 메세지 말풍선모양
                        <div class="talkReciveContent">상대방이 보낸 메세지입니다. 길이를 늘리는 중,,, 두줄 세줄 네줄 늘리는중</div>
                     </div>
                     <div class="talkReciveTime">보낸시간</div>
                  </div>
               </div>
               
               <div class="talkSendDiv">보낸톡
                  <div class="talkTimeDiv">
                     <div class="readCheck">안읽음</div>
                     <div class="talkSendTime">보낸시간</div>
                  </div>
                  <div class="talkSendTooltip">보낸메세지 말풍선모양
                     <div class="talkSendContent"> 보내기</div>
                  </div>
               </div>
               <div class="talkReciveDiv"></div>받은톡 위와 동일 -->
               <div id="talkContentScroll"></div>
         </div>

            <!-- 메시지창 -->
         <div class="talk_footer">
            <div class="talk_send_Area">
               <div class="message_option_Area">
                  <button type="button" class="message_option_Btn"></button>
               </div>
                  
               <div class="message_text_Area">
                  <form class="message_text_form">
                     <textarea placeholder="메시지를 입력하세요" class="talk_message" id="talk_message" rows="1"></textarea>
                     <input type="button" id="sendBtn" value="▲">
                  </form>
               </div>
            </div>
               
               <!-- 메세지옵션--------- -->
            <div class="message_option_div">
               <div class="sand_img_div">
                        <input type="file"  multiple name="files"  id="files" accept="image/*"  onchange="changeValue(this)"/>
                        <img alt="이미지아이콘" src="../image/014-picture.png" id="fileBtn" width="43px" height="43px" >
                  <div style="font-size: 13px;">이미지</div>
               </div>
               <div class="item_choice_div">
                  <div>
                     <img alt="상품아이콘" src="../image/035-shopping-cart.png" id="item_choice_Btn" width="50px" height="50px" >
                     <div style="font-size: 13px;">상품선택</div>
                  </div>
               </div>
            </div>
            <!-- 메세지옵션끝--------- -->
            </div>
         </div>
      </div>
      
   </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/sockjs.js"></script>
<script type="text/javascript" src="../js/talkRoom.js"></script>
</body>
</html>