<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="page_errorPage_error.jsp" %>
<!-- page디렉티브의 errorPage속성의 값으로 설정된 오류 처리 jsp로 요청함 -->
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<%//스트립트릿 -> 지역변수 선언
		String str = null;
		//오류 발생!(null을 toString())
		out.println(str.toString());
	%>
	
	<!-- 표현문 -> 지역변수에 할당된 데이터 화면에 출력 -->
	<%= str %>
</body>
</html>