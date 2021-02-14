// 정렬 기준 콤보박스
$('.selectQty').hover(function(){					//+items.item_seq
	$('.qtyDropbox').css('display', 'block')}
, function(){
	$('.qtyDropbox').css('display', 'none')
});

// color 입히기
for(var i=0; i<$('.qtyDropbox').children().length; i++){
	if($('.qtyDropbox').children().eq(i).text().trim() == $('.selectQtyBox').text().trim()){
		$('.qtyDropbox').children().eq(i).addClass('select1');
	}
}	

// 드롭다운 영역에서 요소를 클릭하면 반영되는 기능
$('.selectQty').on('click', 'a',function() {
	var img = '<img src="../image/open.png" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select1').removeClass('select1');
	$(this).addClass('select1');
	$('.selectQtyBox').html($(this).text() + img);
});

// 검색용 판매 상태 콤보박스
$('.selectStatus').hover(function() {
	$('.statusDropbox').css('display', 'block')
}, function() {
	$('.statusDropbox').css('display', 'none')
});

// color 입히기				이거 alert이나 console로 찍어봐야함
for(var i=0; i<$('.statusDropbox').children().length; i++){
	if($('.statusDropbox').children().eq(i).text().trim() == $('.selectStatusBox').text().trim()){
		$('.statusDropbox').children().eq(i).addClass('select2');
	}
}	

//드롭다운 영역에서 요소를 클릭하면 반영되는 기능
$('.selectStatus').on('click', 'a', function() {
	var img = '<img src="../image/open.png" width="10" height="6" alt="카테고리 화살표 아이콘">';
	$('.select2').removeClass('select2');
	$(this).addClass('select2');
	$('.selectStatusBox').html($(this).text() + img);
});


//리스트 출력
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/pmang/seller/getSellerManagementList', 
		data: {'pg':$('#pg').val(), 'userid':$('#userid').val()},
		dataType: 'json', 
		success: function(data){
			console.log(data);
			
			$.each(data.list, function(index, items){
				$('<tr\>').append($('<td\>', {			//사진 삽입
					align: 'center',
					}).append($('<input\>', {
						type: 'hidden',
						id: 'item_seq',
						value: items.item_seq
					})).append($('<img\>', {
						src: '/pmang/storage/'+items.img1,
						style: 'width: 150; height: 150; cursor: pointer;',
						class: items.item_seq+'',
						alt: '상품이미지'
					}))
				).append($('<td\>',{
					align: 'center'
					}).append($('<div\>', {
						class: 'selectQtyDiv',
						}).append($('<div\>', {
							class: 'selectContainer'
							}).append($('<div\>', {
								class: 'selectBorder'
								}).append($('<div\>', {
									class: 'manageSelectStatus',
									id: 'manageSelectStatus'+items.item_seq
									}).append($('<div\>',{
										class: 'manageSelectStatusBox',
										text: items.item_state,
										id: 'manageSelectStatusBox'+items.item_seq
									}).append($('<img\>',{
										src: '/pmang/image/open.png',
										style: 'width:10px; height:6px;',
										alt: '카테고리 화살표 아이콘'
									})).append($('<div\>', {
										class: 'manageStatusDropbox',
										id: 'manageStatusDropbox'+items.item_seq
									}).append($('<a\>', {
										href: '#',
										text: '판매 중'
									})).append($('<a\>', {
										href: '#',
										text: '예약 중'
									})).append($('<a\>', {
										href: '#',
										text: '판매완료'
									}))))))))
				).append($('<td\>', {			//상품명 삽입
					}).append($('<a\>', {
						class: items.item_seq+'',
						text: items.item_subject,
						style: 'cursor: pointer;',						
						id: 'subject'
				}))).append($('<td\>', {			//가격 삽입 및 가격의 3자리마다 , 처리
						text: items.item_price.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+'원'					
				})).append($('<td\>',{			//찜/댓글 삽입
					text: items.wish_count+' / '+items.comment_count
				})).append($('<td\>',{			//최근 수정일 삽입
					text: items.logtime
				})).append($('<td\>', {
					class: 'lastTd'
					}).append($('<button\>', {
						type: 'button',
						class: 'logtimeUpdate',
						id: 'logtimeUpdate'+items.item_seq,
						text: 'UP'
					})).append($('<a\>', {
						class: 'contentUpdate',
						id: 'contentUpdate'+items.item_seq,
						href: '/pmang/seller/sellerModify',
						text: '수정'
					})).append($('<button\>', {
						type: 'button',
						class: 'contentDelete',
						id: 'contentDelete'+items.item_seq,
						text: '삭제'
					}))
				).appendTo($('.sellManagementTbody')); 

				//게시글 번호가 class로 달린 div 클릭시 게시글로 이동
				$('.'+items.item_seq).click(function(){
					location.href = '/pmang/itemView?item_seq='+items.item_seq;		//게시글 주소 삽입
				});	
				
				//페이징 처리
				$('.footerPagingDiv').html(data.sellerManagementPaging.pagingHTML);
				
				//상태 관리용 판매 상태 콤보박스
				$('#manageSelectStatus').hover(function() {
					$('#manageStatusDropbox'+items.item_seq).css('display', 'block')
				}, function() {
					$('#manageStatusDropbox'+items.item_seq).css('display', 'none')
				});

				// color 입히기
				for(var i=0; i<$('#manageStatusDropbox'+items.item_seq).children().length; i++){
					if($('#manageStatusDropbox'+items.item_seq).children().eq(i).text().trim() == $('#selectStatusBox'+items.item_seq).text().trim()){
						$('#manageStatusDropbox'+items.item_seq).children().eq(i).addClass('select3');
					}
				}		

				//드롭다운 영역에서 요소를 클릭하면 반영되는 기능
				$('#manageStatusDropbox'+items.item_seq).on('click', 'a', function(){
					var img = '<img src="../image/open.png" width="10" height="6" alt="카테고리 화살표 아이콘">';
					$('.select3').removeClass('select3');
					$(this).addClass('select3');
					$('#selectStatusBox'+items.item_seq).html($(this).text() + img);
				});
				
				
					
			});//each
			
		},
		error: function(err) {
			console.log(err);
		}
	})
});

//페이징 처리
function sellerManagementPaging(pg) {
		location.href="sellerManagementForm?pg="+pg;
}

//
////상태 관리용 판매 상태 콤보박스
//$('.manageSelectStatus').hover(function() {
//	var id = $(this).attr('id');
//	console.log(id);
//	$('#'+id).css('display', 'block')
//}, function() {
//	$('#'+id).css('display', 'none')
//});
//
//// color 입히기
//for(var i=0; i<$('.statusDropbox').children().length; i++){
//	var id = $(this).attr('id');
//	if($('#'+id.children().eq(i).text().trim() == $('#status'+items.item_seq).text().trim()){
//		$('#statusDropbox'+items.item_seq).children().eq(i).addClass('select3');
//	}
//}		
//
////드롭다운 영역에서 요소를 클릭하면 반영되는 기능
//$('#statusDropbox'+items.item_seq).on('click', 'a', function(){
//	var img = '<img src="../image/open.png" width="10" height="6" alt="카테고리 화살표 아이콘">';
//	$('.select3').removeClass('select3');
//	$(this).addClass('select3');
//	$('#status'+items.item_seq).html($(this).text() + img);
//});



//서치 버튼 클릭
$('.inputFormBtn').click(function(event, str){
	if(str != 'research')	$('input[name=pg]').val(1);
	$.ajax({
		type: 'post',
		url: '/pmang/seller/getManagementSearch',
		data: {'pg':$('#pg').val(), 'userid':$('#userid').val(), 'setting':$('.selectQtyBox').val(),
					'item_state':$('.selectStatusBox').val(), 'keyword':$('keyword').val()},
		success: function(data){
			$('.sellManagementTbody tr:gt(0)').remove();
			
			$.each(data.list, function(index, items){
				$('<tr\>').append($('<td\>', {			//사진 삽입
					align: 'center',
					}).append($('<input\>', {
						type: 'hidden',
						id: 'item_seq',
						value: items.item_seq
					})).append($('<img\>', {
						src: '/pmang/storage/'+items.img1,
						style: 'width: 150; height: 150; cursor: pointer;',
						class: items.item_seq+'',
						alt: '상품이미지'
					}))
				).append($('<td\>',{
					align: 'center'
					}).append($('<div\>', {
						class: 'selectQtyDiv',
						}).append($('<div\>', {
							class: 'selectContainer'
							}).append($('<div\>', {
								class: 'selectBorder'
								}).append($('<div\>', {
									class: 'manageSelectStatus',
									id: 'manageSelectStatus'+items.item_seq
									}).append($('<div\>',{
										class: 'manageSelectStatusBox',
										text: items.item_state,
										id: 'manageSelectStatusBox'+items.item_seq
									}).append($('<img\>',{
										src: '/pmang/image/open.png',
										style: 'width:10px; height:6px;',
										alt: '카테고리 화살표 아이콘'
									})).append($('<div\>', {
										class: 'manageStatusDropbox',
										id: 'manageStatusDropbox'+items.item_seq
									}).append($('<a\>', {
										href: '#',
										text: '판매 중'
									})).append($('<a\>', {
										href: '#',
										text: '예약 중'
									})).append($('<a\>', {
										href: '#',
										text: '판매완료'
									}))))))))
				).append($('<td\>', {			//상품명 삽입
					}).append($('<a\>', {
						class: items.item_seq+'',
						text: items.item_subject,
						style: 'cursor: pointer;',						
						id: 'subject'
				}))).append($('<td\>', {			//가격 삽입 및 가격의 3자리마다 , 처리
						text: items.item_price.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+'원'					
				})).append($('<td\>',{			//찜/댓글 삽입
					text: items.wish_count+' / '+items.comment_count
				})).append($('<td\>',{			//최근 수정일 삽입
					text: items.logtime
				})).append($('<td\>', {
					class: 'lastTd'
					}).append($('<button\>', {
						type: 'button',
						class: 'logtimeUpdate',
						id: 'logtimeUpdate'+items.item_seq,
						text: 'UP'
					})).append($('<a\>', {
						class: 'contentUpdate',
						id: 'contentUpdate'+items.item_seq,
						href: '/pmang/seller/sellerModify',
						text: '수정'
					})).append($('<button\>', {
						type: 'button',
						class: 'contentDelete',
						id: 'contentDelete'+items.item_seq,
						text: '삭제'
					}))
				).appendTo($('.sellManagementTbody')); 

				//게시글 번호가 class로 달린 div 클릭시 게시글로 이동
				$('.'+items.item_seq).click(function(){
					location.href = '/pmang/itemView?item_seq='+items.item_seq;		//게시글 주소 삽입
				});	
				
				//페이징 처리
				$('.footerPagingDiv').html(data.sellerManagementPaging.pagingHTML);
					
			});//each
			
		},
		error: function(err) {
			console.log(err);
		}
	});
});


//up버튼 클릭
$('.logtimeUpdate').click(function(){
	var id = $('.logtimeUpdate').attr('id');
	console.log(id);
	
	if('.manageSelectStatusBox'.text().trim()=="판매완료"){
		alert("판매 완료 상품은 UP하기를 이용할 수 없습니다.");
	}
	else {
		if(confirm("선택한 글을 UP하시겠습니까?")){
			$.ajax({
				type: 'post',
				url: '/pmang/seller/sellerModify',
				data: 'item_seq='+$('#item_seq').val(),
				dataType: 'json',
				success: function(){
					alert("UP 완료");
					location.href="/pmang/seller/sellerManagementForm.do";
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	}
});

//삭제 버튼 클릭
$('.contentDelete').on('click', 'button', function(){
	if(confirm("선택한 글을 삭제하시겠습니까?")){
		$.ajax({
			type: 'post',
			url: '/pmang/seller/sellerManagementDelete',
			data: 'item_seq='+$('#item_seq').val(),
			dataType: 'json',
			success: function(){
				alert("삭제 완료");
				location.href='/pmang/seller/sellerManagementForm.do';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});