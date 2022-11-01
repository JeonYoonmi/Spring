<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%! //선언문 태그 작성
		//int : 리턴 타입(정수형), a / b : 정수형 매게변수
		//전역 메소드
		int sum(int a, int b){
			return a + b;
		}
	%>
	
	<%
		//sum이라는 전역메소드를 호춯(두 개의 파라미터 전달)
		//out : JSP에서 제공해주는 기본 객체
		out.print("2 + 3 = " + sum(2,3));
	%>
</body>
</html>