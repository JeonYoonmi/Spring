<%@page import="kr.or.ddit.vo.PmemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 세션에 저장된 세션의 속성 이름인 sessionId의 속성 값을 가져옴
	// session => setAttribute("name", "value"), getAttribute("name"), invalidate()
	// session.getAttribute("sessionId");는 object타입으로 생성되는데
	// (String)session.getAttribute("sessionId");는 String 타입으로 다운캐스팅
	// 다운 캐스팅 : 업캐스팅된 것을 다시 원상태로 돌리는 것을 말한다.
	PmemberVO sessionId = (PmemberVO)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	 <div class="container">
		<!-- ./ : 상대경로. welcome.jsp가 있는 현재 폴더위치. -->
		<div class="navbar-header">
			<a class="navbar-brand" href="/product/welcome">Home</a>
		</div>
		<div>
			<!-- ul : umlist => 순서가 없는 목록 -->
			<ul class="navbar-nav mr-auth">
				<c:choose>
					<c:when test="${ empty sessionId }"><!-- 로그인이 안되어 있다면... -->
						<li class="nav-item">
							 <a class="nav-link" href="/member/loginMember">로그인</a>
						</li>
						<li>
							<a class="nav-link" href="/member/addMember">회원가입</a>
						</li>
					</c:when>
					<c:otherwise><!-- 로그인 되었다면 -->
						<li style="padding-top:7px;color:white;">|<%= sessionId.getName() %>님|</li>
						<li>
							<a class="nav-link" href="/member/logoutMember">로그아웃</a>
						</li>
						<li>
							<a class="nav-link" href="/member/updateMember">회원 수정</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<li class="nav-item"><a class="nav-link" href="/product/products">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="/product/addProduct">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="/product/editProduct">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="/product/deletePrduct">상품 삭제</a></li>
			</ul>
		</div>
	</div>
</nav>