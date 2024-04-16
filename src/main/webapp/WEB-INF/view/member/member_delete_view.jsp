<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
<link rel="stylesheet" type="text/css"href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>회원 정보 삭제</h1>
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
							<h5>회원 삭제</h5>
						</div>
						<div class="card-body">
							<form action="./MemberDelete.jh" method="post" >
								<fieldset>
									<div class="form-group row">
										<label for="member_code" class="ml-sm-3 col-form-label">회원코드</label>
										<div class="ml-sm-3">
											<input type="text" name="member_code" id="member_code"
												class="form-control form-control-sm bg-white"
												value="${param.member_code}" readonly>
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-secondary">삭제</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>
								</fieldset>
							</form>
							<div class="row">
								<div class="col-md-4">
									<a href="./MemberSelect.jh" class="btn btn-primary btn-block">
										부서 목록 </a>
								</div>
								<div class="col-md-4">
									<a href="./MemberInsertView.jh" class="btn btn-success btn-block">
										부서 입력 </a>
								</div>
								<div class="col-md-4">
									<a href="./MemberUpdateView.jh?member_code=${param.member_code}"
										class="btn btn-warning btn-block"> 부서 수정 </a>
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