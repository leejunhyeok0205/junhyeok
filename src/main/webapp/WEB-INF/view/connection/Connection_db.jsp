<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Boolean bool = (Boolean)request.getAttribute("bool"); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 베이스 연결 확인</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<body>
<%
if(bool ==true){
%>
데이터 베이스 연결 성공
<%}else{ %>
데이터 베이스 연결 실패
<%} %>
</body>
</html>