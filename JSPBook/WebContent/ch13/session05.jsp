<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%	// 스크립틀릿
		String name;
		String value;
	
		// 세션의 모든 이름을 열거형으로 가져오자
		Enumeration en = session.getAttributeNames();
		
		// 세션 개수를 카운트
		int i = 0;
		// 세션의 모든 이름과 값을 확인
		while(en.hasMoreElements()){
			// 세션명
			name = en.nextElement().toString();
			
			// 세션의 이름에 매핑된 값
			value = (String)session.getAttribute(name);
			
			out.print("설정된 세션의 이름 [" + ++i + "] : " + name + "<br />");
			out.print("설정된 세션의 값 [" + ++i + "] : " + value + "<br />");
			
			
			session.removeAttribute("userID");
		}
	%>
	<h4>----- 세션을 삭제하기 후 -----</h4>
	<%
		// 세션의 모든 이름을 열거형으로 가져오자
		en = session.getAttributeNames();
		
		// 세션 개수를 카운트
		i = 0;
		// 세션의 모든 이름과 값을 확인
		while(en.hasMoreElements()){
			// 세션명
			name = en.nextElement().toString();
			
			// 세션의 이름에 매핑된 값
			value = (String)session.getAttribute(name);
			
			out.print("설정된 세션의 이름 [" + ++i + "] : " + name + "<br />");
			out.print("설정된 세션의 값 [" + ++i + "] : " + value + "<br />");
			
			
			session.removeAttribute("userID");	
		}
	%>
</body>
</html>