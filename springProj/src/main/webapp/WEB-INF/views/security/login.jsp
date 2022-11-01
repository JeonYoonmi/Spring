<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body>
	<div class="container">
		<h1>Login</h1>
		<!-- security에서 제공해주는 로그인 서비스를 사용하려면 action 속성 값은 /login -->
		<form action="/login" method="post">
			<div>
				ID : <input type="text" name="username" value="" />
			</div>
			<div>
				PASSWORD : <input type="password" name="password" value="" />
			</div><br />
			<div>
				<input type="submit" class="btn btn-secondary" value="로그인" />
			</div>
			
			<sec:csrfInput />
		</form>
	</div>
</body>
</html>