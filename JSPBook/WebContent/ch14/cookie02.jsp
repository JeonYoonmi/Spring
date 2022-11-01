<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%	// 스크립틀릿
		// 모든 쿠키 정보 가져와보자
		Cookie[] cookies = request.getCookies();
	
		// 현재 설정된 쿠키의 개수 알아보기
		out.print("현재 설정된 쿠키의 개수 : " + cookies.length + "<br />");
		out.print("<hr />");
		
		for(int i=0; i<cookies.length; i++){
			out.print("쿠키[" + i + "] : " + cookies[i] + "<br />");
			// 쿠키 속성 이름
			out.print("설정된 쿠키의 속성 이름[" + i + "] :" + cookies[i].getName() + "<br />");
			
			// 쿠키 속성 값
			out.print("설정된 쿠키의 속성 값[" + i + "] :" + cookies[i].getValue() + "<br />");
			out.print("-------------------------------------<br />");
		}
	
	%>
</body>
</html>