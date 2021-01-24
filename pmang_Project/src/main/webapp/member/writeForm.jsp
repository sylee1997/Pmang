<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/pmang/css/memWrite.css">

<!-- 부트스트랩을 사용할 수 있도록 가져오기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<div id="wrap">
		<br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
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
										placeholder="아이디 입력" name="userId" id="userId"> 
								<input type="hidden" id="check" value="">
								<div id="userIdDiv" align="left"></div>
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
						<td style="vertical-align: middle;">이름</td>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" maxlength="50" 
										placeholder="이름 입력" name="userName" id="userName"> 
								<input type="hidden" id="check" value="">
								<div id="userNameDiv" align="left"></div>
							</div>
						</td>
					</tr>
	
					<tr>
						<td style="vertical-align: middle;">성별</td>
						<td align="left">
							<div class="radio-inline">
								<input type="radio" name="gender" value="0" checked>남
								&emsp;
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
								<input type="text" class="form-control input-sm" name="email1" id="email1"> 
								@ 
								<input type="email" class="form-control input-sm" name="email2" id="email2">
								<select class="form-control input-sm" name="selection" onChange="selectEmail(this)">
									<option value="1">직접 입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
								<button class="btn btn-primary" id="authBtn" type="button">인증</button>
								<div id="emailDiv" align="left"></div>
							</div>
						</td>
					</tr>
	
					<tr>
						<td style="vertical-align: middle;">핸드폰</td>
						<td>
							<div class="form-inline" align="left">
								<select class="form-control" name="tel1" id="tel1">
									<option value="010">010
									<option value="011">011
									<option value="019">019
								</select>
								 - 
								<input type="text" class="form-control" name="tel2" id="tel2">
								 - 
								<input type="text" class="form-control" name="tel3" id="tel3">
							</div>
							<div id="telDiv" align="left"></div>
						</td> 
					</tr>
	
					<tr>
						<td style="vertical-align: middle;">주소</td>
						<td>
							<div class="form-group">
								<div class="form-inline" align="left">
									<input type="text" class="form-control" id="postcode" name="zipcode" readonly>
									<button class="btn btn-primary" type="button" id="checkPostBtn">우편번호검색</button>
								</div>
								<input type="text" class="form-control" id="address" name="addr1" maxlength="50" placeholder="주소" readonly> 
								<input type="text" class="form-control" id="detailAddress" name="addr2" maxlength="50" placeholder="상세주소">
							</div>
						</td>
					</tr>
	
					<tr>
						<td></td>
						<td align="right">
							<div class="form-group">
								<button class="btn btn-primary" id="writeBtn" type="button">회원가입</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/pmang/js/member.js"></script>
	
</body>

</html>