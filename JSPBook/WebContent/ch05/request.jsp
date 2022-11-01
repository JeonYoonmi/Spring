<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object(내장 객체)</title>
</head>
<body>
	<!-- process.jsp?name=개똥이 -->
	<form action="process.jsp" method="post">
		<p>
			이름 : <input type="text" name="name" />
			<input type="submit" value="전송">
		</p>
	</form>
</body>
</html>