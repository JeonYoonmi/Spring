<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<% //스크립틀릿
		//한글 처리
		request.setCharacterEncoding("UTF-8");
		//rquest 내장 객체가 {name=개똥이} 요청 파라미터를 갖고 있음
		String name = request.getParameter("name");
	%>
	<!-- 표현문 -->
	<p>이름 : <%= name %></p>
	요청 정보 길이 : <%= request.getContentLength() %><br />
	클라이언트 전송 방식 : <%= request.getMethod() %><br />
	요청 URI : <%= request.getRequestURI() %><br />
	서버 이름 : <%= request.getServerName() %><br />
	서버 포트 : <%= request.getServerPort() %><br />
</body>
</html>