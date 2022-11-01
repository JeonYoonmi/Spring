<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<%
	String memId = "랩도";
	memId = URLEncoder.encode(memId);
%>
	<%@ include file="include01_header.jsp" %>
	<h4>------ 현재 페이지 영역 ------</h4>
<%-- 	<%@ include file="include01_footer.jsp?memId="+menId %> => 이 방법으로 전송할 수 없다. 정적임. --%>
<!-- 
	
 -->
 	<!-- include01_footer.jsp?memId=개똥이 -->
	<jsp:include page="include01_footer.jsp">
		<jsp:param value="<%= memId %>" name="memId"/>
	</jsp:include>
</body>
</html>