<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h3>입력에 성공했습니다.</h3>
	<!-- validation02_process.jsp?id=a001&passwd=java -->
	<%
		//문자 인코딩 유형 처리
		request.setCharacterEncoding("UTF-8");
		//request객체 : JSP 내장 객체(pageContext, session, application, out, response...)
		String id = request.getParameter("id");	//a001
		String passwd = request.getParameter("passwd");	//java
	%>
	<p>아이디 : <%= id %></p>
	<p>비밀번호 : <%= passwd %></p>
</body>
</html>