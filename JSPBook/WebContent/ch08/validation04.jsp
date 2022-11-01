<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkForm(){
		//그거 숫자 아닌게 아니니? => 그거 숫자니? "1admin".substr(0,1) => 1
		if(!isNaN(document.frm.name.value.substr(0,1))){
			//숫자라면
			alert("이름은 숫자로 시작할 수 없습니다.");
			document.frm.name.select();
			//return false가 없다
			//http://localhost/ch08/validation04.jsp?name=1admin
			return;
		}
	}
</script>
</head>
<body>
	<form name="frm">
		<p>이름 : <input type="text" name="name" /></p>
		<p><input type="button" value="전송" onclick="checkForm()" /></p>
	</form>
</body>
</html>