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
      console.log(obj.talk_content)
      if((obj.sender_user_id == $('#sender_user_id').val() && obj.receiver_user_id == $('#receiver_user_id').val()) || obj.receiver_user_id == $('#sender_user_id').val())
      appendMaessge(obj);
   };
   sock.onclose = function() {
      appendMessage("연결을 끊었습니다.");
      console.log('close');
   };
   
   function getTimeStamp() {
	   var d = new Date();
	   var s =
	     leadingZeros(d.getFullYear(), 4) + '-' +
	     leadingZeros(d.getMonth() + 1, 2) + '-' +
	     leadingZeros(d.getDate(), 2) + ' ' +

	     leadingZeros(d.getHours(), 2) + ':' +
	     leadingZeros(d.getMinutes(), 2) + ':' +
	     leadingZeros(d.getSeconds(), 2);

	   return s;
	 }
   
   function getTalkTime() {
	   var d = new Date();
	   var s = 
		   leadingZeros(d.getHours(), 2) + ':' +
		   leadingZeros(d.getMinutes(), 2);
	   
	   return s;
   }

	 function leadingZeros(n, digits) {
	   var zero = '';
	   n = n.toString();

	   if (n.length < digits) {
	     for (i = 0; i < digits - n.length; i++)
	       zero += '0';
	   }
	   return zero + n;
	 }
   
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

   function appendMaessge(obj) {
      var talk_content = obj.talk_content;

      var talkDate = getTimeStamp();
      var profileImg = '/pmang/image/'+$('#receiver_user_profileImage').val();
      var talkTime = getTalkTime();
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
         src : profileImg,
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
         class : 'talkSendDiv'
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
      
      // 메세지가 하루 중 처음 온것인지 아닌지
      // DB 가서 메세지중 오늘(ex) 8일) 보낸 데이터를 count 하여 0 이면 메시지 append 전에 오늘날짜를 뿌림.
      $('#talkContentDiv').append($('<div />',{
    	  class : 'talkDateDiv'
      }).append(talkDate));
      
      // 송신자/수신자 구분
      
      //talkSendTime 을 append 하는 것은 새로운 메시지를 append 하기 전에, 기존 데이터의 분과 같은 분에 보낸 메세지라면,
      //이전 append 를 삭제해줘야함.
      
      //우석생각 - 방법 1
      if($('#talkContentDiv').last().prop('className') == 'talkSendDiv'){//#talkContentDiv 의 마지막 자식의 클래스네임이 talkSendDiv라면,
    	  
    	  let currentMinute = talkDate.split(":");
    	  let beforeMinute = $('#talkContentDiv').last().children('.talkSendTime').text().split(":");
    	  
    	  alert(currentMinute[0])//시간
    	  alert(currentMinute[1])//분
    	  
    	  alert(beforeMinute[0])
    	  alert(beforeMinute[1])
    	  
    	  if(currentMinute[1] == beforeMinute[1]){
    		  $('#talkContentDiv').last().children('.talkSendTime').text('');
    	  }
      } 
      
      //방법 2 append(talkSendTime) 을 따로 빼서, 이전 talkSendTime 에는 '' 을넣어주고, liastchild 에만 
      //text() 에 talkTime 를 찍어준다.
      
      
    	  
      
      
      //송신자 
      if((obj.sender_user_id == $('#sender_user_id').val() && obj.receiver_user_id == $('#receiver_user_id').val())){
    	  
    	  $('#talkContentDiv').append($('<div />', {
    		  class : 'talkSendDiv'
    	  }).append(talkSendTime).append(talkSendTooltip));
      }
      
      //수신자
      if(obj.receiver_user_id == $('#sender_user_id').val()){
    	  
    	  $('#talkContentDiv').append($('<div />', {
    	         class : 'talkRecieveDiv',
    	   }).append(talkRecieveTooltip).append(talkSendTime));
      }
      
      
      //스크롤
      $("#talkContentDiv").scrollTop(document.body.scrollHeight)
      

/*
      var chatAreaHeight = $('.talkSendDiv').height();
      var maxScroll = $("#talkContentDiv").height()-chatAreaHeight;
      $("#talkContentDiv").scrollTop(maxScroll);*/



      
      

      

      // 2-1. 메세지를 보낸거라면 메세지를 읽었는지 안읽었는지

      //2-2 메세지를 받은거라면 system시간 기준 1분 사이에 처음 보낸 메세지인지 마지막에 보낸메세지인지
      
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