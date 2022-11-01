<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%	// 스크립틀릿
		// cookie01_process.jsp?id=admin&passwd=1234
		String user_id = request.getParameter("id");		//admin
		String user_pw = request.getParameter("passwd");	//1234
		
		// 아이디가 admin, 비밀번호가 1234라면
		// Cookie객체를 생성. name은 userId, value는 admin / name은 userPW, value는 1234

		// 아이디가 admin, 비밀번호가 1234라면
		if(user_id.equals("admin") && user_pw.equals("1234")){
			// Cookie 객체를 생성.
			// name은 userID, value는 admin
			Cookie cookie_id = new Cookie("userID", user_id);
			// name은 userPW, value는 1234
			Cookie cookie_pw = new Cookie("userPW", user_pw);
			
			// response 내장 객테를 통해 쿠키를 리턴 받음
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.print("쿠키 설정 성공!<br />");
			out.print(user_id + "님 환영!");
		}else{
			out.print("쿠키 설정 실패!");
		}
	%>
</body>
</html>