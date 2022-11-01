<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>

	<!-- page="" : 페이지 속성 -->
	<!-- 단일 태그 처리 -->
<%-- 	<jsp:forward page="second.jsp" /> --%>
	
	<!-- 단일 태그로 처리하지 않는 경우 -->
	<!-- second.jsp?date=2022... -->
<%-- 	<jsp:forward page="second.jsp"> --%>
<%-- 		<jsp:param name="date" value="<%= new Date() %>" /> --%>
<%-- 	</jsp:forward> --%>
	
	<jsp:include page="second.jsp">
		<jsp:param name="date" value="<%= new Date() %>" />
	</jsp:include>
	<p>=== first.jsp의 페이지 ===</p> <!-- 버퍼에 쌓이지도 않는 부분 -->
</body>
</html>