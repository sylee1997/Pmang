<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 탭메뉴 구현할때 참고링크 -->
<!-- https://mynameisljy.tistory.com/2 -->

<link rel="stylesheet" href="/pmang/css/mystore.css">
<link rel="stylesheet" href="/pmang/css/report.css">
<link rel="stylesheet" href="/pmang/css/admin.css">

<!-- <input type="hidden" id="memid" value="2"> -->
<!-- 나중에 세션값 넣어줘야함 통일해야돼(이거는 일반회원!!) -->
<input type="hidden" id="memid" value="admin">
<!-- 나중에 세션값 넣어줘야함 통일해야돼(이거는 관리자!!) -->

	<c:if test="${memid==admin }">
		<!-- *************************관리자 ********************************** -->

		<div class="mystoreContainer">
			<div class="mystoreProfile">
				<div class="mystoreProfileImg" id="mystoreProfileImg">

					<img id="profileImg" alt="내상점프로필사진" src="../image/main_logo.JPG">
				</div>
				<!-- mystoreProfileImg -->
				<div id="adminName" style="font-family: sans-serif;">
					<h3>피망마켓 관리자</h3>
				</div>
				<!-- mystoreName -->

				<!-- mystoreBtns -->
			</div>
			<!-- mystoreProfile -->
			<div class="mystoreInfo">
				<div id="mystoreInfoName">
					<div class="admininfoName">
						<span>피망마켓 관리자</span>
					</div>
				</div>
				<!-- mystoreInfoName -->
				<div id="mystoreSpec">
					<div id="mystoreSpec2">
						<img src="/pmang/image/pixelHeart.png" width="14" height="13">총
						회원 수
						<div id="adminUserCnt"></div>
						<!-- mystoreOpenDate -->
					</div>
					<!-- mystoreSpec2 - mystoreOpenDate -->
					<div id="mystoreSpec2">
						<img src="../image/pixelHeart.png" width="14" height="13">총
						판매 글
						<div id="adminItemCnt"></div>
						<!-- mystoreHit -->
					</div>
					<!-- mystoreSpec2 - mystoreHit -->
					<!-- <div id="mystoreSpec2">
						<img src="../image/pixelHeart.png" width="14"
							height="13">오늘 방문자
						<div id="adminTodayCnt"></div>
						mystoreSold
					</div>
					mystoreSpec2 - mystoreSold -->
				</div>
				<!-- mystoreSpec -->
				<div class="reportDeleteTargetDiv">
					<span style="font-weight: bold; font-size: 13pt;">신고 3회 이상
						받은 회원 </span>
				</div>
				<div class="adminUserDelete">

					<button id="adminUserDeleteBtn">회원 강제 탈퇴</button>
				</div>
			</div>
			<!--mystoreInfo-->

			<div id="adminTab">
				<ul class="tab">
					<li data-tab="adminTab1" class="tabmenu" id="default"><a
						href="#">신고 리스트</a></li>
					<li data-tab="adminTab2" class="tabmenu" id="adminUser"><a
						href="#">공지사항 작성하기</a></li><!-- 전체 회원 관련 통계 -->
					<!-- 로그인 했을때만 보이는 탭메뉴  -->
					<!-- <li data-tab="adminTab3" class="tabmenu" id="adminSold"><a
						href="#">판매 관련 통계</a></li> -->
				</ul>
				<div id="tabContent"></div>
			</div>
			<!-- mystoreTab -->
		</div>
		<!-- mystoreContainer -->

	</c:if>
	<!-- *************************관리자 ********************************** -->

		<c:if test="${memid != admin }">
			<form id="mystoreForm">
			<div class="mystoreContainer">
				<div class="mystoreProfile">
					<div class="mystoreProfileImg" id="mystoreProfileImg">
						<!-- 	<input type="file" class="profileImgModify" name="img" accept="image/jpg, image/jpeg, image/png"> -->
						<!-- <img id="profileImg" alt="내상점프로필사진" src="../image/defaultProfile.png" width="100%"> -->
					</div>
					<!-- mystoreProfileImg -->
					<div id="mystoreName" style="font-family: sans-serif;">
						<h3></h3>
					</div>
					<!-- mystoreName -->
					<div id="mystoreBtns">
						<button onclick="window.location.href='#'">내 상점 관리</button>
					</div>
					<!-- mystoreBtns -->
				</div>
				<!-- mystoreProfile -->
				<div class="mystoreInfo">
					<div id="mystoreInfoName">
						<div class="infoName">
							<span></span>
						</div>
						<div id="storeNameModify">
							<!-- <button id="storeNameEditBtn">상점명 수정</button> -->
						</div>
						<!-- storeNameModify -->
						<!-- <div id="storeNameModify1">
					<button id="storeNameEditBtn1">확인</button>
				</div> -->
						<!-- storeNameModify1 -->
					</div>
					<!-- mystoreInfoName -->
					<div id="mystoreSpec">
						<div id="mystoreSpec2">
							<img src="/pmang/image/mystoreOpen.jpg" alt="상점오픈일" width="14"
								height="13">상점 오픈일
							<div id="mystoreOpenDate"></div>
							<!-- mystoreOpenDate -->
						</div>
						<!-- mystoreSpec2 - mystoreOpenDate -->
						<div id="mystoreSpec2">
							<img src="../image/mystoreHit.jpg" alt="상점방문수" width="14"
								height="13">상점 방문수
							<div id="mystoreHit"></div>
							<!-- mystoreHit -->
						</div>
						<!-- mystoreSpec2 - mystoreHit -->
						<div id="mystoreSpec2">
							<img src="../image/mystoreSold.jpg" alt="상점판매수" width="14"
								height="13">상품판매수
							<div id="mystoreSold">
								<span></span>
							</div>
							<!-- mystoreSold -->
						</div>
						<!-- mystoreSpec2 - mystoreSold -->
					</div>
					<!-- mystoreSpec -->
					<div id="mystoreIntroduce">
						<textarea disabled readonly
							style="background: transparent; font-family: sans-serif;"></textarea>
					</div>
					<!-- mystoreIntroduce -->
					<div id="introEdit">
						<button id="myBtn" style="font-size: 10pt;">
							<img src="/pmang/image/reportAlert.png" style="margin-top: 3px;"
								width="13" height="13" alt="신고하기 버튼">신고하기
						</button>
						<button id="storeIntroEditBtn">내상점 정보 수정</button>
						<a href="#" id="memberInfoModify">회원 정보 수정</a>
					</div>
					<!-- introEdit -->
					<div class="introEdit1">
						<button id="storeIntroBtn">확인</button>
					</div>
					<!-- introEdit1 -->



				</div>
				<!--mystoreInfo-->

				<div id="mystoreTab">
					<ul class="tab">
						<li data-tab="mystoreTab1" class="tabmenu" id="default"><a
							href="#">상품<span></span></a></li>
						<li data-tab="mystoreTab2" class="tabmenu" id="wish"><a
							href="#">찜<span></span></a></li>
						<!-- 로그인 했을때만 보이는 탭메뉴  -->
						<li data-tab="mystoreTab3" class="tabmenu" id="re"><a
							href="#">상점후기<span></span></a></li>
					</ul>
					<div id="tabContent"></div>
				</div>
				<!-- mystoreTab -->
			</div>
			<!-- mystoreContainer -->

			<!-- The Modal -->
			<div id="myModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>
					<div class="report">
						<div class="report-header">
							<div class="report-subject" style="font-size: 10pt">신고하기</div>
						</div>
						<div class="report-content">
							<div class="report-ad">
								<div class="report-ad-div report-common">
									광고(교신 및 상점홍보)
									<button type="button">
										<img src="/pmang/image/reportV.png" width="13" height="8"
											alt="화살표 아이콘">
									</button>
								</div>
								<div class="hide report-hide-common">
									<div class="report-ad-ad">
										<button type="button">교환신청</button>
									</div>
									<div class="report-ad-ad">
										<button type="button">상점홍보</button>
									</div>
									<div class="report-ad-ad">
										<button type="button">타사이트,어플광고</button>
									</div>
									<div class="etc">
										<input type="text" placeholder="기타(사유)">
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="report-un">
								<div class="report-un-div report-common">
									거래비매너(거래파기,늦은배송)
									<button type="button">
										<img src="/pmang/image/reportV.png" width="13" height="8"
											alt="화살표 아이콘">
									</button>
								</div>
								<div class="hide report-hide-common">
									<div class="report-un-ad">
										<button type="button">거래파기</button>
									</div>
									<div class="report-un-ad">
										<button type="button">늦은배송</button>
									</div>
									<div class="report-un-ad">
										<button type="button">불친절한 응대</button>
									</div>
									<div class="etc">
										<input type="text" placeholder="기타(사유)">
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="report-dan">
								<div class="report-dan-div report-common">
									거래 금지 품목
									<button type="button">
										<img src="/pmang/image/reportV.png" width="13" height="8"
											alt="화살표 아이콘">
									</button>
								</div>
								<div class="hide report-hide-common">
									<div class="report-dan-ad">
										<button type="button">담배/주류</button>
									</div>
									<div class="report-dan-ad">
										<button type="button">장물(분실폰,분실노트북,..)</button>
									</div>
									<div class="report-dan-ad">
										<button type="button">의약품류</button>
									</div>
									<div class="report-dan-ad">
										<button type="button">콘텍트 렌즈</button>
									</div>
									<div class="etc">
										<input type="text" placeholder="기타(사유)">
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="report-viol">
								<div class="report-viol-div report-common">
									언어폭력(비방,욕설,성희롱)
									<button type="button">
										<img src="/pmang/image/reportV.png" width="13" height="8"
											alt="화살표 아이콘">
									</button>
								</div>
								<div class="hide report-hide-common">
									<div class="report-viol-ad">
										<button type="button">비방/욕설</button>
									</div>
									<div class="report-viol-ad">
										<button type="button">성희롱</button>
									</div>
									<div class="report-viol-ad">
										<button type="button">리뷰(별점평가)요구 및 테러</button>
									</div>
									<div class="etc">
										<input type="text" placeholder="기타(사유)">
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="report-write">
								<div class="report-write-div report-common">
									기타사유(직접입력)
									<button type="button">
										<img src="/pmang/image/reportV.png" width="13" height="8"
											alt="화살표 아이콘">
									</button>
								</div>
								<div class="hide report-hide-common">
									<div class="report-write-ad">
										<textarea></textarea>
										<div class="resiDiv">
											<button id="report-pr-write" type="button">등록</button>
										</div>
									</div>
								</div>
							</div>
							<div class="report-qna">
								<div class="report-qna-div">
									거래사기(1:1문의하기)
									<button id="report-operator" type="button">1:1문의하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 신고하기 모달 -->
	</form>

<!-- 프로필 사진 변경 폼 -->
<form name="signform" method="post" enctype="multipart/form-data"
	action="/pmang/board/profileImgModify">
	<input type="file" class="/pmang/board/profileImgModify" id="img"
		name="img" style="display: none;"
		accept="image/jpg, image/jpeg, image/png"
		onchange="javascript:changeValue(this);" /> <input type="hidden"
		id="target_url">
</form>
	</c:if>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/pmang/js/mystore.js"></script>
<script type="text/javascript" src="/pmang/js/report.js"></script>
<script type="text/javascript" src="/pmang/js/admin.js"></script>
<script>
	function changeValue(obj) {
		//var file=obj.target.file;
		alert(obj);
		document.signform.submit();

	}

	//tab
	$(document)
			.ready(
					function() {

						$('.introEdit1').hide();
						$('#storeNameModify1').hide();

						$
								.ajax({
									type : 'post',
									url : '/pmang/board/getMystore',
									dataType : 'json',
									success : function(data) {
										//alert(JSON.stringify(data));

										//세션이랑 유저아이디랑 같을시 내상점정보변경버튼,회원정보버튼이 보여야함
										//아닐경우에는 숨기고, 신고하기버튼만 보이도록해야함
										if ($('#memid').val() == data.sellerDTO.userid) {
											$('#storeIntroEditBtn').show();
											$('#memberInfoModify').show();
											$('#myBtn').hide();
											$('li#wish').show();
										} else {
											$('#storeIntroEditBtn').hide();
											$('#memberInfoModify').hide();
											$('#myBtn').show();
											$('li#wish').hide();
										}

										$('.infoName span').text(
												data.sellerDTO.marketname);
										$('#mystoreName h3').text(
												data.sellerDTO.marketname);
										$('#mystoreHit')
												.text(
														data.sellerDTO.markethit
																+ " 명");
										$('#mystoreIntroduce textarea').text(
												data.sellerDTO.pf_content);

										//상점 오픈일 날짜 계산
										var openDate = new Date(
												data.sellerDTO.marketdate);
										var today = new Date();
										var dateDiff = Math
												.ceil((today.getTime() - openDate
														.getTime())
														/ (1000 * 3500 * 24));

										$('#mystoreOpenDate').text(
												dateDiff + '일전');

										var str = '<img class="pf_photo" src="'+data.sellerDTO.pf_photo+'" width=150 height=150/>';
										$(str).appendTo('.mystoreProfileImg');

										//프로필사진변경
										$('.pf_photo')
												.on('click',
														function(e) {
															//alert('클릭');
															document.signform.target_url.value = $(
																	'.pf_photo')
																	.attr('src');
															alert(document.signform.target_url.value);
															e.preventDefault();
															$(
																	'input[type=file]')
																	.click();
														});

									},
									error : function(err) {
										console.log(err);
									}
								});

						//관리자
						$.ajax({
							type : 'post',
							url : '/pmang/board/getAdmin',
							dataType : 'json',
							success : function(data) {
								//alert(JSON.stringify(data));
								//alert(data.adminDTO.userCount+''+data.adminDTO.itemCount);

								$('#adminUserCnt').text(
										data.adminDTO.userCount + '명');
								$('#adminItemCnt').text(
										data.adminDTO.itemCount + '개');

							},
							error : function(err) {
								console.log(err);
							}
						});

						//신고 3회이상 당한 회원 리스트
						$.ajax({
							url:'/pmang/board/getReportTarget',
							dataType:'json',
							success:function(data){
								console.log(JSON.stringify(data));
								$.each(data.list,function(index,items){
									$('<div/>').append($('<span/>',{
										text:items
									})).appendTo($('.reportDeleteTargetDiv'))
								});
							}
						});
					});
			
			$('#adminUserDeleteBtn').click(function(){
				window.open("/pmang/member/adminUserDeleteForm","회원 강제 탈퇴","width=450 height=150");
			});
					
			// tab operation
						$('.tabmenu').on('click',function() {
									var activeTab = $(this).attr('data-tab');
									$('li').css('background-color',
											'rgb(250, 250, 250)').css(
											'border-top',
											'2px solid transparent');
									$(this).css('background-color', 'white')
											.css('border-top',
													'2px solid green');

									$.ajax({
										type : 'GET', //get방식으로 통신
										url : "/pmang/board/" + activeTab, //탭의 data-tab속성의 값으로 된 jsp파일로 통신
										dataType : "text", //text형식으로 값 읽기
										error : function(err) { //통신 실패시
											alert('통신실패!');
											alert(activeTab);
										},
										success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
											alert(data);
											$('#tabContent').html(data);
										}
									});
								});
						$('#default').click();

				
</script>