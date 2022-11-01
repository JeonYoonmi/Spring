<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript">
   $(function() {
      // class가 clsCard인 요소를 클릭 시 클릭 이벤트를 e라는 객체에 넣어줌
//       $('.clsCard').on('click', function() {
// //          e.prevnetDefault();
//          //this : 클릭한 그 객체
//          $(this).datepicker();
//       })

      $('.clsCard').datepicker({
      });
      
   })
</script>
</head>
<body>
<h2>Spring Form</h2>
<form:form modelAttribute="pmemberVO" method="post" action="/member/registerForm01Post">

   <p>
      <!-- path="id" => pmemberVO 객체의 멤버변수 -->
      유저 ID : <form:input path="id"/>
      <form:hidden path="regno"/>
      <font color = "red">
         <!-- form:errors => validation 시 오류발생 시 처리 -->
         <form:errors path="id" />
      </font>
   </p>
   <p>
      <!-- path="id" => pmemberVO 객체의 멤버변수 -->
      이름 : <form:input path="name" />
      <font color = "red">
         <!-- form:errors => validation 시 오류발생 시 처리 -->
         <form:errors path="name" />
      </font>
   </p>
   <p>
      <!-- path="id" => pmemberVO 객체의 멤버변수 -->
      E-MAIL : <form:input path="mail" />
      <font color = "red">
         <!-- form:errors => validation 시 오류발생 시 처리 -->
         <form:errors path="mail" />
      </font>
   </p>
   <p>
      <!-- path="mail" => pmemberVO 객체의 멤버변수 -->
      <!--  
      <input id="mail" name="mail" type="password" value="개똥이">
       -->
      비밀번호 : <form:password path="password"/>
      <font color = "red">
         <!-- form:errors => validation 시 오류발생 시 처리 -->
         <form:errors path="password" />
      </font>
   </p>
   <p>
      <!-- <textarea id="address" name="address"></textarea> -->
      소개 : 
      <form:textarea path="address"/>
   </p>
   
</form:form>
<script type="text/javascript">
CKEDITOR.replace("address");
</script>
</body>
</html>