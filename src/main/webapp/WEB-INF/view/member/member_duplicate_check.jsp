<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<c:forEach var="arrayList" items="${arrayList}">
	<c:if test="${arrayList.member_id==param.member_id}">
		<script type="text/javascript">
			alert("입력하신${param.member_id}는 이미 사용중입니다. 다시 입력해주세요");
			location.href = "./MemberInsertView.jh"
		</script>
	</c:if>
</c:forEach>
</head>
<body>
	<script type="text/javascript">
		alert("아이디 사용이 가능합니다.");
		location.href = "./MemberInsertView.jh"
	</script>
</body>
</html>