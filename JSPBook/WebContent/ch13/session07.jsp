<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<h4>----- 세션 유효 시간 변경 전 -----</h4>
	<%
		// 세션에 설정된 유효 시간(기본 1800초(30분))
		int time = session.getMaxInactiveInterval();	// 초단위
		
		out.print("세션 유효 시간 : " + time + "초<br />");
	%>
	<h4>----- 세션 유효 시간 변경 후 -----</h4>
	<%
		// 세션 유효 시간을 60X60(1시간)으로 설정
		session.setMaxInactiveInterval(60*60);	// 3600초
		time = session.getMaxInactiveInterval();	// 초단위
		
		out.print("세션 유효 시간 : " + time + "초<br />");
	%>
</body>
</html>