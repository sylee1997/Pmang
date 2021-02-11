<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<body>
	<div class="contact-clean">
		<form>
        <fieldset>
          <legend>비밀번호 찾기</legend>
				아이디와 이메일주소를 입력하시면,<br> 입력하신 이메일로 임시비밀번호를 보내드립니다<br>
				<br>임시비밀번호로 로그인 후 비밀번호를 변경해 주세요<br>
				<br>
            <table>
              <tr>
                <td>아이디</td>
                <td>
                <input type="text" size="10" name="userId" id="userId" placeholder="아이디">
                <div id="userIdDiv" align="left"></div>
                </td>
              </tr>
              <tr>
                <td>이메일</td>
                <td><input type="text" size="10" name="email1" id="email1">@<input type="text" size="10" name="email2" id="email2"><select class="form-control input-sm" name="selection" onChange="selectEmail(this)">
						<option value="1">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
				<div id="emailDiv" align="left"></div>
					</td>
              </tr>
            </table>
            <br>
				<button class="btn btn-primary" onclick="findPwd(event)">임시비밀번호 발송</button>
			<p id="resultId"></p>
      </fieldset>
		</form>
	</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="/pmang/js/searchPw.js"></script>
    </body>

</html>