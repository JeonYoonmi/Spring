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
			let contentVal = $("#content").val();
			let writerVal = $("#writer").val();
			
			//XML 데이터
			let xmlData = "<board>";
			xmlData += "<boardNo>" + boardNoVal + "</boardNo>";
			xmlData += "<title>" + titleVal + "</title>";
			xmlData += "<content>" + contentVal + "</content>";
			xmlData += "<writer>" + writerVal + "</writer>";
			xmlData += "<regDate>2022-07-26</regDate>";
			xmlData += "</board>";
			
			console.log("xmlData : " + xmlData);
			
			//contentType(헤더 안에 들어있는 속성) : 보내는 데이터의 타입
			$.ajax({
				url : "/board/" + boardNoVal,
				contentType : "application/xml;charset=utf-8",
				data : xmlData,
				type : "post",
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
		<p><textarea rows="3" cols="5" name="content" id="content"></textarea></p>
		<p><input type="text" name="writer" id="writer" /></p>
		<p><input type="button" id="btnSubmit" value="전송" /></p>
	</form>
</body>
</html>