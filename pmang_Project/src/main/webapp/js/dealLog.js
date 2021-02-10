$(document).ready(function() {
	//tab메뉴
	$('.tabmenu').click(function(){
		var activeTab=$(this).attr('data-tab');
		$('li').css('border-top','1px solid transparent');
		$(this).css('border-top','2px solid green');
		$.ajax({
			type:'GET',
			url:activeTab+".jsp",
			dataType:"text",
			error:function(){
				alert('통신실패');
			},
			success:function(data){
				$('.logTabContent').html(data);
			}
		});
	});
	$('#default').click();
	
});