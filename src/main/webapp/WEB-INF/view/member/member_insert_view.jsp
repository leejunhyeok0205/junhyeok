<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function( ) {
	
$("#dbidCheck").click(function( ) {
	var id = $('#member_id').val( );
	$.ajax({
		url : './IdCheck.jh', 
		type : 'get', 
		data : {'member_id' : id},
		success : function(result) {
			console.log("아이디 값 - " + result);
			if($.trim(result) == 1) {
				alert("이미 등록된 아이디입니다.");
				$("#member_id").focus( );
			}else{
				alert("등록되지 않은 아이디입니다.");
				$('#idCheck').val("1");
				$("#member_name").focus( );
				}
			}
		}); 
	});
	$("input[id='member_id']").on("change", function( ) {
		$("#idCheck").val(0);
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#join").submit(function() {
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
	<div>회원 정보 입력</div>
	<div>
		<form action="MemberInsert.jh" method="post" id="join">
			<div>
				<div>아이디</div>
				<input type="text" name="member_id" id="member_id"> <button type="button" id="dbidCheck"> 아이디 체크 </button> <input type="hidden" name="idCheck" id="idCheck">
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
				남자<input type="radio" name="member_gender" id="member_gender"
					value="m"> 여자<input type="radio" name="member_gender"
					id="member_gender" value="f">
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