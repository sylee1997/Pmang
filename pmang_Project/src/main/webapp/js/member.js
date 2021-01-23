//회원가입

$(document).ready(function(){			//이메일 주소 선택 이벤트
	$('select[name=selection]').change(function() {
		if($('#selection').val()=="1"){
			$('#email2').val("");
		} else {
			$('#email2').val($(this).val());
			$("#email2").attr("readonly", true);
		}
	});
});

$('#writeBtn').click(function(){			//유효성 검사
	//각 항목이 적합한 양식인지 검사할 정규식
	var userIdCheck = /^[a-zA-Z0-9]{6,16}$/;
	var pwdCheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/;
	var nameCheck = /^[가-힣]{2,6}$/;
	
	$('#userIdDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	$('#userNameDiv').empty();

	if($('#userId').val()==''){
		$('#userIdDiv').text('필수 정보 입니다')
		$('#userIdDiv').css('color','red')
		$('#userIdDiv').css('font-size','8pt')
		$('#userIdDiv').css('font-weight','bold');	
				
	}else if(!userIdCheck.test($('#userId').val())) {		//id 형식 유효성 검사
		$('#userIdDiv').text('*영문, 숫자만 가능합니다(6~16자)')
		$('#userIdDiv').css('color', 'red')
		$('#userIdDiv').css('font-size', '8pt')
		$('#userIdDiv').css('font-weight', 'bold');
		
	}else if($('input[name=pwd]').val()==''){
		$('#pwdDiv').text('필수 정보 입니다')
		$('#pwdDiv').css('color','red')
		$('#pwdDiv').css('font-size','8pt')
		$('#pwdDiv').css('font-weight','bold');
		
	}else if(!pwdCheck.test($('#pwd').val())){		//pwd 형식 유효성 검사
		$('#pwdDiv').text('*영문, 숫자, 특수문자 포함(8~16자)')
		$('#pwdDiv').css('color','red')
		$('#pwdDiv').css('font-size','8pt')
		$('#pwdDiv').css('font-weight','bold');
		
	}else if($('input[name=repwd]').val() != $('input[name=pwd]').val()){
		$('#repwdDiv').text('비밀번호가 맞지 않습니다')
		$('#repwdDiv').css('color','red')
		$('#repwdDiv').css('font-size','8pt')
		$('#repwdDiv').css('font-weight','bold');
		
	}else if($('#userName').val()==''){
		$('#userNameDiv').text('필수 정보 입니다')
		$('#userNameDiv').css('color','red')
		$('#userNameDiv').css('font-size','8pt')
		$('#userNameDiv').css('font-weight','bold');
		
	}else if(!nameCheck.test($('#userName').val())){		//이름 형식 유효성 검사
		$('#userNameDiv').text('*한글만 가능합니다(2-6자)')
		$('#userNameDiv').css('color','red')
		$('#userNameDiv').css('font-size','8pt')
		$('#userNameDiv').css('font-weight','bold');
		
	}else if($('#email1').val()==''||$('#email2').val()==''){
		$('#emailDiv').text('필수 정보 입니다')
		$('#emailDiv').css('color','red')
		$('#emailDiv').css('font-size','8pt')
		$('#emailDiv').css('font-weight','bold');
		
	}else{
		$('form[name=writeForm]').submit();
	}
});

//우편번호
$('#checkPostBtn').click(function(){
	window.open("/pmang/member/checkPost", "zipcode", "width=700 height=500 scrollbars=yes");
});

$('#checkPostSearchBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/member/checkPostSearch',
		data: $('#checkPostForm').serialize(),
		dataType: 'json',
		success: function(data){
			$('#checkPostTable tr:gt(2)').remove();
			
			$.each(data.list, function(index, items){
				var address = items.sido+' '
							+ items.sigungu+' '
							+ items.yubmyundong+' '
							+ items.ri+' '
							+ items.roadname+' '
							+ items.buildingname;
				
				address = address.replace(/null/g, '');
				
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.zipcode
					
				})).append($('<td/>',{
					colspan: '3',
					}).append($('<a/>',{
						href: '#',
						id: 'addressA',
						text: address
					}))
				).appendTo($('#checkPostTable'));
			});//each
			
			$('a').click(function(){				
				$('#postcode', opener.document).val($(this).parent().prev().text());
				$('#address', opener.document).val($(this).text());
				$('#detailAddress', opener.document).focus();
				window.close();
			});
		},
		error: function(err){
			console.log(err);
		}
	});	
});