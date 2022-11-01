<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<title>Spring Form</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script> -->
<script type="text/javascript">
// 	$(function(){
// 		alert("된다.");
		// class="clsCard"를 클릭 시 클릭 이벤트를 e라는 객체에 넣어줌
// 		$(document).on("click", ".clasCard", function(e){
			// this : 클릭한 그 객체
// 			$('.clasCard').datapicker();
// 		});
// 	});
</script>
</head>
<body>
	<h2>Spring Form</h2>
	<form:form modelAttribute="pmemberVO" method="post" action="/member/registerForm01Post">
		<p>
			<!-- path="id" => pmemberVO 객체의 멤버변수 -->
			<!-- <input id="id" name="id" type="text" value="a001"> -->
			유저 ID : <form:input path="id" />
			<form:hidden path="regno" />
				<font color="red">
				<!-- form:errors => validation시 오류 발생 처리 -->
				<form:errors path="id" />
			</font>
		</p>
		<p>
			<!-- path="name" => pmemberVO 객체의 멤버변수 -->
			<!-- <input id="name" name="name" type="text" value="개똥이"> -->
			유저 NAME : <form:input path="name" />
			<font color="red">
				<!-- form:errors => validation시 오류 발생 처리 -->
				<form:errors path="name" />
			</font>
		</p>
		<p>
			<!-- path="mail" => pmemberVO 객체의 멤버변수 -->
			<!-- <input id="mail" name="mail" type="text" value="asdf@asdf.com"> -->
			E-MAIL : <form:input path="mail" />
			<font color="red">
				<!-- form:errors => validation시 오류 발생 처리 -->
				<form:errors path="mail" />
			</font>
		</p>
		<p>
			<!-- path="password" => pmemberVO 객체의 멤버변수 -->
			<!-- <input id="password" name="password" type="text" value="java"> -->
			비밀번호 : <form:password path="password" />
			<font color="red">
				<!-- form:errors => validation시 오류 발생 처리 -->
				<form:errors path="password" />
			</font>
		</p>
		<p>
			<!-- <textarea id="address" name="address"></textarea> -->
			소개 : <form:textarea path="address"/>
		</p>
		<p>
			<!-- item : Model에 있는 속성의 값 -->
			취미 : <form:checkboxes items="${ hobbyMap }" path="hobbyMap" />
		</p>
		<p>
			성별 : 
			<!-- path="gender"는 pmemberVO 객체의 gender 멤버변수임 -->
			<form:radiobuttons items="${ genderColdeMap }" path="gender" />
		</p>
		<p>
			국적 : 
			<!-- path="nationality"는 pmemberVO 객체의 nationality 멤버변수임 -->
			<form:select items="${ nationalityMap }" path="nationality" />
		</p>
		<div>
			<h5>카드 목록</h5>
			<p>
				<input type="text" name="cardVOList[0].no" placeholder="카드번호" />
				<input type="text" class="clsCard" name="cardVOList[0].validMonth" placeholder="유효기간" />
			</p>
			<p>
				<input type="text" name="cardVOList[1].no" placeholder="카드번호" />
				<input type="text" class="clsCard" name="cardVOList[1].validMonth" placeholder="유효기간" />
			</p>
		</div>
		<p>
			<form:button name="register">등록</form:button>
		</p>
	</form:form>
<script type="text/javascript">
	CKEDITOR.replace("address");
</script>
</body>
</html>