
//상품 목록
$(document).ready(function(){
	//게시글 총 개수
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemCnt',
		dataType:'text',
		success:function(data){
			console.log(data);
			$('.tabName span').text(data);
		},
		error:function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			
			$('#selectCategory span').text(data.list.length);
			$('#mystoreSold span').text(data.list.length+'회');
		//	$('li#default.tabmenu a span').text(data.list.length);
			$.each(data.list,function(index,items){
				
				
				
				$('<div/>').append($('<div/>',{
					
					class:'storeItemFrame'
				}).append($('<a/>',{
						class:'itemLink',
						href:'#'
					}).append($('<div/>',{
						class:'itemImageArea'
						}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
								)).append($('<div/>',{
									class:'imageAreaDiv'
								})))
					.append($('<div/>',{
						class:'itemContent'
					}).append($('<div/>',{
						class:'itemName',
						text:items.itemSubject
					})).append($('<div/>',{
						class:'itemPriceAndTime'
					}).append($('<div/>',{
						class:'itemPrice',
						text:items.item_price+'원'
					})).append($('<div/>',{
						class:'itemTime'
						}).append($('<span/>',{
							text:timeCalc(items.logtime)
					}))))))).appendTo($('.storeSelection3'));
				//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
			});
		},
		error:function(err){
			console.log(err);
		}
	});
	
	var bool_sw=false;
	//무한스크롤
	$(this).on("scroll",function(){
		var scrollHeight=$(document).height();
		var scrollPosition=$(window).height()+$(window).scrollTop();
		
		var pg=$('#pg').val();
		let cnt=$('.tabName span').text();
		
		if(scrollPosition>scrollHeight-800){
			if(cnt==$('.storeItemFrame').length){
				//console.log('길이가같아ㅏ');
				
				return false;
			}
			pg++;
			$.ajax({
				type:'post',
				url:'/pmang/board/getMystoreItemList',
				data:{'pg':pg},
				dataType:'json',
				success:function(data){
					console.log(JSON.stringify(data));
					
					bool_sw=true;
					$('#selectCategory span').text(data.list.length);
					$('#mystoreSold span').text(data.list.length+'회');
				//	$('li#default.tabmenu a span').text(data.list.length);
					$.each(data.list,function(index,items){
						
						
						
						$('<div/>').append($('<div/>',{
							
							class:'storeItemFrame'
						}).append($('<a/>',{
								class:'itemLink',
								href:'#'
							}).append($('<div/>',{
								class:'itemImageArea'
								}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
										)).append($('<div/>',{
											class:'imageAreaDiv'
										})))
							.append($('<div/>',{
								class:'itemContent'
							}).append($('<div/>',{
								class:'itemName',
								text:items.itemSubject
							})).append($('<div/>',{
								class:'itemPriceAndTime'
							}).append($('<div/>',{
								class:'itemPrice',
								text:items.item_price+'원'
							})).append($('<div/>',{
								class:'itemTime'
								}).append($('<span/>',{
									text:timeCalc(items.logtime)
							}))))))).appendTo($('.storeSelection3'));
						//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
					});
				},
				error:function(err){
					console.log(err);
				}
			});
		}
	});
	
	
});
//날짜계싼
function timeCalc(value){
	
	//받아온 날짜 문자열 자르기
	var year=value.substring(0,4);
	var month=value.substring(5,7);
	var day=value.substring(8,10);
	
	var today=new Date();	//현재 날짜
	var log=new Date(value);	//받아온 날짜
	
	var diff=Math.floor((today.getTime()-log.getTime())/(1000*3500*24));
	//diff=Math.ceil(diff/(1000*3500*24));
	
	var result=Math.round(diff/30);
	//alert(diff+' '+result);
	if(result==0){
		return diff+'일전';
	}else if(result!=0){
		return result+'달전';
	}
	
	
}
//최신순
$('#latest').on('click',function(){
	$('div.storeItemFrame').remove();
	$('#latest').css('color','green');
	$('#popularity').css('color','black');
	$('#lowerPrice').css('color','black');
	$('#highestPrice').css('color','black');
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			
			$('#selectCategory span').text(data.list.length);
			$('#mystoreSold span').text(data.list.length+'회');
		//	$('li#default.tabmenu a span').text(data.list.length);
			$.each(data.list,function(index,items){
				
				
				
				$('<div/>').append($('<div/>',{
					
					class:'storeItemFrame'
				}).append($('<a/>',{
						class:'itemLink',
						href:'#'
					}).append($('<div/>',{
						class:'itemImageArea'
						}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
								)).append($('<div/>',{
									class:'imageAreaDiv'
								})))
					.append($('<div/>',{
						class:'itemContent'
					}).append($('<div/>',{
						class:'itemName',
						text:items.itemSubject
					})).append($('<div/>',{
						class:'itemPriceAndTime'
					}).append($('<div/>',{
						class:'itemPrice',
						text:items.item_price+'원'
					})).append($('<div/>',{
						class:'itemTime'
						}).append($('<span/>',{
							text:timeCalc(items.logtime)
					}))))))).appendTo($('.storeSelection3'));
				//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});
//인기순
$('#popularity').click(function(){
	$('div.storeItemFrame').remove();
	
	$('#popularity').css('color','green');
	$('#latest').css('color','black');
	$('#lowerPrice').css('color','black');
	$('#highestPrice').css('color','black');
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemPopularList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			
			$('#selectCategory span').text(data.list.length);
			$('#mystoreSold span').text(data.list.length+'회');
		//	$('li#default.tabmenu a span').text(data.list.length);
			$.each(data.list,function(index,items){
				
				
				
				$('<div/>').append($('<div/>',{
					
					class:'storeItemFrame'
				}).append($('<a/>',{
						class:'itemLink',
						href:'#'
					}).append($('<div/>',{
						class:'itemImageArea'
						}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
								)).append($('<div/>',{
									class:'imageAreaDiv'
								})))
					.append($('<div/>',{
						class:'itemContent'
					}).append($('<div/>',{
						class:'itemName',
						text:items.itemSubject
					})).append($('<div/>',{
						class:'itemPriceAndTime'
					}).append($('<div/>',{
						class:'itemPrice',
						text:items.item_price+'원'
					})).append($('<div/>',{
						class:'itemTime'
						}).append($('<span/>',{
							text:timeCalc(items.logtime)
					}))))))).appendTo($('.storeSelection3'));
				//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});

//저가순
$('#lowerPrice').click(function(){
	$('div.storeItemFrame').remove();
	
	$('#lowerPrice').css('color','green');
	$('#latest').css('color','black');
	$('#popularity').css('color','black');
	$('#highestPrice').css('color','black');
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemLowerPriceList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			
			$('#selectCategory span').text(data.list.length);
			$('#mystoreSold span').text(data.list.length+'회');
		//	$('li#default.tabmenu a span').text(data.list.length);
			$.each(data.list,function(index,items){
				
				
				
				$('<div/>').append($('<div/>',{
					
					class:'storeItemFrame'
				}).append($('<a/>',{
						class:'itemLink',
						href:'#'
					}).append($('<div/>',{
						class:'itemImageArea'
						}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
								)).append($('<div/>',{
									class:'imageAreaDiv'
								})))
					.append($('<div/>',{
						class:'itemContent'
					}).append($('<div/>',{
						class:'itemName',
						text:items.itemSubject
					})).append($('<div/>',{
						class:'itemPriceAndTime'
					}).append($('<div/>',{
						class:'itemPrice',
						text:items.item_price+'원'
					})).append($('<div/>',{
						class:'itemTime'
						}).append($('<span/>',{
							text:timeCalc(items.logtime)
					}))))))).appendTo($('.storeSelection3'));
				//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});

//고가순
$('#highestPrice').click(function(){
	$('div.storeItemFrame').remove();
	
	$('#highestPrice').css('color','green');
	$('#latest').css('color','black');
	$('#lowerPrice').css('color','black');
	$('#popularity').css('color','black');
	
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreItemHighestPriceList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			
			$('#selectCategory span').text(data.list.length);
			$('#mystoreSold span').text(data.list.length+'회');
		//	$('li#default.tabmenu a span').text(data.list.length);
			$.each(data.list,function(index,items){
				
				
				
				$('<div/>').append($('<div/>',{
					
					class:'storeItemFrame'
				}).append($('<a/>',{
						class:'itemLink',
						href:'#'
					}).append($('<div/>',{
						class:'itemImageArea'
						}).append($('<img src="/pmang/image/'+items.img1+'" width="194px" height="194px" alt="상품 이미지"/>'
								)).append($('<div/>',{
									class:'imageAreaDiv'
								})))
					.append($('<div/>',{
						class:'itemContent'
					}).append($('<div/>',{
						class:'itemName',
						text:items.itemSubject
					})).append($('<div/>',{
						class:'itemPriceAndTime'
					}).append($('<div/>',{
						class:'itemPrice',
						text:items.item_price+'원'
					})).append($('<div/>',{
						class:'itemTime'
						}).append($('<span/>',{
							text:timeCalc(items.logtime)
					}))))))).appendTo($('.storeSelection3'));
				//$('#mystoreTab1PagingDiv').html(data.mystoreTab1Paging.pagingHTML);
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});
