<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="#" name="member" method="post">
		<p>
			아이디 : <input type="text" name="id" />
			<input type="button" value="아이디 중복 검사" />
		</p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p>이름 : <input type="text" name="name" /></p>
		<p>
			연락처 : <input type="text" maxlength="4" size="4" name="phone1" />
			- <input type="text" maxlength="4" size="4" name="phone2" />
			- <input type="text" maxlength="4" size="4" name="phone3" />
		</p>
		<p>
			성별 : <input type="radio" name="gender" value="남성" checked />남성
				 <input type="radio" name="gender" value="여성" />여성
		</p>
		<p>
			취미 : 독서<input type="checkbox" name="hobby1" checked />
				  운동<input type="checkbox" name="hobby2" />
				  영화<input type="checkbox" name="hobby3" />
		</p>
		<p>
			<!-- p.190 -->
			<!-- size속성 : 해당 개수대로 미리 보여줌 -->
			<select name="city" size="3">
				<option value="대전광역시">대전광역시</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="충청">충청</option>
				<option value="전라">전라</option>
				<option value="경상">경상</option>
			</select>
		</p>
		<p>
			<select name="food">
				<optgroup label="분식">
					<option value="ddeuboki">떡볶이</option>
					<option value="sundai">순대</option>
				</optgroup>
				<optgroup label="안주">
					<option value="offolpyeo">오돌뼈</option>
					<option value="odaengtang">오뎅탕</option>
				</optgroup>
				<optgroup label="찌개류">
					<option value="kimchijjigae">김치찌개</option>
					<option value="doinjangjjigae">된장찌개</option>
				</optgroup>
			</select>
		</p>
		<p>
			<input type="submit" value="가입하기" />		 
			<input type="reset" value="다시 쓰기" />		 
		</p>
	</form>
</body>
</html>