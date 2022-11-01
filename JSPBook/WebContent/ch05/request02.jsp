<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>implicit Object(내장 객체)</title>
</head>
<body>
	<%	//스크립틀릿
		//모든 헤더의 이름을 가져와보자 => 리턴 타입 : Enumeration(열거형)
		Enumeration en = request.getHeaderNames();
	
		//hasMoewElements() : 깂이 있을 때에만 반복
		while(en.hasMoreElements()){
			//현재 헤더 이름을 가져옴(Object(컵) -> String(텀블러)으로 downcasting)
			String headerName = (String)en.nextElement();
			
			//requst.getHeader("host"); headerName : host
			String headerValue = request.getHeader(headerName);
			
			out.print(headerName + " : " + headerValue + "<br>");
		}
	%>
</body>
</html>