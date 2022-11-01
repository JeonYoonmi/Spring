<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkMember(){
		//아이디는 문자로 시작
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		//이름은 한글만 입력. 웃음으로 시작하여 돈으로 끝나자
		var regExpName = /^[가-힣]*$/;
		
		//비밀번호는 숫자만 입력
		var regExpPasswd = /^[0-9]*$/;
		
		//연락처 형식 준수(010-111-2222, 010-1111-2222)
		//{3} : 딱 3회
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		
		//이메일 형식 준수(02test-_\.02test@naver-_\.)
		//i : ignore(대소문자 구분 안함)
		var regExpEmail = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		let form = document.Member;
		
		let id = form.id.value;
		let name = form.name.value;
		let passwd = form.passwd.value;
		let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		let email = form.email.value;
		
		//아이디는 문자로 시작
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요.");
			form.id.select();
			return;
		}
		
		//이름은 한글만 입력
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요.");
			form.name.select();
			return;
		}
		
		//비밀번호는 숫자만 입력
		if(!regExpPasswd.test(passwd)){
			alert("비밀번호는 숫자만 입력해주세요.");
			return;
		}
		
		//연락처 형식 준수
		if(!regExpPhone.test(phone)){
			alert("연락처를 확인해주세요.");
			return;
		}
		
		//이메일 형식 준수(02test-_\.02test@naver-_\.)
		if(!regExpEmail.test(email)){
			alert("이메일을 확인해주세요.");
			return;
		}
		
		//유효성 검사 통과
		form.submit();
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="validation05_process.jsp" name="Member" method="post">
		<p>아이디  : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p>이름 : <input type="text" name="name" /></p>
		<p>연락처 : 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" maxlength="4" size="4" name="phone2" />
			<input type="text" maxlength="4" size="4" name="phone3" />
		</p>
		<p>이메일 : <input type="text" name="email" /></p>
		<p><input type="button" value="가입하기" onclick="checkMember()" /></p>
	</form>
</body>
</html>