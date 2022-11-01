<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<!-- 액션태그 -->
<!-- scope 4총사 : 	page, 		 request, session, application -->
<!-- scope객체 4총사 : 	pageContext, request, session, application -->
<!DOCTYPE html>
<html>
<head>
<!-- cdn방식 : css파일을 외부에서 끌어온다는 의미 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<!-- include 액션태그 -->
<%-- 	<jsp:include page="menu.jsp" /> --%>
	
	<!-- ---------------------- 상품목록 시작 ---------------------- -->
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<!-- container : 이 안에 내용 있다. -->
	<div class="container">
		<!-- 행별 처리 -->
		<div class="row" align="center">
			<c:forEach var="product" items="${list}">
				<!-- 열별 처리 -->
				<div class="col-md-4">
				<!-- images/P1234.jpg -->
					<img src="/resources/upload/${ product.filename }" alt="${ product.pname }" title="${ product.pname }" style="width: 100%;"/>
					<h3>${ product.pname }</h3>
					<p>${ product.description }</p>
					<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${ product.unitPrice }" />원</p>
					<p><a href="/product/product?id=${ product.productId }" class="btn btn-secondary" role="button">상세정보&raquo;</a></p>
				</div>
			</c:forEach>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset2 col-sm-10">
				<!-- (어노테이션)GetMapping("/addProduct") -->
				<input type="button" class="btn btn-primary" value="상품 등록" onclick="javascript:location.href='/product/addProduct'"/>
			</div>
		</div>
	</div>
	<!-- ----------------------- 상품목록 끝 ----------------------- -->
	
<%-- 	<jsp:include page="footer.jsp" /> --%>
</body>
</html>












