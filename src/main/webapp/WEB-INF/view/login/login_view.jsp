<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.cookie.js" type="text/javascript"></script>
<script src="./js/cookie_login.js" type="text/javascript"></script>
<script type="text/javascript">
	function MemberLogin() {
		frm = document.join;
		if (!frm.id.value) {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		if (!frm.password.value) {
			alert("비밀번호을 입력하세요.");
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="./MemberLogin.jh" method="post" id="MemberLogin()" name="join">
		아이디<input type="text" name="id" id="id">
		비밀번호<input type="text" name="password" id="password">
		<button type="submit">로그인</button>
	</form>
</body>
</html>