$(document).ready(function() {
   // list append
	$.ajax({
	  type: 'POST',
	  url: '/pmang/talk/getRoomList',
	  data: {
         'userId': $('#userId').val()
	  		},
	  dataType: 'json',
	  success: function(data) {
		  // data함 찍어보기용, 찍고 지우기
		  console.log(data);
         
		  	$.each(data.mapList, function(index, items) {
		  		$('#talkList').append($('<li/>', {
		  			class: 'talkRoom'
		  			}).append($('<div/>',{
		  				class: 'talkRoom_div'
		  				}).append($('<div/>', {
		  					class: 'profile_img_div'
		  					}).append($('<a/>',{
		  						class: 'profile_img_a',
		  						href: '#'
		  						}).append($('<img/>', {
		  							class: 'profile_img',
		  							alt: '프로필이미지',
		  							src: '../image/'+items.pf_photo,// 가상폴더에서 이미지
                                                // 들고와야함!
		  							height: '50', 
		  							width: '50'
		  							})// profile_img
		  						)// profile_img_a
		  					)// profile_img_div
		  				).append($('<a/>',{
		  					id: 'talkRoom_a',// 클래스 아이디에 아이디를 구분 할 수 있게 추가해야할듯,  css수정함
		  					href: '#',
		  					class: 'talkRoom_a_'+items.partner_userId
		  					}).append($('<div/>', {
		  						class: 'userName',
		  						text: items.marketname// 상대방 마켓명
		  						})// userName
		  					).append($('<div/>', {
		  						class: 'talkView',
		  						text: items.talk_content// 마지막 대화내용
		  						})// talkView
		  					)// talkRoom_a
		  				).append($('<div/>',{
		  					class: 'talkLogTime',
		  					text: items.send_time// 마지막 대화시간인데 SQL문 수정해야함
		  					})// talkLogTime
		  				).append($('<div/>').append($('<button/>', {
		  					id: 'addBtn',
		  					class: 'addBtn_'+items.partner_userId// 클래스 아이디에 아이디를
                                                // 구분 할 수 있게
                                                // 추가해야할듯그러게
                                                // 이거...어카지
		  					}).append($('<img/>', {
		  						src: '../image/addBtn.png',
		  						alr: '더보기',
		  						height: '15',
		  						width: '15'
		  						})
		  					)// addBtn
		  				))// talkRoom_div
		  			)// talkRoom
		  		)// talkList
		  			// 리스트 > 방으로
		  			$('#talkList').on('click', '#talkRoom_a', function(){
		  				window.open("/pmang/talk/talkRoom?item_seq="+items.item_seq+"&&partner_userId="+items.partner_userId,"","width=375 height=667");   
		  			});
		  			//리스트 > 차단,신고 버튼
		  			$('#talkList').on('click', '#addBtn', function(){
		  				//   alert($(this).prop('className'));
		  				$('.userName_modal').text( items.marketname);
		  				$('.all_modal').addClass('on');
		  				$('.modal_div').css('position', 'fixed');
		  				$('.modal_div').css('right', '50%');
		  				$('.modal_div').css('bottom', '50%');
		  				// 모달바탕 클릭했을때(꺼짐)
		  				$('.on').click(function() {
		  					$('.all_modal').removeClass('on');
		  					$('.modal_div').css('position', 'static');
		  				});
		  				//차단
                     
		  				//신고
                     
		  				//나가기
                     
                     
		  			});
		  	});
            
            
	  },
	  error: function(err) {
    	  console.log(err);
      }
      
	});
   
//   // 더보기버튼 모달
//   $('.addBtn').on('click', function() {
//      $('.all_modal').addClass('on');
//      $('.modal_div').css('position', 'fixed');
//      $('.modal_div').css('right', '50%');
//      $('.modal_div').css('bottom', '50%');
//      
//      // 모달바탕 클릭했을때(꺼짐)
//      $('.on').click(function() {
//         $('.all_modal').removeClass('on');
//         $('.modal_div').css('position', 'static');
//      });
//      // 알림끄기
//
//      // 차단
//      
//      // 신고
//      
//      // 나가기
//   });

   
});
