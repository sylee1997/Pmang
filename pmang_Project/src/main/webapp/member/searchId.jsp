<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>

<body>
	<div class="contact-clean">
		<form>
        <fieldset>
          <legend>아이디 찾기</legend>
          이름과 가입 이메일을입력해 주시면 
          <br>아이디를 찾으실 수 있습니다. (앞 5자리만 표시)<br>
            <br>
            <table>
              <tr>
                <td>이름</td>
                <td>
                <input type="text" size="10" name="userName" id="userName" placeholder="이름">
                <div id="userNameDiv" align="left"></div>
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
          <button class="btn btn-primary" onclick="findId(event)">아이디찾기</button>
          <br><br>아이디는 : <p style="color:red;" id="resultId"></p>
      </fieldset>
		</form>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/pmang/js/searchId.js"></script>
    </body>

</html>