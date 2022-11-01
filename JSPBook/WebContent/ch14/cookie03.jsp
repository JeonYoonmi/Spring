<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%	// 스크립틀릿
		// 요청시 마다 쿠키를 함께 보냄. 쿠키는 request객체에 담김
		Cookie[] cookies = request.getCookies();
	
	for(int i=0; i<cookies.length; i++){
		// 모든 쿠키를 삭제
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
	
	response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>