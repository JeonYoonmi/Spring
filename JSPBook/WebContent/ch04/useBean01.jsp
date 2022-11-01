<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<%
		Date date = new Date();
	%>	
<%-- 	<jsp:useBean id="date" class="java.util.Date" /> --%>
	<p>
		<%//스크립트릿
			out.print("오늘의 날짜 및 시각 : ");
		%>
	</p>
	<!-- 표현식 -->
	<p><%= date %></p>
</body>
</html>