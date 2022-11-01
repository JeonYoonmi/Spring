<%@page import="java.math.BigDecimal"%>
<%@page import="kr.or.ddit.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<%
	// 세션의 고유 아이디(장바구니 번호)
	String cartId = session.getId();
	
%>
<title>장바구니</title>
</head>
<body>
	<!-- include 액션태그 -->
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	
	<!-- -------------------- 장바구니 상세 내용 시작 -------------------- -->
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>	
		
		<!-- 장바구니 출력 시작 -->
		<!-- padding-top : 영역의 위쪽 여백 50px -->
		<div style="padding-top:50px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th><th>가격</th><th>수량</th>
					<th>금액</th><th>비고</th>
				</tr>
				<%	// 스크립틀릿
					// 금액을 누적하는 변수
					double sum = 0;
				
					// 	addCart.jsp의 session.setAttribute("cartlist", list);	
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");	// list : 장바구니{P1234, P1236상품}
					
					// 장바구니가 비었다면
					if(cartList == null){
				%>
					<tr>
						<td colspan="5" style="text-align:center;">장바구니에 상품이 없습니다.</td>
					</tr>
				<%		
					}else{
					// 상품 리스트를 하나씩 꺼냄
						for(Product product : cartList){
							// 금액 = 가격 * 수량
							double total = product.getUnitPrice() * product.getQuantity();
							BigDecimal totalBing = new BigDecimal(total);
							// 금액이 누적됨
							sum = sum + total;
				%>
					<tr>
						<td><%= product.getProductId() %> - <%= product.getPname() %></td>
						<td><%= product.getUnitPrice() %></td>
						<td><%= product.getQuantity() %></td>
						<td><%= totalBing %></td>
						<td>
							<a href="removeCart.jsp?id=<%= product.getProductId() %>" class="badge badge-danger">삭제</a>
						</td>
					</tr>
				<%
						}
						
						// double 지수 형태의 알파벳 숫자를 원래 숫자로 바꿈
						BigDecimal big = new BigDecimal(sum);
				%>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%= big %></td>
					<td></td>
				</tr>
				<%	} %>
			</table>
			<a href="products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
		<!-- 장바구니 출력 끝 -->
		
	</div>
	<!-- --------------------- 장바구니 상세 내용 끝 --------------------- -->
	
	<jsp:include page="footer.jsp" />
</body>
</html>