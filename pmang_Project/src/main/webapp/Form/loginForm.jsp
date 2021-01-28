<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.modal-dialog.modal-80size {
	width: 530px;
	height: 80%;
	margin: 0;
	padding: 0;
}

.modal-content.modal-80size {
	height: auto;
	min-height: 80%;
}

.modal.modal-center {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}

button {
	background: inherit;
	float: left;
	border: 1px solid black;
	border-radius: 5px;
	padding: 5px 40px;
	overflow: visible;
	cursor: pointer;
}

button div {
	display: flex;
	align-items: center;
}

button div img {
	width: 30px;
	height: 30px;
}

button div p {
	font-size: 15px;
	font-weight: 700;
	margin-left: 20px;
}

#saveId, #searchId, #kakaoLogin {
	text-align: left;
}

#searchId {
	cursor: pointer;
}
</style>
<!-- 모달 사용할수있도록 끌고오기 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

	<!-- modal 구동 버튼 (trigger) -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#my80sizeCenterModal">모달로그인</button>


	<!-- Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal"
		tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">피망 로그인</h4>
				</div>
				<div class="modal-body">
					<!-- 로그인폼 -->
					<div class="container-fluid">
						<br>
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10" style="text-align: center">
								<form action="#" method="post">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>아이디</th>
											</tr>
										</thead>
										<thead>
											<tr>
												<td>
													<div class="form-group">
														<input type="text" class="form-control" placeholder="ID"
															width="1" name="userId" id="userId">
													</div>
												</td>
											</tr>
										</thead>
										<thead>
											<tr>
												<th>비밀번호</th>
											</tr>
										</thead>
										<thead>
											<tr>
												<td>
													<div class="form-group">
														<input type="password" class="form-control" maxlength="10"
															placeholder="Password" name="pwd" id="pwd">
													</div>
												</td>
											</tr>
										</thead>
										<thead>
											<tr>
												<td>
													<div id="loginBtn">
														<input type="button" style="WIDTH: 250pt; HEIGHT: 30pt"
															value="Login">
													</div>

													<div id="saveId">
														<input type="checkbox" name="saveId" value="saveId">아이디
														저장
													</div> <br>
													<div id="searchId">아이디 찾기 / 비밀번호 찾기</div> <br>

													<button style="width: 290pt; background-color: yellow;">
														<div id="kakaoWrite">
															<img src="./image//kakao_icon.png" alt="kakao_icon" />
															<p>카카오 1초 로그인/회원가입</p>
														</div>
													</button>
													<button style="width: 290pt; background-color: green; margin-top:13px;">
														<div id=memberWrite>
															<img src="./image//kakao_icon.png" alt="kakao_icon" />
															<p>일반 회원가입</p>
														</div>
													</button>
												</td>
										</thead>
									</table>
								</form>
							</div>
						</div>
					</div>
					<!-- 로그인폼 end -->
				</div>



			</div>
		</div>
	</div>




</body>

</html>



