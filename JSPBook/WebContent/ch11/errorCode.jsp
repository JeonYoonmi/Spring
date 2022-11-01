<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- P.368 -->
	<!-- exception_process.jsp?num1=12&num2=6 -->
	<form action="errorCode_process.jsp" method="post">
		<p>숫자 1 : <input type="text" name="num1" /></p>
		<p>숫자 2 : <input type="text" name="num2" /></p>
		<p><input type="submit" value="나누기" /></p>
	</form>
</body>
</html>