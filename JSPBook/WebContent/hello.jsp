<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
</head>
<body>
	<h1>Hello JSP!!!</h1>
	Hello! Java Server Page.
	
	<%
		String str = "Hello JSP!!!";
		String str2 = "Hello! Java Server Page.";
	%>
	
	<h1><%= str %></h1>
	<%= str2 %>
</body>
</html>