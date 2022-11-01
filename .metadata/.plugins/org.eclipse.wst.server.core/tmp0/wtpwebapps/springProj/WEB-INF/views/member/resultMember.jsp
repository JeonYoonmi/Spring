<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
	<!-- include 액션태그 -->
<%-- 	<jsp:include page="../shopping/menu.jsp" /> --%>
	
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">회원 정보</h1>
		</div>
	</div>
	
	<!-- ---------------------- 회원 정보 시작 ---------------------- -->
	<div class="container" align="center">
		<c:choose>
			<c:when test="${ param.msg == 1 }">
				<h2 class="alert alert-danger" >회원가입을 축하드립니다.</h2>
			</c:when>
			<c:when test="${ msg == 2 }">
				<h2 class="alert alert-danger" >${ sessionScope.sessionId.name }님 환영합니다.</h2>
			</c:when>
		</c:choose>	
	</div>
	<!-- ----------------------- 회원 정보 끝 ----------------------- -->
	
<%-- 	<jsp:include page="../shopping/footer.jsp" /> --%>
</body>
</html>