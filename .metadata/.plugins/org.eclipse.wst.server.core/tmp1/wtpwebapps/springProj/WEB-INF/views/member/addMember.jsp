<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>회원 가입</title>
<script type="text/javascript">
	function checkForm(){
		//아이디 입력 체크
		if(!document.newMember.id.value){
			alert("아이디를 입력하세요");
			document.newMember.id.focus();
			return false;
		}
			
		//비밀번호 입력 체크
		if(!document.newMember.password.value){
			alert("비밀번호를 입력하세요");
			document.newMember.password.focus();
			return false;
		}
		
		//비밀번호 확인
		if(document.newMember.password.value !=
			document.newMember.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		
		//생일을 조립해보자
		//birthyy + birthmm + birthdd
		let mm = document.newMember.birthmm.value;
		if(mm<10){
			mm = "0" + mm;
		}
		
		let dd = document.newMember.birthdd.value;
		if(dd<10){
			dd = "0" + dd;
		}
		
		let birth = document.newMember.birthyy.value + "-" +
					mm + "-" + dd
		console.log("birth : " + birth);
		
		//이메일도 조립해보자
		let mail = document.newMember.mail1.value + "@" + 
				   document.newMember.mail2.value;
		console.log("mail : " + mail);
		
		//birth와 mail이 form태그의 요소로 들어가 있어야 함
		document.newMember.birth.value = birth;
		document.newMember.mail.value  = mail;
		
		return true;
	}
</script>
</head>
<body>
	<!-- include 액션 태그 -->
	<jsp:include page="../shopping/menu.jsp" />
	
	<div class="jumbotron">
		<!-- container : 이 안에 내용있다 -->
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<!-- --------------------회원 가입 시작-------------------- -->
	<!-- form태그의 onsubmit속성 : 핸들러함수를 일단 먼저 거치고 오셈
		1) 핸들러함수에서 return true; 시에는 submit을 수행
		2) 핸들러함수에서 return false; 시에는 중지 
	-->
	<div class="container">
		<form name="newMember" class="form-horizontal" 
		action="<%=request.getContextPath()%>/member/processAddMember"
		method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control" placeholder="id" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="password" class="form-control" placeholder="password" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input type="password" name="password_confirm" class="form-control" 
					placeholder="password confirm" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" 
					placeholder="name" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio" name="gender" value="남" />남
					<input type="radio" name="gender" value="여" />여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4">
					<input type="hidden" name="birth" value="" />
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" />
					<select name="birthmm">
						<option value="">월</option>
						<c:forEach var="mm" begin="1" end="12" step="1">
							<option value="${mm}">${mm}</option>
						</c:forEach>					
					</select>
					<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="hidden" name="mail" value="" />
					<input type="text" name="mail1" maxlength="50" />@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phone" class="form-control" 
					placeholder="phone" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control" 
					placeholder="address" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-primary" value="취소"  />
				</div>
			</div>
			
		</form>
	</div>
	<!-- --------------------회원 가입 끝-------------------- -->
	
	<jsp:include page="../shopping/footer.jsp" />
</body>
</html>















