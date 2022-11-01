<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.dto.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<%
		//스크립트릿
			//ListPerson타입의 : Person타입의 인터페이스
			List<Person> personList = new ArrayList<Person>();
	%>
	<jsp:useBean id="person" class="kr.or.ddit.dto.Person" scope="page" />
	
<%-- 	<p>아이디 : <%= person.getId() %></p> --%>
<%-- 	<p>이   름 : <%= person.getName() %></p> --%>
	
	<%
		personList.add(person);
		
		person = new Person();
		person.setId(20152005);
		person.setName("개똥이");
		
		personList.add(person);
		
		//향상된 for문
		for(Person row : personList){
			out.print("<p>아이디 : " + row.getId() + "</p>");
			out.print("<p>이   름 : " + row.getName() + "</p>");
		}
	%>
</body>
</html>