<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>BOARD REGISTER</title>
</head>
<body>
	<div class="container">
		<h2>BOARD REGISTER : access to member</h2>
		<form action="/logout" method="post">
			<button type="submit" class="btn btn-secondary">๋ก๊ทธ์์</button>
			
			<sec:csrfInput/>
		</form>
	</div>
</body>
</html>