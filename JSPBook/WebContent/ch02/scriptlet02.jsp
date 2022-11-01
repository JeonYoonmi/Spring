<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%//스크립틀릿 태그
		for(int i=0; i<=10; i++){//0~10
			if(i % 2 == 0)	//짝수인 경우
				//JSP기본객체인 out객체의 println메소드를  통해 화면에 출력
				out.print(i + "<br />");
		}
	%>
</body>
</html>