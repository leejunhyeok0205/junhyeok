<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 회원 정보</title>
</head>
<body>
	<header>
					<h1>상세 회원 정보</h1>
	</header>
	<section></section>
	<section>
		<div>
			<div>
				<div>
					<div>
						<div>
							<h5>상세 회원 보기</h5>
						</div>
						<div>
							<table>
								<thead>
									<tr>
										<th>회원 코드</th>
										<th>회원 아이디</th>
										<th>회원 이름</th>
										<th>회원 비밀번호</th>
										<th>회원 이메일</th>
										<th>회원 핸드폰 번호</th>
										<th>회원 생일</th>
										<th>회원 성별</th>
										<th>회원 가입일</th>
										<th>회원 차번호1</th>
										<th>회원 차번호2</th>
										<th>회원 차번호3</th>
										<th>회원 등급</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${memberDTO.member_code}</td>
										<td>${memberDTO.member_id}</td>
										<td>${memberDTO.member_name}</td>
										<td>${memberDTO.member_password}</td>
										<td>${memberDTO.member_email}</td>
										<td>${memberDTO.member_callnumber}</td>
										<td>${memberDTO.member_birthday}</td>
										<td>${memberDTO.member_gender}</td>
										<td>${memberDTO.member_joinday}</td>
										<td>${memberDTO.member_car_num1}</td>
										<td>${memberDTO.member_car_num2}</td>
										<td>${memberDTO.member_car_num3}</td>
										<td>${memberDTO.member_rating}</td>
									</tr>
								</tbody>
							</table>
							<div>
								<div>
									<a href="./MemberSelect.jh">
										회원 목록 </a>
								</div>
								<div>
									<a href="./MemberUpdateView.jh?member_code=${memberDTO.member_code}"
										> 회원 수정 </a>
								</div>
								<div>
									<a href="./MemberDeleteView.jh?member_code=${memberDTO.member_code}"
										> 회원 삭제 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>