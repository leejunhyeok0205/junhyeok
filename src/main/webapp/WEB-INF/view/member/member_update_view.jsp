<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form action="MemberUpdate.jh" method="post">
	<div>
		회원 코드<input type="text" name="member_code" id="member_code"
			value="${param.member_code}" readonly>
	</div>
	<div>
		회원 아이디<input type="text" name="member_id" id="member_id"
			value="${param.member_id}">
	</div>
	<div>
		회원 이름<input type="text" name="member_name" id="member_name"
			value="${param.member_name}">
	</div>
	<div>
		회원 비밀번호<input type="text" name="member_password" id="member_password"
			value="${param.member_password}">
	</div>
	<div>
		회원 이메일<input type="text" name="member_email" id="member_email"
			value="${param.member_emil}">
	</div>
	<div>
		회원 핸드폰 번호<input type="text" name="member_callnumber"
			id="member_callnumber" value="${param.member_callnumber}">
	</div>
	<div>
		회원 생년월일<input type="text" name="member_birthday" id="member_birthday"
			value="${param.member_birthday}">
	</div>
	<div>
		<div>회원 성별</div>
		남자<input type="radio" name="member_gender" id="member_gender" value="m"<c:if test="${memberDTO.gender=='m'}">checked</c:if>>
		여자<input type="radio" name="member_gender" id="member_gender" value="f" <c:if test="${memberDTO.gender=='f'}">checked</c:if>>
	</div>
	<div>
		차량번호1<input type="text" name="member_car_num1" id="member_car_num1"
			value="${param.member_car_num1}">
	</div>
	<div>
		차량번호2<input type="text" name="member_car_num2" id="member_car_num2"
			value="${param.member_car_num2}">
	</div>
	<div>
		차량번호3<input type="text" name="member_car_num3" id="member_car_num3"
			value="${param.member_car_num3}">
	</div>
	<div>
		회원 등급<input type="text" name="member_rating" id="member_rating"
			value="${param.member_rating}">
	</div>
	<button type="submit">수정</button>
	<button type="reset">취소</button>

</form>
</body>
</html>