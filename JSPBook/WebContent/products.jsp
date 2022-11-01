<%@page import="kr.or.ddit.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 액션태그 -->
<!-- scope 4총사 : 	page, 		 request, session, application -->
<!-- scope객체 4총사 : 	pageContext, request, session, application -->
<%
	//ProductRepository() 생성자
	// 기본 생성자. 3개의 상품 정보를 설정,
	//그런 후 Product 객체 타입의 List인 listOfProducts 변수에 저장
// 	ProductRepository productDAO = new ProductRepository();

	ProductRepository productDAO = ProductRepository.getInstance();
%>
<%-- <jsp:useBean id="productDAO" class="kr.or.ddit.dao.ProductRepository" scope="session" /> --%>
<!DOCTYPE html>
<html>
<head>
<!-- cdn방식 : css파일을 외부에서 끌어온다는 의미 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<!-- include 액션태그 -->
	<jsp:include page="menu.jsp" />
	
	<!-- ---------------------- 상품목록 시작 ---------------------- -->
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<% //스크립트릿
		//Person객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져옴.
		List<Product> listOfProducts = productDAO.getAllProducts();
	%>
	<!-- container : 이 안에 내용 있다. -->
	<div class="container">
		<!-- 행별 처리 -->
		<div class="row" align="center">
			<%
				//listOfProducts Product타입 리스트 변수
				//[0] : {"P1234", "ipone 6s", 800000}
				//[1] : {"P1235", "LG PC 그햄", 1500000}
				//[2] : {"P1236", "Galaxy Tab S", 1500000}
				for(Product product : listOfProducts){
					//[0] : {"P1234", "ipone 6s", 800000}
			%>
			<!-- 열별 처리 -->
			<div class="col-md-4">
			<!-- images/P1234.jpg -->
				<img src="/images/<%= product.getFilename() %>" alt="<%= product.getPname() %>" title="<%= product.getPname() %>" style="width: 100%;"/>
				<h3><%= product.getPname() %></h3>
				<p><%= product.getDescription() %></p>
				<p><%= product.getUnitPrice() %>원</p>
				<p><a href="product.jsp?id=<%= product.getProductId() %>" class="btn btn-secondary" role="button">상세정보&raquo;</a></p>
			</div>
			<%
				}
			%>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset2 col-sm-10">
				<input type="button" class="btn btn-primary" value="상품 등록" onclick="javascript:location.href='addProduct.jsp'"/>
			</div>
		</div>
	</div>
	<!-- ----------------------- 상품목록 끝 ----------------------- -->
	
	<jsp:include page="footer.jsp" />
</body>
</html>












