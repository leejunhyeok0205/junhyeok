<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>회원 관리</h1>
				</div>
			</div>
		</div>
	</header>
	<section class="py-4 mb-4 bg-light"></section>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>회원 목록</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>사용자 코드</th>
										<th>사용자 ID</th>
										<th>사용자 이름</th>
										<th>사용자 이메일</th>
										<th>사용자 전화번호</th>
										<th>사용자 생년월일</th>
										<th>사용자 성별</th>
										<th>사용자 가입일</th>
										<th>사용자 차량번호1</th>
										<th>사용자 차량번호2</th>
										<th>사용자 차량번호3</th>
										<th>사용자 등급</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="arrayList" items="${arrayList}">
										<tr class="text-center">
											<td>${arrayList.member_code}</td>
											<td>${arrayList.member_id}</td>
											<td>${arrayList.member_name}</td>
											<td>${arrayList.member_email}</td>
											<td>${arrayList.member_callnumber}</td>
											<td>${arrayList.member_birthday}</td>
											<td>${arrayList.member_gender}</td>
											<td>${arrayList.member_joinday}</td>
											<td>${arrayList.member_car_num1}</td>
											<td>${arrayList.member_car_num2}</td>
											<td>${arrayList.member_car_num3}</td>
											<td>${arrayList.member_rating}</td>
											<td><a
												href="./MemberSelectDetail.jh?member_code=${arrayList.member_code}">
													회원 상세 보기 </a></td>
										</tr>
									</c:forEach>
									<c:if test="${empty arrayList}">
										<tr>
											<td colspan="4">등록된 부서가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<a href="./Main.jh">메인메뉴</a>
</body>
</html>