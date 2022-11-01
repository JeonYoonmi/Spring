<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- errorPage.jsp?name=apple => APPLE -->
	<!-- errorPage.jap => 오류 발생(null을 대문자 변환 불가) -->
	name 파라미터 : <%= request.getParameter("name").toUpperCase() %>
	
</body>
</html>