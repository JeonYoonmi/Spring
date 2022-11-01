<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<title>Ajax 방식 요청 처리 연습</title>
<script type="text/javascript">
$(function(){
	$('#registerBtn01').on('click', function(){
		alert("왔다.");
		// result => "SUCCESS"
		// call back 함수
		$.get("/member/ajaxRegister/hongkd", function(result){
			console.log("result : " + result);
			if(result == "SUCCESS"){
				alert("SUCCESS");
			}
		});
	});
	
	$('#registerBtn02').on('click', function(){
		alert("왔다.");
		let userId = $('#userId');
		let password = $('#password');
		
		let userIdVal = userId.val();
		let passwordVal = password.val();
		
		// json 형식
		let userObject = {userId:userIdVal, password:passwordVal};
		
		// result => "SUCCESS"
		// contentType : 보내는 타입
		$.ajax({
			url : "/member/ajaxRegister/board/127?userId=" + userIdVal + "&password=" + passwordVal,
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(userObject),
			type : 'post',
			success : function(result){
				console.log("result : " + result);
				if(result == "SUCCESS"){
					alert("SUCCESS");
				}
			}
		});
		
	});
});
</script>
</head>
<body>
<div class="container">
	ID : <input type="text" name="userId" id="userId" /><br />
	PASSWORD : <input type="text" name="password" id="password"><br /><br />
	<button type="button" id="registerBtn01" class="btn btn-primary">
		PathVariable 어노테이션을 지정하여 문자열 매개변수로 처리
	</button><br />
	<button type="button" id="registerBtn02" class="btn btn-light">
		PathVariable 어노테이션을 지정하여 여러개의 문자열 매개변수로 처리
	</button>
</div>
</body>
</html>