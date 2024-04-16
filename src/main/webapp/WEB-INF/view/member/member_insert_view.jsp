<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
function MemberInsert() {
	
	mi = document.join;
	
	if (!mi.member_id.value) {
		alert("아이디를 입력하세요.");
		mi.member_id.focus();
		return false;
	}
	if (!mi.member_name.value) {
		alert("이름을 입력하세요.");
		mi.member_name.focus();
		return false;
	}
	if (!mi.member_password.value) {
		alert("비밀번호를 입력하세요.");
		mi.member_password.focus();
		return false;
	}
	if(!mi.member_email.value){
		alert("이메일을 입력하세요.");
		mi.member_email.focus();
	}
	x = document.myForm.Member_email.value;
	atpos = x.indexOf("@");
	dotpos = x.lastIndexOf(".");
	if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
		alert("E-mail 형식이 아닙니다.");
		return false;
	}
	if(!mi.member_callnumber.value){
		alert("핸드폰 번호를 입력하세요.");
		mi.member_callnumber.focus();
	}
	if(!mi.member_birthday.value){
		alert("생년월일을 입력하세요.");
		mi.member_birthday.focus();
	}
	if(!mi.member_birthday.value){
		alert("생년월일을 입력하세요.");
		mi.member_birthday.focus();
	}
	chk = false;
	for(i=0;i<mi.member_gender.length; i++){
		if(mi.member_gerder[i].checked){
			chk = true;
			break;
		}
	}
	if(!chk){
		alert("성별을 선택하세요.");
		mi.member_gender[0].focus();
		return false;
	}
	if(confirm("회원가입을 하시겠습니까?")){
		mi.submit();
	}
}
</script>
</head>
<body>
	<div>회원 정보 입력</div>
	<div>
		<form action="MemberInsert.jh" method="post" name="myForm">
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