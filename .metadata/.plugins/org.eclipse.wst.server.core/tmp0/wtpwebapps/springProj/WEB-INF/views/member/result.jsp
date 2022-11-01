<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<p>
		유저 ID : ${ pmemberVO.id }
	</p>
	<p>
		유저 NAME : ${ pmemberVO.name }
	</p>
	<p>
		E-MAIL : ${ pmemberVO.mail }
	</p>
	<p>
		비밀번호 : ${ pmemberVO.password }
	</p>
	<p>
		소개 : ${ pmemberVO.address }
	</p>
	<p>
		취미 : 
		<c:forEach var="row" items="${ pmemberVO.hobbyMap }">
			${ row }
		</c:forEach> 
	</p>
</body>
</html>