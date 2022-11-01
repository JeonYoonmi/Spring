<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
</head>
<body>
	<%
		//문자 인코딩 유형
		request.setCharacterEncoding("UTF-8");
	%>
	<!--
		- 요청 파라미터. 파라미터 목록. name=value => VO 또는 Map
			?id=a001&passwd=1234
	-->
	<p>아이디 : <%= request.getParameter("id") %></p>
	<p>비밀번호 : <%= request.getParameter("passwd") %></p>
	<p>이름 : <%= request.getParameter("name") %></p>
	<p>연락처 : <%= request.getParameter("phone1") %>
				-<%= request.getParameter("phone2") %>
				-<%= request.getParameter("phone3") %>
	</p>
	<p>이메일 : <%= request.getParameter("email") %></p>
</body>
</html>