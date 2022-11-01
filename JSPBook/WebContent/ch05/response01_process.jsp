<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<%	//스크립틀릿
		request.setCharacterEncoding("UTF-8");
		//{id=a001&passwd=java}
		String userId =request.getParameter("id");		//a001
		String password = request.getParameter("passwd");	//java
		
		if(userId.equals("a001")&&password.equals("java")){	//관리자
			response.sendRedirect("response01_success.jsp");
		}else{
			response.sendRedirect("response01_failed.jsp");
		}
	%>
</body>
</html>