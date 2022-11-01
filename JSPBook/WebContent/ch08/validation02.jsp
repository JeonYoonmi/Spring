<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	//핸들러 함수
	function checkLogin(){
		let form = document.loginForm;
		if(form.id.value==""){
			alert("아이디를 입력해주세요.");
			form.id.focus();	//해당 항목에 커서가 위치함
			return false;	//여기서 멈춰
		}else if(form.passwd.value==""){
			alert("비밀번호를 입력해주세요.");
			form.passwd.focus();	//커서를 위치함
			return false;
		}
		//위의 분기문을 잘 통과 했다면..
		form.submit();	//validation02.process.jsp를 요청
	}
</script>
</head>
<body>
	<!-- validation02_process.jsp?id=a001&passwd=java -->
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
</body>
</html>