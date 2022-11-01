<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="kr.or.ddit.dto.Person" scope="request" />
	<!-- id : 20182005 / name : 개똥이 -->
	<jsp:setProperty name="person" property="id" value="20182005" />
	<jsp:setProperty name="person" property="name" value="개똥이" />
	<p>아이디 : <jsp:getProperty name="person" property="id" /></p>
	<p>이   름 : <jsp:getProperty name="person" property="name" /></p>
</body>
</html>