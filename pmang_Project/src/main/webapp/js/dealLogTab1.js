$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'/pmang/board/getbuyLog',
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			
			$.each(data.list,function(index,items){
				$('<div/>').append($('<a/>',{
					href:'#',//해당 게시글로 가야함.
				}).append($('<span/>',{
					id:'buyLogImg'
				}).append($('<img src="../image/" width="96" height="96"/>'))).
				append($('<span/>',{
					id:'buyLogInfo'
				}).append($(''))))
			});
		}
	});
});