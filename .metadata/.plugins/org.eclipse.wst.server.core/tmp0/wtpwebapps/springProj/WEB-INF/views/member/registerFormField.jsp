<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>7. 폼 방식 요청 처리 (P.140)</title>
</head>
<body>
	<form action="/member/registerFormFieldPost" method="post">
		<p>
			<!-- 문자열 타입 매개변수(파라미터를 받아주는 변수)로 처리 => String userId -->
			<!-- Map 타입 매개변수로 처리 => Map<String, Object> map -->
			<!-- 자바빈즈 매개변수로 처리 => MemberVO memberVO -->
			userId : <input type="text" name="userId" value="a001" />
		</p>
		<p>
			<!-- 문자열 타입 매개변수(파라미터를 받아주는 변수)로 처리 => String password -->
			password : <input type="password" name="password" value="java" />
		</p>
		<p>
			<!-- 문자열 타입 매개변수(파라미터를 받아주는 변수)로 처리 => String gender -->
			gender : <input type="radio" id="gender1" name="gender" value="male" checked /><label for="gender1">Male</label><br />
			gender : <input type="radio" id="gender2" name="gender" value="female" /><label for="gender2">Female</label><br />
			gender : <input type="radio" id="gender3" name="gender" value="other" /><label for="gender3">Other</label><br />
		</p>
		<p>
			<!-- 문자열 타입 매개변수(파라미터를 받아주는 변수)로 처리 => String userId -->
			nationality : 
			<select name="nationality">
				<option value="korea" selected>대한민국</option>
				<option value="Germany">독일</option>
				<option value="Australia">호주</option>
				<option value="Canada">캐나다</option>
			</select>
		</p>
		<p>
			<!-- 문자열 배열 타입 매개변수로 처리  => String[] carArray -->
			car : 
			<select name="carArray" multiple>
				<option value="volvo" selected>Volvo</option>
				<option value="saab">Saab</option>
				<option value="opel">Opel</option>
				<option value="audi">Audi</option>
			</select>
		</p>
		<p>
			<!-- 문자열 타입 매개변수로 처리 => String developer -->
			developer : 
			<input type="checkbox" name="developer" value="Y" />
		</p>
		<p>
			<!-- 불린 타입 매개변수로 처리 => boolean foreigner -->
			<!-- value를 true로 초기화 해야함 -->
			foreigner : 
			<input type="checkbox" name="foreigner" value="true" />
		</p>
		<p>
			<!-- 자바빈즈 매개변수로 처리 -->
			postCode : <input type="text" name="postCode" value="34049" /><br />
			location : <input type="text" name="location" value="대전 유성구" /><br />
		</p>
		<p>
			<!--  -->
			address.postCode : <input type="text" name="address.postCode" value="678910" /><br />
			address.location : <input type="text" name="address.location" value="서울 강남구" /><br />
		</p>
		<p>
			카드1 - 번호 : <input type="text" name="cardList[0].no" value="11111" /><br />
			카드1 - 유효년월 : <input type="text" name="cardList[0].validMonth" value="20220805" /><br />
			카드2 - 번호 : <input type="text" name="cardList[1].no" value="22222" /><br />
			카드2 - 유효년월 : <input type="text" name="cardList[1].validMonth" value="20220808" /><br />
		</p>
		<p>
			introduction : <br />
			<textarea name="introduction" rows="6" cols="50">개똥이</textarea>
		</p>
		<p>
			dateOfBirth : <input type="datetime-local" name="dateOfBirth"><br />
		</p>
		<p>
			<input type="submit" value="전송" />
		</p>
	</form>
</body>
</html>