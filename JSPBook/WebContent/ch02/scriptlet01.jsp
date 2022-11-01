<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%
		//지역변수 a, b, sum => scriptlet01_jsp.java 내(..Service메소드)에서만 사용됨
		//선언과 동시에 값을 할당 => 초기화
		int a = 2;
		int b = 3;
		int sum = a + b;
		
		//JSP 기본객체인 out객체의 println메소드 사용
		out.println("2 + 3 = " + sum);
	%>
</body>
</html>