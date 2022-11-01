<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<title></title>
<script type="text/javascript">
	$(function(){
		// json 데이터를 읽어와보자
		// 달러.each(collecton, function(index In Array, value Of Element){...});
		// collection => array, List, Map, Object, ArrayList
		// Index In Array => 키(인덱스)
		// value Of Element => 값
		$('#btnJson').on('click', function(){
			$.ajax({
				url : "/member/read03Post",
				contentType : false,
				type :"post",
				success : function(result){
					// List<PmemberVO> pmemberVOList = new ArrayList<PmemberVO>();
					/*
						[{"id":"a001","password":null,"name":"개똥이"},
						{"id":"b001","password":null,"name":"개진순"}]
					*/
					console.log(JSON.stringify(result));
					console.log("--------------");
					$.each(result, function(i, v){
						console.log("아이디 : " + v.id);
						console.log("이름 : " + v.name);
						console.log("--------------");
					});
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<button type="button" id="btnJson" class="btn btn-light">/member/read03Post</button>
		<h3>carArray</h3>
		<c:forEach var="car" items="${ carArray }">
			<p>${ car }</p>
		</c:forEach>
		<h3>carList</h3>
		<c:forEach var="car" items="${ carList }">
			<p>${ car }</p>
		</c:forEach>
		<h3>pmemberVOList</h3>
		<c:forEach var="pmemberVO" items="${ pmemberVOList }">
			<p>ID : ${ pmemberVO.id }</p>
			<p>NAME : ${ pmemberVO.name }</p>
		</c:forEach>
	</div>
</body>
</html>