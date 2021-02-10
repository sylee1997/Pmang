
      /* 인기 카테고리 슬라이드 쇼 이벤트 */
      var ul = document.querySelector('.slide_wrap');
      function move() {
         var curIndex = 0;
         setInterval(function() {
            ul.style.transition = '1s';
            ul.style.transform = "translate3d(-" + 1024 * (curIndex + 1)
                  + "px, 0px, 0px)";
            curIndex++;
            if (curIndex === 4) {
               curIndex = -1;
            }
         }, 1000);
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
      
      
      
      
      
$(document).ready(function() {
	
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




//아이템 클릭했을 때
$('.selection3').on('click', '.itemLink', function(){
	var item_seq = $(this).children('#item_seqSpan').text();
	var itemSubject = $(this).find('.itemName').text();
	var itemPrice = $(this).find(".itemPrice").text();
	var img = $(this).children("img").attr('src');
	
	var goods = [img, itemSubject, itemPrice];
	localStorage.setItem("key", JSON.stringify(goods));

	location.href="/pmang/board/itemView?item_seq="+item_seq;
	/*$.ajax({
		type : 'post',
		url : '/pmang/member/recentlyGoods',
		data : {'imgSrc' : img, 'item_seq' : item_seq},
		success : function(){
			alert("저장!")
			location.href="/pmang/board/itemView?item_seq="+item_seq;
		},
		error : function(err){
			console.log(err);
		}
		
	});
	*/
	//alert($(this).children("#item_seqSpan").text());
	//$('#goods_img1').append($('<img src="' + img + '" width="80" height="80">'));
	//location.href="/pmang/board/itemView?item_seq="+item_seq;
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