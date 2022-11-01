<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		<%	//스크립틀릿
			request.setCharacterEncoding("UTF-8");
		
			Enumeration paramNames = request.getParameterNames();
			// 열거형 요소가 있으면 true 반환
			while(paramNames.hasMoreElements()){
				String name = (String)paramNames.nextElement();
				out.print("<tr><td>" + name + "</td>");
				String paramValue = request.getParameter(name);
				out.print("<td>" + paramValue + "</td>");
			}
		%>
		
	</table>
</body>
</html>