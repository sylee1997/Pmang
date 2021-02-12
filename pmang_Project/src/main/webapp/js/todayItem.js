
      /* 인기 카테고리 슬라이드 쇼 이벤트 */
      var ul = document.querySelector('.slide_wrap');
      function move() {
         var curIndex = 0;
         setInterval(function() {
            ul.style.transition = '0.8s';
            ul.style.transform = "translate3d(-" + 1024 * (curIndex + 1)
                  + "px, 0px, 0px)";
            curIndex++;
            if (curIndex === 4) {
               curIndex = -1;
            }
         }, 5000);
      }
      document.addEventListener("DOMContentLoaded", function() {
         // 
         move();
      });
      /* 인기 카테고리 슬라이드 쇼 이벤트 */


    //올린 시간 체크.
      function timeForToday(value) {
          var today = new Date();
          var timeValue = new Date(value);
          
          var betweenSeconds = Math.floor((today.getTime() - timeValue.getTime()) / 1000);
          if (betweenSeconds < 60) {
              return betweenSeconds+'초전';
          }

          var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
          
          if (betweenTime < 60) {
              return betweenTime+'분전';
          }

          var betweenTimeHour = Math.floor(betweenTime / 60);
          if (betweenTimeHour < 24) {
              return betweenTimeHour + '시간전';
          }

          var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
          if (betweenTimeDay < 365) {
              return betweenTimeDay+'일전';
          }

          return Math.floor(betweenTimeDay / 365)+'년전';
      }

      //콤마!
      function addComma(str) {
          str = String(str);
          return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
      }
      
      
      
      
      
/*$(document).ready(function() {
	
	$.ajax({
	      type : 'post',
	      url : '/pmang/board/getIndexTotalItem',
	      dataType : 'text',
	      success : function(data){
	    	  $('#total').val(data);
	      },
	      error : function(err){
	    	  console.log(err);
	      }
	});
	
	 $.ajax({
	      type : 'post',
	      url : '/pmang/board/getIndexBoardList',
	      data : {'pg' : '1'},
	      dataType : 'json',
	      success : function(data){
	    	 //console.log(JSON.stringify(data));
	      	$.each(data.itemList, function(index, items){
	      				
	      		var itemFrameDiv = '<div class="itemFrame"></div>';
	      				
	      				var itemLinkA = '<a class="itemLink"><span id="item_seqSpan">'+items.item_seq+'</span>';
	      				itemLinkA += '<img src="/pmang/storage/'+items.img1+'" width="194" height="194" alt="상품이미지"></a>';
	      				var itemContentDiv = '<div class="itemContent">';
	      				itemContentDiv += '<div class="itemName">'+items.item_subject+'</div>';
	      				itemContentDiv += '<div class="itemPriceAndTime">';
	      				itemContentDiv += '<div class="itemPrice">'+addComma(items.item_price)+'</div><div class="itemTime"><span>'+timeForToday(items.logtime)+'</span></div>'
	      				itemContentDiv += '</div>';
	      				itemContentDiv += '</div>';
	      				

	      				
	      				$(itemFrameDiv).append($(itemLinkA).append($(itemContentDiv))).appendTo($('.selection3'));
	      			});
	      		},
	      		error : function(err){
	      			console.log(err);
	      		}
	      		
	      	});
	
	$(document).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		if (maxHeight - 500 < currentScroll) {
			// $("#enters").append("<h1>Page " + page + "</h1><BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~");
			for(var i = 2; i <= $('#total').val(); i++){
				$.ajax({
					type : 'post',
					url : '/pmang/board/getIndexBoardList',
					data : {'pg' : i},
					dataType : 'json',
					success : function(data){
						console.log(JSON.stringify(data));
						$.each(data.itemList, function(index, items){
							
							var itemFrameDiv = '<div class="itemFrame"></div>';
							
							var itemLinkA = '<a class="itemLink"><span id="item_seqSpan">'+items.item_seq+'</span>';
							itemLinkA += '<img src="/pmang/storage/'+items.img1+'" width="194" height="194" alt="상품이미지"></a>';
							var itemContentDiv = '<div class="itemContent">';
							itemContentDiv += '<div class="itemName">'+items.item_subject+'</div>';
							itemContentDiv += '<div class="itemPriceAndTime">';
							itemContentDiv += '<div class="itemPrice">'+addComma(items.item_price)+'</div><div class="itemTime"><span>'+timeForToday(items.logtime)+'</span></div>'
							itemContentDiv += '</div>';
							itemContentDiv += '</div>';
							
							
							
							$(itemFrameDiv).append($(itemLinkA).append($(itemContentDiv))).appendTo($('.selection3'));
						});
					},
					error : function(err){
						console.log(err);
					}
					
				});//ajax
			}//for
			
		}//if
		
		if($(window).scrollTop() == $(document).height() - $(window).height()){
			alert("bottom!");
		}
	});//scroll

	 
});//ready
*/

/*     var pageNo = document.getElementById('pageNo');
      var currentPage = 0;        // 현재 페이지
      var totPage = 5;            // 전체 페이지
      var scrollchk = true;       // 스크롤 체크
*/
     /* var func = {

           //초기화 이벤트 
          initHtml: function () {
              this.search(currentPage);
          },


           //무한 스크롤 목록 
          search : function (pno) {
              pageNo.value = pno; // 현재페이지
              scrollchk = false;  // 스크롤 막음

              $.ajax({
                  method: 'post',
                  url: '/pmang/board/getIndexBoardList',
                  dataType: 'json',
                  data: {'pg': pno},
                  success: function (data) {
                  
                      // 첫 페이지 일 때
                      if (pno == 0) {
                          $('.selection3').html('');
                          totPage = data.pagingTotal;  // 컨트롤러에서 받아온 전체 페이지 값
                      }

                      
                      if (data.itemList.length < 1) {
                          // 조회 결과가 없는 경우
                    	  $('.selection3').html('<div>조회 결과가 없습니다.</div>');
                      } else {
                          // 조회 결과가 있는 경우
                    	  $.each(data.itemList, function(index, items){
  							var itemFrameDiv = '<div class="itemFrame"></div>';
  							
  							var itemLinkA = '<a class="itemLink"><span id="item_seqSpan">'+items.item_seq+'</span>';
  							itemLinkA += '<img src="/pmang/storage/'+items.img1+'" width="194" height="194" alt="상품이미지"></a>';
  							var itemContentDiv = '<div class="itemContent">';
  							itemContentDiv += '<div class="itemName">'+items.item_subject+'</div>';
  							itemContentDiv += '<div class="itemPriceAndTime">';
  							itemContentDiv += '<div class="itemPrice">'+addComma(items.item_price)+'</div><div class="itemTime"><span>'+timeForToday(items.logtime)+'</span></div>'
  							itemContentDiv += '</div>';
  							itemContentDiv += '</div>';
  							
  							$(itemFrameDiv).append($(itemLinkA).append($(itemContentDiv))).appendTo($('.selection3'));
  						});
                    	  
                         scrollchk = true;   // 스크롤 풀기
                      }
                  },
                  error: function (err) {
                	  console.log(err);
                      alert('에러가 발생하였습니다.');
                      return;
                  }
              });
          },*/

     /* };
*/


/*      // 스크롤 발생할 때 이벤트
      $(document).scroll(function() {
          // 스크롤 이벤트 발생 제어
          if (scrollchk) {
              // 스크롤 이벤트 발생할 위치 (맨 하단)
              if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
                  currentPage++;
                  // 전체 페이지 까지만 조회
                  if (currentPage < totPage) {
                	  alert('아')
                  }
                      //search(currentPage);
                  }
              }
         
      });*/
  
      
var page = 1;
$(document).ready(function(){
	getList(page);
    page++;
	
	$.ajax({
	      type : 'post',
	      url : '/pmang/board/getIndexTotalItem',
	      dataType : 'text',
	      success : function(data){
	    	  $('#total').val(data);
	      },
	      error : function(err){
	    	  console.log(err);
	      }
	});
    
});
      
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
    if($(window).scrollTop() >= $(document).height() - $(window).height()){
         getList(page);
         page++;   
    } 
});

function getList(page){
	
	if(page != 1 && page > $('#total').val()){
		return;
	}
	else{
		$.ajax({
	        type : 'post',  
	        dataType : 'json', 
	        data : {"pg" : page},
	        url : '/pmang/board/getIndexBoardList',
	        success : function(data) {
	        	if(data.itemList.length == 0){
	        		$('.selection3').html('<div>아직 장터가 많이 부실해서 등록된 상품이 없습니다.. 상품을 등록해주세요..</div>');
	        	}
	        	else{
	        		$.each(data.itemList, function(index, items){
	        			var itemFrameDiv = '<div class="itemFrame"></div>';
	        			
	        			var itemLinkA = '<a class="itemLink"><span id="item_seqSpan">'+items.item_seq+'</span>';
	        			itemLinkA += '<img src="/pmang/storage/'+items.img1+'" width="194" height="194" alt="상품이미지"></a>';
	        			var itemContentDiv = '<div class="itemContent">';
	        			itemContentDiv += '<div class="itemName">'+items.item_subject+'</div>';
	        			itemContentDiv += '<div class="itemPriceAndTime">';
	        			itemContentDiv += '<div class="itemPrice">'+addComma(items.item_price)+'</div><div class="itemTime"><span>'+timeForToday(items.logtime)+'</span></div>'
	        			itemContentDiv += '</div>';
	        			itemContentDiv += '</div>';
	        			
	        			$(itemFrameDiv).append($(itemLinkA).append($(itemContentDiv))).appendTo($('.selection3'));
	        		});//each
	        	}
	       },
	       error: function(err){
	    	   console.log(err);
	       }
		});//each
	}//else
}


      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

//아이템 클릭했을 때
$('.selection3').on('click', '.itemLink', function(){
	var item_seq = $(this).children('#item_seqSpan').text();
	var itemSubject = $(this).find('.itemName').text();
	var itemPrice = $(this).find(".itemPrice").text();
	var img = $(this).children("img").attr('src');
	
	checkCookie(img, itemSubject, itemPrice, item_seq);
	
	
	//아이템 뷰로 이동!
	location.href="/pmang/board/itemView?item_seq="+item_seq;
	
});










/*$(document).ready(function(){
      	
     $.ajax({
      type : 'post',
      url : '/pmang/board/getIndexBoardList',
      data : {'pg' : '1'},
      dataType : 'json',
      success : function(data){
    	 $('#total').val(data.totalItem);
    	 //console.log(JSON.stringify(data));
      	$.each(data.itemList, function(index, items){
      				
      		var itemFrameDiv = '<div class="itemFrame"></div>';
      				
      				var itemLinkA = '<a class="itemLink"><span id="item_seqSpan">'+items.item_seq+'</span>';
      				itemLinkA += '<img src="/pmang/storage/'+items.img1+'" width="194" height="194" alt="상품이미지"></a>';
      				var itemContentDiv = '<div class="itemContent">';
      				itemContentDiv += '<div class="itemName">'+items.item_subject+'</div>';
      				itemContentDiv += '<div class="itemPriceAndTime">';
      				itemContentDiv += '<div class="itemPrice">'+addComma(items.item_price)+'</div><div class="itemTime"><span>'+timeForToday(items.logtime)+'</span></div>'
      				itemContentDiv += '</div>';
      				itemContentDiv += '</div>';
      				
      				
      				$(itemFrameDiv).append($(itemLinkA).append($(itemContentDiv))).appendTo($('.selection3'));
      			});
      		},
      		error : function(err){
      			console.log(err);
      		}
      		
      	});
      	
});*/


function checkCookie(img, itemSubject, itemPrice, item_seq) {
    var itemID = getCookie("itemID");
	var thisItem= img+':'+itemSubject+':'+itemPrice+':'+item_seq;
	
		if (itemID != "" && itemID != null) {
			if (itemID.indexOf(thisItem) == -1){ //값이 없으면 
				setCookie("itemID",thisItem+"&"+itemID, 1);
			 }
		} else if (itemID == "" || itemID == null) {
				setCookie("itemID",thisItem+"&", 1);
		}

}


