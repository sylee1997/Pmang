$(document).ready(function(){
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreReviewCnt',
		dataType:'text',
		success:function(data){
			$('.tab3Name span').text(data);
		},
		error:function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type:'post',
		url:'/pmang/board/getMystoreReviewList',
		data:{'pg':$('#pg').val()},
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
		
			
			$.each(data.list,function(index,items){
			if(items.reviewImg1==null){
				 // 리뷰사진이 없을경우
					
					 $('<div/>').append($('<div/>',{
							class:'review1'
						}).append($('<a/>',{
							class:'review_snb',
							href:'#'
								
						}).append($('<img src="/pmang/image/grayPmang.png" style="border:1px solid green;border-radius: 50%;" width="60" height="60"/>')))
						.append($('<div/>',{
							class:'review_content'
						}).append($('<div/>',{
							class:'review_header'
						}).append($('<div/>',{
							class:'reviewNameDiv'
						}).append($('<a/>',{
							class:'reviewName',
							text:items.reviewWriter
						})).append($('<div/>',{
							class:'reviewTime',
							text:timeCalc(items.reviewLogtime)
						}))).append($('<a/>',{
							class:'score',
							text:items.reviewStamp
						}).prepend($('<img src="/pmang/image/main_logo.JPG" width="20" height="20"/>'
								)))).append($('<div/>',{
									class:'reviewSubjectWrap'
								}).append($('<button/>',{
									class:'reviewSubjectBtn'
								}).append($('<span/>',{
									text:items.reviewSubject+'              >'
								})))).append($('<div/>',{
											class:'reviewDetail',
											text:items.reviewContent
										})).append($('<div/>',{
											class:'reportDiv'
										}).append($('<a/>',{
											class:'report',
											href:'#'
												
										}).append($('<img src="../image/declaimIcon.png" width="20" height="20" alt="신고버튼아이콘"/>'))
										.append($('<span/>',{
											text:'신고하기'
										})))))).append($('<input/>',{
											type:'hidden',
											id:'itemNum',
											value:items.itemNum
										})).appendTo($('.review'));
					 
				 }else{
						// //리뷰사진이랑 리뷰내용을 모두 작성되어있을때
						
						$('<div/>').append($('<div/>',{
							class:'review1'
						}).append($('<a/>',{
							class:'review_snb',
							href:'#'
								
						}).append($('<img src="/pmang/image/grayPmang.png" style="border:1px solid green;border-radius: 50%;" width="60" height="60"/>')))
						.append($('<div/>',{
							class:'review_content'
						}).append($('<div/>',{
							class:'review_header'
						}).append($('<div/>',{
							class:'reviewNameDiv'
						}).append($('<a/>',{
							class:'reviewName',
							text:items.reviewWriter
						})).append($('<div/>',{
							class:'reviewTime',
							text:timeCalc(items.reviewLogtime)
						}))).append($('<a/>',{
							class:'score',
							text:items.reviewStamp
						}).prepend($('<img src="/pmang/image/main_logo.JPG" width="20" height="20"/>'
								)))).append($('<div/>',{
									class:'reviewSubjectWrap'
								}).append($('<button/>',{
									class:'reviewSubjectBtn'
								}).append($('<span/>',{
									text:items.reviewSubject+'              >'
								})))).append($('<div/>',{
									class:'reviewPhoto'
								}).append($('<img src="/pmang/image/'+items.reviewImg1+'" alt="상품이미지" style="border:1px solid rgb(238,238,238)"/>'))
										).append($('<div/>',{
											class:'reviewDetail',
											text:items.reviewContent
										})).append($('<div/>',{
											class:'reportDiv'
										}).append($('<a/>',{
											class:'report',
											href:'#'
												
										}).append($('<img src="../image/declaimIcon.png" width="20" height="20" alt="신고버튼아이콘"/>'))
										.append($('<span/>',{
											text:'신고하기'
										})))))).append($('<input/>',{
											type:'hidden',
											id:'itemNum',
											value:items.itemNum
										})).appendTo($('.review'));
						
						
					 }
			});
		}
		
	});
	
	//무한스크롤
	$(this).scroll(function(){
		var scrollHeight=$(document).height();
		var scrollPosition=$(window).height()+$(window).scrollTop();
		
		var pg=$('#pg').val();
		let cnt=$('.tab3Name span').text();
		//console.log(cnt);
		//console.log($('.review1').length);
		
		if(scrollPosition>scrollHeight-800){
			if(cnt==$('.review1').length){
				//console.log('길이가같아ㅏ');
				return false;
			}
			pg++;
			
			$.ajax({
				type:'post',
				url:'/pmang/board/getMystoreReviewList',
				data:{'pg':pg},
				dataType:'json',
				success:function(data){
					console.log(JSON.stringify(data));
				
					
					$.each(data.list,function(index,items){
					if(items.reviewImg1==null){
						 // 리뷰사진이 없을경우
							
							 $('<div/>').append($('<div/>',{
									class:'review1'
								}).append($('<a/>',{
									class:'review_snb',
									href:'#'
										
								}).append($('<img src="/pmang/image/grayPmang.png" style="border:1px solid green;border-radius: 50%;" width="60" height="60"/>')))
								.append($('<div/>',{
									class:'review_content'
								}).append($('<div/>',{
									class:'review_header'
								}).append($('<div/>',{
									class:'reviewNameDiv'
								}).append($('<a/>',{
									class:'reviewName',
									text:items.reviewWriter
								})).append($('<div/>',{
									class:'reviewTime',
									text:timeCalc(items.reviewLogtime)
								}))).append($('<a/>',{
									class:'score',
									text:items.reviewStamp
								}).prepend($('<img src="/pmang/image/main_logo.JPG" width="20" height="20"/>'
										)))).append($('<div/>',{
											class:'reviewSubjectWrap'
										}).append($('<button/>',{
											class:'reviewSubjectBtn'
										}).append($('<span/>',{
											text:items.reviewSubject+'              >'
										})))).append($('<div/>',{
													class:'reviewDetail',
													text:items.reviewContent
												})).append($('<div/>',{
													class:'reportDiv'
												}).append($('<a/>',{
													class:'report',
													href:'#'
														
												}).append($('<img src="../image/declaimIcon.png" width="20" height="20" alt="신고버튼아이콘"/>'))
												.append($('<span/>',{
													text:'신고하기'
												})))))).append($('<input/>',{
													type:'hidden',
													id:'itemNum',
													value:items.itemNum
												})).appendTo($('.review'));
							 
						 }else{
								// //리뷰사진이랑 리뷰내용을 모두 작성되어있을때
								
								$('<div/>').append($('<div/>',{
									class:'review1'
								}).append($('<a/>',{
									class:'review_snb',
									href:'#'
										
								}).append($('<img src="/pmang/image/grayPmang.png" style="border:1px solid green;border-radius: 50%;" width="60" height="60"/>')))
								.append($('<div/>',{
									class:'review_content'
								}).append($('<div/>',{
									class:'review_header'
								}).append($('<div/>',{
									class:'reviewNameDiv'
								}).append($('<a/>',{
									class:'reviewName',
									text:items.reviewWriter
								})).append($('<div/>',{
									class:'reviewTime',
									text:timeCalc(items.reviewLogtime)
								}))).append($('<a/>',{
									class:'score',
									text:items.reviewStamp
								}).prepend($('<img src="/pmang/image/main_logo.JPG" width="20" height="20"/>'
										)))).append($('<div/>',{
											class:'reviewSubjectWrap'
										}).append($('<button/>',{
											class:'reviewSubjectBtn'
										}).append($('<span/>',{
											text:items.reviewSubject+'              >'
										})))).append($('<div/>',{
											class:'reviewPhoto'
										}).append($('<img src="/pmang/image/'+items.reviewImg1+'" alt="상품이미지" style="border:1px solid rgb(238,238,238)"/>'))
												).append($('<div/>',{
													class:'reviewDetail',
													text:items.reviewContent
												})).append($('<div/>',{
													class:'reportDiv'
												}).append($('<a/>',{
													class:'report',
													href:'#'
														
												}).append($('<img src="../image/declaimIcon.png" width="20" height="20" alt="신고버튼아이콘"/>'))
												.append($('<span/>',{
													text:'신고하기'
												})))))).append($('<input/>',{
													type:'hidden',
													id:'itemNum',
													value:items.itemNum
												})).appendTo($('.review'));
								
								
							 }
					});
				}
				
			});
			
		}
	});
	
});

//날짜계싼
function timeCalc(value){
	
	// 받아온 날짜 문자열 자르기
	var year=value.substring(0,4);
	var month=value.substring(5,7);
	var day=value.substring(8,10);
	
	var today=new Date();	// 현재 날짜
	var log=new Date(value);	// 받아온 날짜
	
	var diff=Math.floor((today.getTime()-log.getTime())/(1000*3500*24));
	// diff=Math.ceil(diff/(1000*3500*24));
	
	var result=Math.round(diff/30);
	// alert(diff+' '+result);
	if(result==0){
		if(diff==0){
			return '오늘';
		}else{
			
			return diff+'일전';
		}
	}else if(result!=0){
		return result+'달전';
	}
	

}
