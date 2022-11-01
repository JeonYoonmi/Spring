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
	 <!-- p.430 -->
	 <h4>----- 세션 삭제 전 -----</h4>
	 <%	// 스크립틀릿
	 	String user_id = (String)session.getAttribute("userID");	//admin
	 	String user_pw = (String)session.getAttribute("userPW");	//java
	 	out.print("설정된 세션 이름 userID : " + user_id + "<br />");	//admin
	 	out.print("설정된 세션 이름 userPW : " + user_pw + "<br />");	//java
	 	
	 	session.removeAttribute("userID");
	 %>
	 <h4>----- 세션 삭제 후 -----</h4>
	 <%	// 스크립틀릿
	 	user_id = (String)session.getAttribute("userID");	//null
	 	user_pw = (String)session.getAttribute("userPW");	//java
	 	out.print("설정된 세션 이름 userID : " + user_id + "<br />");	//null
	 	out.print("설정된 세션 이름 userPW : " + user_pw + "<br />");	//java
	 %>
</body>
</html>