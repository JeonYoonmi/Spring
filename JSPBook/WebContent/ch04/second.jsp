<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 second.jsp입니다.</h3>
	<!-- first.jsp에서 단일태그 -->
<%-- 	Today is : <%= new Date() %> --%>

	<!-- first.jsp에서 단일 태그로 처리하지 않는 경우  -->
	Today is : <%= request.getParameter("date") %>
</body>
</html>