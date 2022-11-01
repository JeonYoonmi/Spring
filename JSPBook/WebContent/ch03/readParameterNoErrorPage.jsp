<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="./viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>파라미터 출력</title>
</head>
<body>
<!-- readParameterNoErrorPage.jsp?name=개똥이 -->
<!-- .toUpperCase() : 대문자로 변환 -->
<!-- /readParameterNoErrorPage.jsp => 오류.. null을 대문자로 변환 불가 -->
name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>
<!-- 
	오류처리 방법
	 1. page 디렉티브의 errorPage 속성에 지정한 오류 페이지 
	  - 전용 오류 페이지가 필요할 경우
	 2. web.xml의 exception-type
	  - 별도로 처리해야 하는 exception(심각할 때...)
	 3. web.xml의 error-code
	  - 범용적인(자주 발생) 오류 코드(404, 500)
 -->
</body>
</html>