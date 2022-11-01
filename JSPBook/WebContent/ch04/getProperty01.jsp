<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<!-- Person 클래스를 인스턴스화 하여 person객체를 생성함 -->
	<jsp:useBean id="person" class="kr.or.ddit.dto.Person" scope="request" />
	<!-- name : 객체명 / property : 멤버 변수명 -->
	<p>아이디 : <jsp:getProperty name="person" property="id" /></p>
	<p>이   름 : <jsp:getProperty name="person" property="name" /></p>
</body>
</html>