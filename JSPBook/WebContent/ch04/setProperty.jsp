<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<!-- id : 20181004 / name : 홍길순 -->
	<jsp:useBean id="person" class="kr.or.ddit.dto.Person" scope="request" />
	<!-- name : 객체명 / property : 멤버변수 / value : set할 값 -->
	<jsp:setProperty name="person" property="id" value="20182005"/>
	<jsp:setProperty name="person" property="name" value="홍길동"/>
	
	<p>아이디 : <%= person.getId() %></p>
	<p>이   름 : <%= person.getName() %></p>
</body>
</html>