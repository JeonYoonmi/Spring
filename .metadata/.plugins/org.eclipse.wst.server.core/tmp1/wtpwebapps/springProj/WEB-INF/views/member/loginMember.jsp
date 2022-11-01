<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>로그인</title>
</head>
<body>
	<!-- include 액션 태그 -->
	<jsp:include page="../shopping/menu.jsp" />
	
	<div class="jumbotron">
		<!-- container : 이 안에 내용있다 -->
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<!-- --------------------로그인페이지 시작-------------------- -->
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<!-- 로그인을 실패했다면.. -->
			<c:if test="${error==1}">
				<div class="alert alert-danger">
					아이디와 비밀번호를 확인해 주세요
				</div>
			</c:if>
			<form class="form-signin" action="/member/processLoginMember"
				method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID"
						name="id" required autofocus />
				</div>	
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password"
						name="password" required />
				</div>
				<!-- button type => submit / button / reset -->
				<button type="submit" class="btn btn btn-lg btn-success btn-block">
					로그인
				</button>
			</form>
			
		</div>
	</div>
	<!-- --------------------로그인페이지 끝-------------------- -->
	
	<jsp:include page="../shopping/footer.jsp" />
</body>
</html>











