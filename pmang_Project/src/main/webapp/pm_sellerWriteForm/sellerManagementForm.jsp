<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 세션으로 로그인이 유지된다는 가정 하에 작성 -->
	
<link rel="stylesheet" href="/pmang/css/sellerManagement.css">

<input type="hidden" id="pg" value="1">
<input type="hidden" id="userid" value="aaaa">
<input type="hidden" id="item_seq" value="${item_seq }">
<div class="management_head">
	<nav class="management_nav">
		<div class="nav_management">
			<a class="nav_move1" href="/pmang/member/sellerWriteForm">
			상품등록
			</a>
		</div>

		<div class="nav_managementForm">
			<a class="nav_move2" href="/pmang/seller/sellerManagementForm">
			상품관리
			</a>
		</div>
	</nav>
</div>	<!-- managementHead -->

<div class="management_body">
	<main class="bodyMain">
		<header class="bodyMainHeader">
			<form class="headerInputForm">
				<input type="hidden" id="pg" vlaue="1">
				<input type="search" id="keyword" name="keyword" placeholder="상품명을 입력해주세요." value="">
				<button type="button" id="inputFormBtn" class="inputFormBtn"></button>
			</form>

			<div class="selectQtyDiv">
				<div class="selectContainer">
					<div class="selectBorder">
						<div class="selectQty">
							<div class="selectQtyBox">
							5개씩 <img src="../image/open.png" width="10" height="6"
									alt="카테고리 화살표 아이콘">
							</div>
							<div class="qtyDropbox">
								<a href="#" value="5">5개씩</a>
								<a href="#" value="10">10개씩</a>
								<a href="#" value="25">25개씩</a>
								<a href="#" value="50">50개씩</a>
							</div>
						</div>	<!-- selectQty -->
					</div>	<!-- selectBorder -->
				</div>	<!-- selectContainer -->
			</div>	<!-- selectQtyDiv -->

			<div class="selectStatusDiv">
				<div class="selectContainer">
					<div class="selectBorder">
						<div class="selectStatus">
							<div class="selectStatusBox">
							전체 <img src="../image/open.png" width="10" height="6"
									alt="카테고리 화살표 아이콘">
							</div>
							<div class="statusDropbox">
								<a href="#">전체</a>
								<a href="#">판매 중</a>
								<a href="#">예약 중</a>
								<a href="#">판매완료</a>
							</div>
						</div>	<!-- selectStatus -->
					</div>	<!-- selectBorder -->
				</div>	<!-- selectContainer -->
			</div>	<!-- selectStatusDiv -->
		</header>

		<table class="sellManagementTable" style="border-spacing: 2px;">
			<thead class="sellManagementThead">
				<tr>
					<th>사진</th>
					<th>판매상태</th>
					<th>상품명</th>
					<th>가격</th>
					<th>찜/댓글</th>
					<th>최근수정일</th>
					<th>기능</th>
				</tr>
			</thead>

			<tbody class="sellManagementTbody">
				<!-- 등록한 상품 판매글이 여기서 리스트형식으로 띄워짐 -->
				
				
			</tbody>
			</table>
	</main>

	<footer class="sellManagementFooter">
		<div class="footerPagingDiv">
		</div>
	</footer>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/sellerManagement.js"></script>	
<script type="text/javascript">
function sellerManagementPaging(pg){
	var keyword = document.getElementById("keyword").value;
	if(keyword == ""){
		location.href = 'sellerManagement?pg='+pg;
	}else{
		$('input[name=pg]').val(pg);

		//2페이지에서 다시 검색 버튼을 누르면 2페이지부터 찾으므로
		//다시 검색 버튼을 눌렀을 때는 1페이지부터 검색을 할 수 있도록 강제 이벤트를 발생시킴
		$('#inputFormBtn').trigger('click', 'research');
	}
}
</script>