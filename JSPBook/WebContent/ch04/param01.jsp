<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h3>param 액션 태그</h3> <!-- buffer에서 사라잘 것임 -->
	<!-- 요청이 param01_data.jsp로 변경되어 흐름 -->
	<jsp:forward page="param01_data.jsp">
		<jsp:param name="id" value="admin" />
		<jsp:param name="name" value='<%= URLEncoder.encode("개똥이") %>' />
	</jsp:forward>
	<p>Java Server Page</p> <!-- 읽히지 않을 것임 -->
</body>
</html>