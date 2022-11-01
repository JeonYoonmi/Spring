<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<!-- ------------------ 로그인 폼 시작 ------------------ -->
	<!-- container : 내용이 들어옵니다 -->
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%	//스크립틀릿
				//?error=1
				String error = request.getParameter("error");
				if(error != null){	//오류가 발생했을 때
					out.print("<div class='alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해주세요.");
					out.print("</div>");
				}
			%>
			<!-- p.350 <auth-method>FORM</auth-method> FORM 인증 처리 기법 사용 -->
			<form class="form-signin" action="j_security_check" method="post">
				<!-- 아이디 입력 영역, j_username는 고정 -->
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus />
				</div>
				
				<!-- 비밀번호 입력 영역, j_password는 고정 -->
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="j_password" required autofocus />
				</div>
				
				<!-- submit 버튼 영역 -->
				<!-- button type="button/submit/reset" -->
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
	<!-- ------------------- 로그인 폼 끝 ------------------- -->
	
	<jsp:include page="./footer.jsp" />
</body>
</html>