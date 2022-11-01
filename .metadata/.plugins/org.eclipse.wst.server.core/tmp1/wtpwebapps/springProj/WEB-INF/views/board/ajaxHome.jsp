<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<title>마이클 잭슨을 기리며...</title>
<script type="text/javascript">
	$(function() {
		
		$("#btnSubmit").on("click", function() {
			alert("왔다!");
			
			let boardNoVal = $("#boardNo").val();
			let titleVal = $("#title").val();
			let contentVal = $("#content1").val();
			let writerVal = $("#writer").val();
			
			//JSON 데이터 - key, value로 이루어짐
			let boardObject = {
					boardNo : boardNoVal,
					title : titleVal,
					content : contentVal,
					writer : writerVal
			};
			console.log(boardObject);
			
			//processData는 다운로드할 때 쓰임
			//url : 요청 경로
			//contentType : 보내는 데이터의 타입; dataType : 응답 데이터의 타입
			//data : 요청 시 전송할 데이터
			//type : get, post, put(잘 사용하지 않음)
			
			//HomeController에서 ResponseEntity에 SUCCESS값을 넣어줬던 것이 res에 들어가서 콘솔에 출력됨
			$.ajax({
				url : "/board/" + boardNoVal,
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(boardObject),
				type : "put",
				success : function(res) {
					console.log("result : " + res);
				}
			});
		})
	})
	
</script>
</head>
<body>
	<form action="">
		<p><input type="text" name="boardNo" id="boardNo" /></p>
		<p><input type="text" name="title" id="title" /></p>
		<p><textarea rows="3" cols="5" name="content" id="content1"></textarea></p>
		<p><input type="text" name="writer" id="writer" /></p>
		<p><input type="button" id="btnSubmit" value="전송" /></p>
	</form>
</body>
</html>