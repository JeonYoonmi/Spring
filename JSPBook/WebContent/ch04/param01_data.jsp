<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<p>아이디 : <%= request.getParameter("id") %></p>
	<p>이름 : <%= URLDecoder.decode(request.getParameter("name")) %></p>
</body>
</html>