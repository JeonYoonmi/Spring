<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkForm(){
		let regExp = /Java/i;	//정규표현식 선언. i : 대소문자를 구별하지 않겠다.
		let str = document.frm.title.value;	//Java Server Page
		let result = regExp.exec(str);
		alert(result[0]);
	}
</script>
</head>
<body>
	<!-- p.271 -->
	<form name="frm">
		<p>이름 : <input type="text" name="title" /></p>
		<p><input type="button" value="전송" onclick="checkForm()" /></p>
	</form>
</body>
</html>