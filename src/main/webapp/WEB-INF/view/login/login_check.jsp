<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${memberDTO.member_id == ''}">
			<script type="text/javascript">
				alert("가입되지 않은 아이디입니다.");
				history.back();
			</script>
		</c:when>
		<c:when test="${memberDTO.member_password == ''}">
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("로그인 성공");
				location.href = "./Main.jh";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>