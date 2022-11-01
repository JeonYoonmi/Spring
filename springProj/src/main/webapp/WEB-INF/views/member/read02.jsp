<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<div class="container">
		<p>userId : ${ pmemberVO.id }</p>
		<p>password : ${ pmemberVO.password }</p>
		<p>mail : ${ pmemberVO.mail }</p>
		<p>birth : <fmt:formatDate value="${ pmemberVO.birth }" pattern="yyyy-MM-dd" /></p>
	</div>
</body>
</html>