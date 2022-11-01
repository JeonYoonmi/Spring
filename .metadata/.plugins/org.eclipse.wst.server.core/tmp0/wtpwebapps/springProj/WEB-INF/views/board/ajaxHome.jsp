<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ajax</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnSubmit').on('click', function(){
	// 		alert("왔다");
			let boardNoVal = $('#boardNo').val();
			let titleVal = $('#title').val();
			let contentVal = $('#content').val();
			let writerVal = $('#writer').val();
			
			// JSON 데이터
			let boardObject = {
				boardNo : boardNoVal,
				title : titleVal,
				content : contentVal,
				writer : writerVal
			};
			
			console.log("boardObject : " + JSON.stringify(boardObject))
			
			// 아작났어유 피씨다타써
			// url : 요청 경료
			// contentType : 보내는 데이터의 타입
			// dataType : 응답 데이터 타입
			// data : 요청 시 전송할 데이터
			// type : get, post, put
			// /borard/100
			// 동적인 URL은 Controller에서 pathVariable
			$.ajax({
				url : "/board/" + boardNoVal,
				contentType : "application/json;charset=utf-8", 
				data : JSON.stringify(boardObject),
				type : "put",
				success : function(result){
					console.log("result : " + result);
				}
			})
		});
	});
</script>
</head>
<body>
	<form>
		<p><input type="text" name="boardNo" id="boardNo" /></p>
		<p><input type="text" name="title" id="title" /></p>
		<p>
			<textarea rows="3" cols="5" name="content" id="content"></textarea>
		</p>
		<p><input type="text" name="writer" id="writer" /></p>
		<p><input type="button" id="btnSubmit" value="전송" /></p>
	</form>
</body>
</html>