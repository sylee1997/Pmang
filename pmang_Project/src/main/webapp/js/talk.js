$(document).ready(function() {
	
	
	
	
   //톡주고받기 받는 데이터
   //메세지받은건지or보낸건지
   //메세지내용
   //메세지타임
   //메세지 읽은 타임
   //유저 아이디
   //튜터유저아이디??
   //클래스 아이디 - 이걸로 톡방구분
   
   //조건
   //하루 중 처음 보낸 메세지엔 상단에 그날 날짜가 뜨도록함
   //DB에서 시스템시간상 날짜가 바뀌
   
   //받은톡에서 1분단위로 처음보낸 메세지엔 프로필사진이 붙고 아니면 가려지도록함
   
   
   //받은톡, 보낸톡에서 1분단위로 마지막에 보낸 메세지엔 보낸시간이 붙도록함
   
   //상대방이 내 메세지를 읽지 않은 상태에서 안읽음이 뜨도록 함
   //DB
   
   //일단 메세지 가 보이도록함
   
   //상단 날짜가 뜨는div
   
   
   
   $('#test').on('click', (function() {
      var messageContent = ('메세지내용이 들어감');
      
      var talkDate = '오늘날짜가들어감';
      var profileImg = '이미지주소가 들어감';
      var talkTime= '시간이들어감';
      var talkRead= '안읽음';
      
      
      //상단날짜div
      var talkDateDiv = $('<div />', {
         class: 'talkDateDiv'
      }).append($('<div />', {
         class: 'talkDate',
         align: 'center',
         text: talkDate
      }));
      var talkReciveTooltip = $('<div />', {
         class: 'talkReciveTooltip',
      }).append($('<div />', {
            class: 'talkReciveContent',
            text: messageContent
      }));
      
      var talkSendTooltip = $('<div />', {
         class: 'talkSendTooltip'
      }).append($('<div />', {
            class: 'talkReciveContent',
            text: messageContent
   }));
      
      //날짜가 같이 붙음
      $('#talkContentDiv').append(talkDateDiv);
      //받은메세지
      $('#talkContentDiv').append(talkReciveTooltip);
      //보낸메세지
      $('#talkContentDiv').append(talkSendTooltip);
   }));
   
});