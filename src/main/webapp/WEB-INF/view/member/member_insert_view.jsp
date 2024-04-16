<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<div>회원 정보 입력</div>
	<div>
		<form action="MemberInsert.jh" method="post">
			<div>
				<div>아이디</div>
				<input type="text" name="member_id" id="member_id"> 중복 체크<input type="button" onclick="location.href='MemberInsertDuplicateCheck.jh'">
			</div>
			<div>
				<div>비밀번호</div>
				<input type="text" name="member_password" id="member_password">
			</div>
			<div>
			<div>이름</div>
			<input type="text" name="member_name" id="member_name">
			</div>
			<div>
			<div>이메일</div>
			<input type="text" name="member_email" id="member_email">
			</div>
			<div>
			<div>전화번호</div>
			<input type="text" name="member_callnumber" id="member_callnumber">
			</div>
			<div>
			<div>생년월일</div>
			<input type="text" name="member_birthday" id="member_birthday">
			</div>
			<div>
			<div>성별</div>
			남자<input type="radio" name="member_gender" id="member_gender" value="m">
			여자<input type="radio" name="member_gender" id="member_gender" value="f">
			</div>
			<div>
			<div>차량번호</div>
			<input type="text" name="member_car_num1" id="member_car_num1">
			<input type="text" name="member_car_num2" id="member_car_num2">
			<input type="text" name="member_car_num3" id="member_car_num3">
			</div>
			<button type="submit">등록</button>
			<button type="reset" onclick="location.href='./Main.jh'">취소</button>
		</form>
	</div>
</body>
</html>