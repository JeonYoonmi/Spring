<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<p>
		Today's date : 
		<%
		//스크립클릿
		out.print(new java.util.Date() + "<br />");
		%>
		<!-- 표현문 -->
		<%= new java.util.Date() %><br />
	</p>
</body>
</html>