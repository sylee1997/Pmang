<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<!-- 아래에서 data-toggle과 data-target 속성에서 data-toggle에는 modal 값을 data-target속성에는 모달 창 전체를 

감싸는 div의 id 이름을 지정하면 된다. -->

	&nbsp;&nbsp;
	<a data-toggle="modal" href="#myModal">모달 창 열기</a>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<h4 class="modal-title">피망 회원가입</h4>
				</div>
				<div class="modal-body">
					<!-- 회원가입 폼 -->
					<div class="container-fluid">
						<br>
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10" style="text-align: center">
								<form action="#" method="post">
									<table class="table table-hover">
										<thead>
											<tr>
												<th colspan="2">회원가입</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="vertical-align: middle;">아이디</td>
												<td>
													<div class="form-group">
														<input type="text" class="form-control" maxlength="50" 
															placeholder="아이디 입력" name="id" id="id">
														<input type="hidden" id="check" value="">
														<div id="idDiv" align="left"></div>
													</div>
												</td>
											</tr>
											
											<tr>
												<td style="vertical-align: middle;">비밀번호</td>
												<td>
													<div class="form-group">
														<input type="password" class="form-control" maxlength="50"
															placeholder="비밀번호 입력" name="pwd" id="pwd">
														<div id="pwdDiv" align="left"></div>
													</div>
												</td>
											</tr>
											
											<tr>
												<td style="vertical-align: middle;">비밀번호 재확인</td>
												<td>
													<div class="form-group">
														<input type="password" class="form-control" maxlength="50" 
															placeholder="비밀번호 재입력" name="repwd" id="repwd">
														<div id="repwdDiv" align="left"></div>
													</div>
												</td>
											</tr>
											
											<tr>
												<td style="vertical-align: middle;">성별</td>
												<td  align="left">
													<div class="radio-inline">
														<input type="radio" name="gender" value="0" checked>남  &emsp;
													</div>
													<div class="radio-inline">
														<input type="radio" name="gender" value="1">여
													</div>
												</td>
											</tr>

											<tr>
												<td style="vertical-align: middle;">이메일</td>
												<td>
													<div class="form-inline" align="left">
														<input type="text" class="form-control input-sm" name="email1" style="width: 100px;"> @ 
														<input type="email" class="form-control input-sm" name="email2" list="email2" style="width: 110px;" placeholder="직접입력"> 
															<datalist id="email2">
																<option value="gmail.com">
																<option value="naver.com">
																<option value="hanmail.net">
															</datalist>&emsp;
														<button class="btn btn-primary" id="autoBtn" type="button">인증</button>	
														<!-- 회원가입 창에서 인증을 할 경우 상위 코드 주석을 제거해주세요 -->
													</div>
												</td>
											</tr>

											<tr>
												<td style="vertical-align: middle;">핸드폰</td>
												<td>
													<div class="form-inline" align="left">
														<select name="tel1" class="form-control" style="width: 80px;">
																<option value="010">010
																<option value="011">011
																<option value="019">019
														</select> - 
														<input type="text" class="form-control" name="tel2" style="width: 80px;"> - 
														<input type="text" class="form-control" name="tel3" style="width: 80px;">
													</div>
												</td> 
											</tr>

											<tr>
												<td style="vertical-align: middle;">주소</td>
												<td>
													<div class="form-group">
														<div class="form-inline" align="left">
															<input type="text" class="form-control" id="postcode" name="zipcode" style="width: 80px; margin: 2px 0px;" readonly>
															<button class="btn btn-primary" type="button" id="checkPostBtn" style="text-align: center; width: 110px;">우편번호검색</button>
														</div>
														<input type="text" class="form-control" id="address" name="addr1" maxlength="50" style="margin: 2px 0px;" placeholder="주소" readonly> 
														<input type="text" class="form-control" id="detailAddress" name="addr2" maxlength="50" style="margin: 2px 0px;" placeholder="상세주소">
													</div>
												</td>
											</tr>

											<tr>
												<td></td>
												<td align="left">
													<div class="form-group">
														<button class="btn btn-primary" id="writeBtn" type="button">회원가입</button> &emsp;&emsp;
														<button class="btn btn-primary" type="reset">초기화</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
					<!-- 사용자 지정 부분 : 텍스트 메시지 -->

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>

			</div>

		</div>

	</div>



	<br />
	<br />

	

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

</body>

</html>


-
