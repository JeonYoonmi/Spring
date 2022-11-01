<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<!-- session01.jsp와 session01_process.jsp를 먼저 수행 후 -->
	<!-- 
		session.setAttribute("userID", user_id);	//admin
		session.setAttribute("userPW", user_pw);	//java
	 -->
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%	// 스크립틀릿
		String user_id = (String)session.getAttribute("userID");	// admin
		String user_pw = (String)session.getAttribute("userPW");	// java
		
		// request객체에 포함된 클라이언트 세션이 유효한지 체킹
		if(request.isRequestedSessionIdValid()){
			out.print("세션이 유효합니다.");	//(o)
		}else{
			out.print("세션이 유효하지 않습니다.");
		}
		
		// 세션에 저장된 모든 세션 속성 삭제*******
		session.invalidate();
	%>
	<h4>----- 세션을 삭제하기 후 -----</h4>
	<%
		if(request.isRequestedSessionIdValid()){
			out.print("세션이 유효합니다.");
		}else{
			out.print("세션이 유효하지 않습니다.");	//(o)
		}
	%>
</body>
</html>