<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="exception_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- exception_process.jsp?num1=12&num2=6 -->
	<%	//스크립틀릿
		String num1 = request.getParameter("num1");	// "12"
		String num2 = request.getParameter("num2");	// "6"
		
		//문자를 숫자로 변환
		int a = Integer.parseInt(num1);
		int b = Integer.parseInt(num2);
		int c = a / b;
		out.print(num1 + " / " + num2 + " = " + c);
	%>
</body>
</html>