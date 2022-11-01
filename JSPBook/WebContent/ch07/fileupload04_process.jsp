<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
	<%	//스크립틀릿
		//윈도우 경로 : 역슬러시 두개
		String path = "c:\\upload";
		
		//commons-fileupload.jar안에 해당 클래스가 있음
		DiskFileUpload upload = new DiskFileUpload();
		
		//업로드할 파일의 최대 크기
		upload.setSizeMax(1000000);
		
		//메모리에 저장힐 최대 크기
		upload.setSizeThreshold(4096);
		
		//업로드된 파일을 임시로 저장할 경로
		upload.setRepositoryPath(path);
		
		//요청 파라미터를 받음
		//name=개똥이&subject=소설
		//filename이라는 파일 객체
		//parse : 구문분석, 의미분석
		List items = upload.parseRequest(request);
		
		//요청 파라미터를 Iterator(열거) 클래스로 변환
		Iterator params = items.iterator();
		
		//요청 파라미터가 없어질 떄까지 반복(3회)
		while(params.hasNext()){
			//FileItem : 1) 일반 데이터(name, subject) 2) 파일(filename)
			FileItem item = (FileItem)params.next();
			
			if(item.isFormField()){	//일반 데이터(name, subject)
				//?name=개똥이&subject=소설
				String name = item.getFieldName();	//name, subject
				String value = item.getString("UTF-8");
				out.print(name + "=" + value + "<br />");
			}else{	//파일(filename)
				String fileFieldName = item.getFieldName();	//filename
				String fileName = item.getName();	//업로드할 파일명
				String contentType = item.getContentType();	//만약 이미지 : image/jpeg
				
				//파일명만 추출(경로는 제외)
				//c:\\USers\\SEM-PC\\Pictures\\tomcate.PNG에서
				//마지막 \\위치를 찾아서 +1을 하면 t.거기서부터 끝까지 추출 => tomcate.PNG
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				//파일의 크기
				long fileSize = item.getSize();
				//c:\\upload\\tomcate.PNG로 복사해야 함. => 계획
				File file = new File(path + "/" + fileName);
				//복사 실행
				item.write(file);
				
				out.print("==============<br />");
		        out.print("요청 파라미터 이름 : " + fileFieldName + "<br />");
		        out.print("저장 파일 이름 : " + fileName + "<br />");
		        out.print("파일 콘텐츠 유형 : " + contentType + "<br />");
		        out.print("파일 크기 : " + fileSize);

			}
		}
		
	%>
</body>
</html>