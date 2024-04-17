<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#update").submit(function() {
						if (!$("input[name='member_id']").val()) {
							alert("아이디를 입력하세요.");
							$("input[name='member_id']").focus();
							return false;
						}
						var regexp_member_id = /^[a-zA-Z0-9]{8,20}$/;
						var member_id_check = $("input[name='member_id']").val();
						if (!regexp_member_id.test(member_id_check)) {
							alert("아이디에 공백을 제외한 8~20자만 입력할 수 있습니다.");
							$("input[name='member_id']").focus();
							return false;
						}

						if (!$("input[name='member_password']").val()) {
							alert("비밀번호를 입력하세요.");
							$("input[name='member_password']").focus();
							return false;
						}
						var regexp_member_password = /^[a-zA-Z0-9]{6,20}$/;
						var member_password_check = $("input[name='member_password']").val();
						if (!regexp_member_password.test(member_password_check)) {
							alert("비밀번호는 공백을 제외한 6~20자만 입력할 수 있습니다.");
							$("input[name='member_passowrd']").focus();
							return false;
						}

						if (!$("input[name='member_name']").val()) {
							alert("이름을 입력하세요.");
							$("input[name='name']").focus();
							return false;
						}
						var regexp_name = /^[가-힣]{2,4}$/;
						var name_check = $("input[name='member_name']").val();
						if (!regexp_name.test(name_check)) {
							alert("이름은 공백을 제외한 한글 2~4자만 입력할 수 있습니다.");
							$("input[name='member_name']").focus();
							return false;
						}

						if (!$("input[name='member_email']").val()) {
							alert("이메일을 입력하세요.");
							$("input[name='member_email']").focus();
							return false;
						}
						var regexp_member_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
						var member_email_check = $("input[name='member_email']").val();
						if (!regexp_member_email.test(member_email_check)) {
							alert("올바른 이메일 형식이 아닙니다.");
							$("input[name='member_email']").focus();
							return false;
						}

						if (!$("input[name='member_callnumber']").val()) {
							alert("전화번호를을 입력하세요.");
							$("input[name='member_callnumber']").focus();
							return false;
						}
						var regexp_member_callnumber = /^\d{3}-\d{3,4}-\d{4}$/i;
						var member_callnumber_check = $("input[name='member_callnumber']").val();
						if (!regexp_member_callnumber.test(member_callnumber_check)) {
							alert("올바른 전화번호 형식이 아닙니다. 예)000-0000-0000");
							$("input[name='member_callnumber']").focus();
							return false;
						}

						if (!$("input[name='member_birthday']").val()) {
							alert("생년월일을 입력하세요.");
							$("input[name='member_birthday']").focus();
							return false;
						}
						var regexp_member_birthday = /^[0-9]{8,8}$/;
						var member_birthday_check = $("input[name='member_birthday']").val();
						if (!regexp_member_birthday.test(member_birthday_check)) {
							alert("올바른 생년월일 형식이 아닙니다. 예)19990205");
							$("input[name='member_birthday']").focus();
							return false;
						}

						if (!$("input[name='member_gender']").is(":checked")) {
							alert("성별을 선택해 주세요.");
							$("input[name='member_gender']:eq(0)").focus();
							return false;
						}

						if (!$("input[name='member_car_num1']").val()) {
							alert("차량번호를 입력하세요.");
							$("input[name='member_car_num1']").focus();
							return false;
						}
						var regexp_member_car_num1 = /^[0-9]{2,3}[ㄱ-ㅎ가-힣][0-9]{4}$/;
						var member_car_num1_check = $("input[name='member_car_num1']").val();
						if (!regexp_member_car_num1.test(member_car_num1_check)) {
							alert("올바른 차량번호 형식이 아닙니다.");
							$("input[name='member_car_num1']").focus();
							return false;
						}
					});
});
</script>
</head>
<body>
	<form action="MemberUpdate.jh" method="post" id="update">
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