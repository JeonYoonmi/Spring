<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%!
	//선언문 태그
	//전역변수 선언
	int count = 3;
	//전역 메소드. 영문소문자로 변환하여 리턴
	//String : 리턴 타입/ data : 파라미터(인수)를 받아드리는 매개변수
	//접근제한자 생략 시 open범위는? 동일 패키지
	String makeItLower(String data){
		return data.toLowerCase();
	}
	%>
	
	<%//스크립트릭 태그(자바 로직 코드 작성)
		//지역 변수 i를 사용하고 1부터 3까지 1씩 증가
		for(int i=1; i<=count; i++){
			//out : JSP의 기본 객체(화면애 출력 대상 문자열을 출력)
			//<br /> : 단일태그의 경우 뒤에 /를 붙여줌
			// br뒤에 / 사용하는 이유: 
			//<div></div>, <h2></h2> 단일 태그가 아님 닫아 줘야 한다.
			//<br> 단일태그 -> 단일 태그는 마지막에 /로 닫아주면 좋다.
			out.println("Java Server Page : " + i + "<br />");
		}
	%>
	
	<!-- 표현문 태그.(선언문의 메소드를 호출 -> 소문자로 변환하여 리턴받음) -->
	<%= makeItLower("Hello World") %>
</body>
</html>