<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%	//스크립틀릿
		// session.setAttribute("userID", user_id);
		// session.setAttribute("userPW", user_pw);
		// Object하위의 String형으로 다운캐스팅
		String user_id = (String)session.getAttribute("userID");	//admin
		String user_pw = (String)session.getAttribute("userPW");	//java
		
		out.print("설정된 세션의 속성값[1] : " + user_id + "<br />");
		out.print("설정된 세션의 속성값[2] : " + user_pw + "<br />");
	%>
</body>
</html>