<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
	<!-- 1. form태그 2. post 3. multipart/form-data 4. file -->
	<form name="fileForm" action="fileupload04_process.jsp" method="post" enctype="multipart/form-data">
		<p>이름 : <input type="text" name="name" /></p>
		<p>제목 : <input type="text" name="subject" /></p>
		<p>파일 : <input type="file" name="filename" /></p>
		<p><input type="submit" value="파일 올리기" /></p>
	</form>
</body>
</html>