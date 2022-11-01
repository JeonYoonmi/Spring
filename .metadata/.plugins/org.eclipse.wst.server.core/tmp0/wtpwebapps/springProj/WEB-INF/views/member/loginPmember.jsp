<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>로그인</title>
<script type="text/javascript">
function fn_login2(){
	document.frm.action = "/member/registerIntCast";
	document.frm.submit();
} 
function fn_paramCorrect(){
	document.frm.action = "/member/registerParamCorrect";
	document.frm.submit();
} 
</script>
</head>
<body>
	<!-- include 액션태그 -->
<%-- 	<jsp:include page="../shopping/menu.jsp" /> --%>
	
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<!-- ---------------------- 로그인 시작 ---------------------- -->
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<!-- 로그인을 실패했다면.. -->
			<c:if test="${ error==1 }">
				<div class="alert alert-danger">
					아이디와 비밀번호를 확인해주세요.
				</div>
			</c:if>
<!-- 			<form class="form-dignin" action="/member/processLoginMember" method="post"> -->
				<!-- /member/register?id=a001&password=java -->
<!-- 				<form name="frm" action="/member/register" method="get"> -->
				<form name="frm" action="/member/register01" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="id" required autofocus />
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="password" required autofocus />
				</div>
				<div class="form-group">
					<label for="inputName" class="sr-only">Name</label>
					<input type="text" class="form-control" placeholder="name" name="name" />
				</div>
				<div class="form-group">
					<label for="inputCoin" class="sr-only">Coin</label>
					<input type="text" class="form-control" placeholder="coin" name="coin" />
				</div>
				<div class="form-group">
					<label for="inputBirth" class="sr-only">Birth</label>
					<input type="date" class="form-control" placeholder="birth" name="birth" />
				</div>
				<!-- button type => submit / button / reset -->
				<button type="submit" class="btn btn btn-lg btn-success btn-block">로그인</button>
				<button type="button" class="btn btn btn-lg btn-secondary btn-block" onclick="fn_login2()">로그인</button>
				<button type="button" class="btn btn btn-lg btn-info btn-block" onclick="fn_paramCorrect()">로그인</button>
			</form>
			<hr>
			<a href="/member/registerByGet01?id=a001&birth=0805">
				/member/registerByGet01?id=a001&amp;birth=0805
			</a>
			<a href="/member/registerByGet01?id=a001&birth=2022-08-05">
				/member/registerByGet01?id=a001&amp;birth=2022-08-05
			</a>
			<a href="/member/registerByGet01?id=a001&birth=20220805">
				/member/registerByGet01?id=a001&amp;birth=20220805
			</a>
			<a href="/member/registerByGet01?id=a001&birth=2022/08/05">
				/member/registerByGet01?id=a001&amp;birth=2022/08/05
			</a>
			<hr>
			<p><a href="/member/register/a001">개똥이</a></p>
			<p><a href="/member/register/b001">메뚜기</a></p>
			<p><a href="/member/register/c001">우영우</a></p>
		</div>
	</div>
	<!-- ----------------------- 로그인 끝 ----------------------- -->
	
<%-- 	<jsp:include page="../shopping/footer.jsp" /> --%>
</body>
</html>