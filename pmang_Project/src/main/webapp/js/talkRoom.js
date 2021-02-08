$(document).ready(function() {
   sock = new SockJS('/pmang/talk-ws');//나중에 혹시 안되면 "ws://192.168.8.32:8080/SpringWeb/chat-ws" 나중에 주소적을때 이런 양식으로.
   
   sock.onopen = function() {
      console.log('open');
   };
   sock.onmessage = function(e) {
      var data = e.data;
      console.log(data)
      console.log("e - " + e)
      var obj = JSON.parse(data)
      console.log(obj)
      appendMaessge(obj.talk_content);

   };
   sock.onclose = function() {
      appendMessage("연결을 끊었습니다.");
      console.log('close');
   };
   
   
   // 메세지 보내기
   $('#sendBtn').click(function() {
     /*var msg = $.trim($('#talk_message').val());
     alert(msg);
     alert($('#talk_message').val());*/
     var msg = $('#talk_message').val();
     if(msg != ""){
        message = {
        		sender_user_id : $('#sender_user_id').val(),
                receiver_user_id : $('#receiver_user_id').val(),
                talk_content : $('#talk_message').val(),
                receiver_user_profileImage : $('#receiver_user_profileImage').val(),
                item_seq : $('#item_seq').val()
        }
        sock.send(JSON.stringify(message));
        $('#talk_message').val('');
     }
   });

   
   $('#talk_message').keypress(function(e){
        if ( e.which == 13 ) {
            $('#sendBtn').click();
            return false;
        }
   });

   function appendMaessge(talk_content) {
      var talk_content = talk_content;

      var talkDate = '오늘날짜가들어감';
      var profileImg = '이미지주소가 들어감';
      var talkTime = "asdf";
      var talkRead = '안읽음';

      // 상단날짜div
      var talkDateDiv = $('<div />', {
         class : 'talkDateDiv'
      });
      // 상단날짜 들어가는 div
      var talkDate = $('<div />', {
         class : 'talkDate',
         align : 'center',
         text : talkDate
      });

      // 받은메세지
      var talkReciveDiv = $('<div />', {
         class : 'talkReciveDiv'
      });
      // 받은 메세지 말풍선+내용
      var talkReciveTooltip = $('<div />', {
         class : 'talkReciveTooltip',
      }).append($('<div />', {
         class : 'talkReciveContent',
         text : talk_content
      }));
      // 프로필 사진
      var talkReciveProfile = $('<div />', {
         class : 'talkReciveProfile'
      }).append($('<img />', {
         class : 'profileImg',
         src : 'pmang/image/'+$('#receiver_pf_Photo'),
         alt : '프로필이미지',
         width : '36',
         height : '36'
      }));
      // 받은메세지 시간
      var talkReciveTime = $('<div />', {
         class : 'talkReciveTime',
         text : talkTime
      });

      // 보낸메세지div
      var talkSendDiv = $('<div />', {
         class : 'talkSendDiv',
      });
      // 보낸메세지 말풍선+내용
      var talkSendTooltip = $('<div />', {
         class : 'talkSendTooltip'
      }).append($('<div />', {
         class : 'talkSendContent',
         text : talk_content
      }));
      // 보낸메세지 시간
      var talkSendTime = $('<div />', {
         class : 'talkSendTime',
         text : talkTime
      });
      // 보낸메세지 읽음 확인
      var readCheck = $('<div />', {
         class : 'readCheck',
         text : '안읽음'
      });
      
      
      
      $('#talkContentDiv').append($('<div />', {
         class : 'talkSendDiv'
      }).append(talkSendTooltip));
      
      //스크롤
      $("#talkContentDiv").scrollTop(document.body.scrollHeight)
      
/*      $('#talkContentDiv').append($('<div />', {
         class : 'talkRecieveDiv',
      }).append(talkRecieveTooltip));*/
/*
      var chatAreaHeight = $('.talkSendDiv').height();
      var maxScroll = $("#talkContentDiv").height()-chatAreaHeight;
      $("#talkContentDiv").scrollTop(maxScroll);*/



      
      // 1. 메세지가 하루 중 처음 온것인지 아닌지

      // 2. 메세지가 보낸건지 받은건지

      // 2-1. 메세지를 보낸거라면 메세지를 읽었는지 안읽었는지

      // 2-2. 메세지를 받은거라면 system시간 기준 1분 사이에 처음 보낸 메세지인지 마지막에 보낸메세지인지
   }
   // header 상점명 클릭 모달
   
   $('.talk_itemName_button').on('click', function() {
      if ($('.modal_area').is('.tem') == true) {
         $('.modal_area').removeClass('tem');
         $('.itemName_arrow').css('transform', 'rotate(180deg)');

      } else {
         $('.modal_area').addClass('tem');
         $('.itemName_arrow').css('transform', 'rotate(0deg)');
      }

      $('.modalDiv').toggle();/*toggle("normal")*/
      $('.room_setting_modal').hide(); 
      $('.room_setting_modal').off('scroll touchmove mousewheel');
   });
   
   
   //------------------------------------------------------------
   
   $('.talk_item_detailBtn').on('click',function(){
      $('.room_setting_modal').toggle();
      $('.modalDiv').hide(); 
      $('.modalDiv').off('scroll touchmove mousewheel');
   });
   
   //------------------------------------------------------------
   
   //모달창 닫기
   $(document).click(function(e){
      if($('.modal_area').is(e.target)){
         
         $('.modalDiv').hide(); 
         $('.modalDiv').off('scroll touchmove mousewheel');
         
      }
      
      if($('.room_setting_modal_area').is(e.target)){
         
         $('.room_setting_modal').hide(); 
         $('.room_setting_modal').off('scroll touchmove mousewheel');
         
      }
      
   });
   //------------------------------------------------------------
   
// option버튼 -----------------
   $('.message_option_Btn').on('click', function(){
      if($('.message_option_div').is('.click') == true){
         $('.message_option_div').removeClass('click');
         $('.message_option_div').css('display','none');
      }else {
         $('.message_option_div').addClass('click');
          $('.message_option_div').css('display', 'flex');
      }
   });
   
   //이미지 버튼
   $('#fileBtn').click(function(e) {
      e.preventDefault();
      $('#files').click();
   });


   
   // option버튼 끝-----------------
   //하단모달
   $('#item_choice_Btn').on('click', function() {
      $('.all_modal').addClass('on');
      $('.item_choice_nav').css('display','block');
      $('.on').click(function() {
         $('.all_modal').removeClass('on');
         $('.item_choice_nav').css('display','none');
   });
      $('.item_choice_closeBtn').click(function() {
         $('.all_modal').removeClass('on');
         $('.item_choice_nav').css('display','none');
   });
   });
   
   //하단모달끝--------------------
   
   
   //알림버튼 클릭
var sw=1;
var Notification_status=1;//상태가 변화하면 Notification_status 변수를 들고 ajax로 가서 TalkRoom 테이블의 Notification_status 값 변경.
$('.room_setting_notification_Btn').on('click',function(){
   
   if(sw == 1){
      $('.room_setting_notification_Btn').css('background-image','url(/pmang/image/notification.png)');//회색
      $('.room_setting_notification_Btn>b').text('OFF');
      Notification_status = 0;
   }else {
      $('.room_setting_notification_Btn').css('background-image','url(/pmang/image/notification_green.png)');//녹색
      $('.room_setting_notification_Btn>b').text('ON');
      Notification_status = 1;
   }
   $('.room_setting_modal').hide(); 
   $('.room_setting_modal').off('scroll touchmove mousewheel');
   sw = sw * (-1);
   
   
});
   
   
   
   
   
});