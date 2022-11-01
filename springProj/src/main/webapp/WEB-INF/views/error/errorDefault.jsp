<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">

    <!-- Exception Error Image -->
    <div class="text-center">
    	<h4>${ exception.getMessage() }</h4>
		<img alt="소시지" src="/resources/images/exception.jpg" width="100%" style="border: 3px solid black; border-radius: 50%;">
		<ul>
			<c:forEach var="stack" items="${ exception.getStackTrace() }">
				<li>${ stack.toString() }</li>
			</c:forEach>
		</ul>
    </div>

</div>
