<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- <auth-method>FORM</auth-method> 때문에 -->
	<!-- action 속성의 값은 j_security_check로 정해짐 -->
	<!-- j_security_check 톨게이트를 통과해야만 /ch10/security01.jsp로 갈 수 있음 -->
	<form name="loginForm" action="j_security_check" method="post">
		<!-- name속성의 값인 j_username는 변경하지 말자 -->
		<p>사용자명 : <input type="text" name="j_username" /></p>
		<!-- name속성의 값인 j_password는 변경하지 말자 -->
		<p>비밀번호 : <input type="password" name="j_password" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>