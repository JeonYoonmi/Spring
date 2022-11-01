<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- exception_process.jsp?num1=12&num2=6 -->
	<%	//스크립틀릿
		try{
			String num1 = request.getParameter("num1");	// "12"
			String num2 = request.getParameter("num2");	// "0"
			
			//문자를 숫자로 형변환
			int a = Integer.parseInt(num1);
			int b = Integer.parseInt(num2);
			int c = a / b;
			out.print(num1 + " / " + num2 + " = " + c);
		}catch(NumberFormatException e){
			//오류가 발생하면 tryCatch_error.jsp로 포워딩.
			//request객체와 response객체를 전달함
			RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");
			dispatcher.forward(request, response);
		}
	%>
</body>
</html>