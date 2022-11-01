<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%	// 스크립틀릿
		// session.setAttribute("userID", user_id);	//admin
		// session.setAttribute("userPW", user_pw);	//java
		String name;
		String value;
		int i=0;
		
		Enumeration en =  session.getAttributeNames();	// {userID, userPW} 열거형
		
		// 세션 속성 이름이 있을 때까지 반복
		// en.hasMoreElements() : fetch
		while(en.hasMoreElements()){	// 2회 반복
			name = en.nextElement().toString();	// userID 다음에는 userPW
			value = session.getAttribute(name).toString();	// session.getAttribute("userID")
			
			out.print("설정된 세션 속성 명 [" + i + "] : " + name + "<br />");
			out.print("설정된 세션 속성 값 [" + i + "] : " + value + "<br />");
			
			out.print("<hr/ >");
			i++;
		}
		
		
	%>
</body>
</html>