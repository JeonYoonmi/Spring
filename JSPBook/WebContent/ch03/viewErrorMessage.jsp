<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>오류발생</title>
</head>
<body>
<!-- images => 정적 경로 -->
<!-- 오류 타입 - 어떤 이름의 오류가 났는지 알 수 있다. -->
<%= exception.getClass().getName() %>
<!-- 오류 메세지 -->
<%= exception.getMessage() %>
<img src="/images/error.jpg" />
</body>
</html>