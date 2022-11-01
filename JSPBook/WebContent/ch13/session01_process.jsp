<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%	// 스크립틀릿
		//session01_process.jsp?id=a001&passwd=java
		String user_id = request.getParameter("id");	//admin
		String user_pw = request.getParameter("passwd");	//java
		//JSP에는 session 기본 내장 객체가 있음(scope는 session영역)
		//session객체의 속성명인 userID에 매핑하여 user_id변수의 값을 입력
		if(user_id.equals("admin") && user_pw.equals("java")){
			session.setAttribute("userID", user_id);	//admin
			session.setAttribute("userPW", user_pw);	//java
			//requst 기본 객체의 getSession()메소드를 사용하여 session객체 생성가능
			HttpSession httpSession = request.getSession();
// 			httpSession.setAttribute("userID", user_id);
// 			HttpSession.setAttribute("userPW", user_pw);
			out.print("세션 설정 성공<br />");
			out.print(user_id + "님 환영합니다.");
		}else{
			out.print("세션 설정 실패!");
		}
	%>
</body>
</html>