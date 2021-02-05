$(document).ready(function() {

   sock = new SockJS('/pmang/talk');
   sock.onopen = function() {
      console.log('open');
   };
   sock.onmessage = function(e) {
      var data = e.data;
      console.log(data)
      console.log("e - " + e)
      var obj = JSON.parse(data)
      console.log(obj)
      appendMaessge(obj.message_content);

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
			message_content : $('#talk_message').val(),
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

   function appendMaessge(messageContent) {
      var messageContent = messageContent;

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
         text : messageContent
      }));
      // 프로필 사진
      var talkReciveProfile = $('<div />', {
         class : 'talkReciveProfile'
      }).append($('<img />', {
         class : 'profileImg',
         src : '../image/profileimg.png',
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
         text : messageContent
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
   // header 상점명 클릭
   $('.talk_itemName_button').on('click', function() {
      if ($('.header_modal').is('.on') == true) {
         $('.header_modal').removeClass('on');
         $('.itemName_arrow').css('transform', 'rotate(180deg)');

      } else {
         $('.header_modal').addClass('on');
         $('.itemName_arrow').css('transform', 'rotate(0deg)');
      }
   });
   // header 기타버튼 클릭

});