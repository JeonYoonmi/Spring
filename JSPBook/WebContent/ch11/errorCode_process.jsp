<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- exception_process.jsp?num1=12&num2=6 -->
	<%	//스크립틀릿
		String num1 = request.getParameter("num1");	// "12"
		String num2 = request.getParameter("num2");	// "0"
		
		//문자를 숫자로 형변환
		int a = Integer.parseInt(num1);
		int b = Integer.parseInt(num2);
		/*
			page 디렉티브의 errorPage속성이 없으므로 web.xml의
			error500.jsp에서 오류를 처리함
			<error-page>
		  		<error-code>500</error-code>
		  		<location>/error/error500.jsp</location>
		  	</error-page>
		*/
		int c = a / b;
		out.print(num1 + " / " + num2 + " = " + c);
	%>
</body>
</html>