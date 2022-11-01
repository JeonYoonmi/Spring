<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	Today : 
	<%
		out.print(new java.util.Date());
	%>

</body>
</html>