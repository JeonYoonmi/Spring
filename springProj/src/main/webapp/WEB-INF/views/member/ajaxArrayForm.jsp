<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<title>객체 배열 타입의 JSON 데이터</title>
<script type="text/javascript">
	$(function(){
		$('#registerBtn07').on('click', function(){
			// 배열 타입의 JSON 데이터
// 			let userObjectArray = [
// 									{userId:"a001", password:"java"},
// 									{userId:"b001", password:"java"}
// 								];

			// 중첩된 (nested) 객체 타입의 JSON 요청
// 			let userObjectArray = [
// 									{userId:"a001", password:"java", address:{postCode:'12345', location:'대전 유성구'}},
// 									{userId:"b001", password:"java", address:{postCode: '678910', location:'서울 강남구'}}
// 								];
			// list => []
			date1 = new Date('2022-01-01');
			date2 = new Date('2022-02-02');
			date3 = new Date('2022-03-03');
			date4 = new Date('2022-04-04');
			let userObjectArray = [
									{userId:"a001", password:"java", address:{postCode:'12345', location:'대전 유성구'}, cardList:[{no: '1111', validMonth:date1}, {no:'2222', validMonth:date2}]},
									{userId:"b001", password:"java", address:{postCode: '678910', location:'서울 강남구'}, cardList:[{no: '3333', validMonth:date3}, {no:'4444', validMonth:date4}]}
								];
			
			$.ajax({
				url : "/member/ajaxArrayFormPost",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(userObjectArray),
				type : "post",
				success : function(result){
					console.log("result : " + result);
					if(result=="SUCCESS"){
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
		<!-- button, submit, reset -->
		<button type="button" id="registerBtn07" class="btn btn-light">객체
			배열 타입의 JSON 데이터 요청</button>
	</div>
</body>
</html>