<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkLogin(){
		//admin
		let form = document.loginForm;
		
		//form.id.value : admin (lwngth : 5)
		for(i=0;i<form.id.value.length;i++){
			let ch =form.id.value.charAt(i);	//i: 0(a)~4(n)
			
			//아이디는 영문 소문자만 가능
			if((ch<'a' || ch>'z')&&(ch>'A' || ch<'Z')&&(ch>'0' || ch<'9')){
				alert("아이디는 영문 소문자만 입력 가능합니다.");
				form.id.select();
				return;	//여기서 멈춤 break는 for문을 멈추는 반면에 return은 함수를 멈춤;
			}
		}
		//alert("개똥이");	//return시에는 실행이 안됨. break;일 때는 실행됨
		
		//비밀번호는 숫자만 입력 가능
		if(isNaN(form.passwd.value)){
			alert("비밀번호는 숫자만 입력 가능합니다.");
			form.passwd.select();
			return; //정지 
		}
		
		//아이디 및 비밀번호 유효성 검사 통과시
		form.submit();	//폼페이지에 입력된 데이터 값을 서버로 전송(request객체를 통해)
	}
</script>
</head>
<body>
	<!-- validation03_process.jsp?id=a001&passwd=java -->
	<form name="loginForm" action="validation03_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
</body>
</html>