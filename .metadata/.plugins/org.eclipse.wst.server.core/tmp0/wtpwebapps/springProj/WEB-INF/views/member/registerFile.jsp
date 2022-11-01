<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/member/registerFilePost" method="post" enctype="multipart/form-data">
		userId : <input type="text" name="userId" value="O'z" /><br />
		password : <input type="text" name="password" value="java" /><br />
		<input type="file" name="picture" /><br />
		<input type="file" name="picture2" /><br />
		<!-- 1) MultipartFile 타입의 List 컬랙션 타입 매개변수로 처리 -->
		<!-- 2) MultipartFile 타입의 MemberVO 자바빈즈 매개변수로 처리 -->
		<!-- Controller에서 실제 파일명, 크기, 컨텐츠 타입을 log로 console에 출력해보자 -->
		<input type="file" name="pictureList[0]" /><br />
		<input type="file" name="pictureList[1]" /><br />
		
		<!-- 1) MultipartFile 타입의 MultipartFile[] 타입 매개변수로 처리 -->
		<!-- 2) MultipartFile 타입의 MemberVO 자바빈즈 매개변수로 처리 -->
		<input type="file" name="pictureMulti" multiple /><br />
		
		<input type="submit" value="전송" />
	</form>
</body>
</html>