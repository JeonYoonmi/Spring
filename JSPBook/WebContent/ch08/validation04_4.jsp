<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkForm(){
		//이름은 숫자로 시작할 수 없습니다.
		let str = document.frm.name.value;	//1개똥이
		//정규 표현식 생성 (문자 형식), [a-z] : a~z사이의 문자
		let regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		//문자 형식이 아니다. 1개똥이 => true
		if(!regExp.test(str)){	//test()메소드 : T/F
			alert("이름은 숫자로 시작할 수 없습니다.");
			return;	//함수를 빠져나옴. 정지
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