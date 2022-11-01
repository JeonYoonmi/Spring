<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<!-- security를 통해서 사용자 아이디 role1 => {role1, both} -->
	<p>사용자명 : <%= request.getRemoteUser() %></p>
	<!-- web.xml의 <auth-method>FORM</auth-method> -->
	<p>인증방법 : <%= request.getAuthType() %></p>
	<p>인증한 사용자명이 role(역할) "tomcat"에 속하는 사람인가요?
	<!-- Is that your book? -->
		<%= request.isUserInRole("tomcat") %><!-- false -->
	</p>
	<p>인증 한 사용자 명이 role(역할) " role1"에 속하는 사용자 인가요?
		<%= request.isUserInRole("role1") %><!-- true -->
	</p>
</body>
</html>