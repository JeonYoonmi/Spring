<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@page import="kr.or.ddit.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//이미지 파일업로드 처리
String path = "D:\\A_TeachingMaterial\\08_Framework\\workspace\\JSPBook\\WebContent\\images";
//파일업로드 처리용 클래스
DiskFileUpload upload = new DiskFileUpload();

upload.setSizeMax(1000000);   //1Mb
upload.setSizeThreshold(4096);   //1 * 1024 * 1024 => 1Mb
upload.setRepositoryPath(path);   //임시 저장경로 : 생략가능
//request 객체에 있는 모든 요청 파라미터를 분석하여 List타입의 items 변수에 저장
List items = upload.parseRequest(request);
Iterator params = items.iterator();   //열거형으로 처리

String productId = "";
String pname = "";
String unitPrice = "";
String description = "";
String manufacturer = "";
String category = "";
String unitsInStock = "";
String condition = "";
//unitPrice는 문자형 데이터. -> 숫자형으로 변환
double price = 0d;
long stock = 0L;

String fileFieldName = "";
String fileName = "";
String contentType = "";

//vo객체에 요청파라미터를 setting => spring에서는 골뱅이 ModelAttribute로 쉽게 처리될것임
while(params.hasNext()){   //다음 항목이 있는지? 
   FileItem item = (FileItem)params.next();   //있으면 그 항목을 가져오자
   if(item.isFormField()){   //일반 항목일때
      //item : {productId=P1234}
      String name = item.getFieldName();   //productId
      if(name.equals("productId")){   
         //P1234
         productId    = item.getString("UTF-8");
      }else if(name.equals("pname")){
         pname        = item.getString("UTF-8");
      }else if(name.equals("unitPrice")){
         unitPrice    = item.getString("UTF-8");   //문자
         
         //가격이 비어있다면..
         if(unitPrice.isEmpty()){
            price = 0d;
         }else{//비어있지 않다면..
            price = Double.parseDouble(unitPrice);
         }
      }else if(name.equals("description")){
         description  = item.getString("UTF-8");
      }else if(name.equals("manufacturer")){
         manufacturer = item.getString("UTF-8");
      }else if(name.equals("category")){
         category     = item.getString("UTF-8");
      }else if(name.equals("unitsInStock")){
         unitsInStock = item.getString("UTF-8");   //문자
         
         if(unitsInStock.isEmpty())
            stock = 0;
         else
            stock = Long.valueOf(unitsInStock);
      }else if(name.equals("condition")){
         condition    = request.getParameter("condition");
      }

   }else{   //파일객체일 때
      fileFieldName = item.getFieldName();   //productImage
      fileName = item.getName();   //C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG
      contentType = item.getContentType();   //images/jpeg
      
      //C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG ->    tomcate.PNG
      fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
      long fileSize = item.getSize();   //파일 크기
      
      //설계 => 복사될 위치 및 파일명 결합연산
      File file = new File(path + "/" + fileName);// 복사될 위치\\tomcate.PNG
      //복사 처리
      item.write(file);
   }
}

//Product(dto) 객체 생성
Product newProduct = new Product();
newProduct.setProductId(productId);
newProduct.setPname(pname);
newProduct.setUnitPrice(price);   //Integer형변환 됨.
newProduct.setDescription(description);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInStock(stock); //long형변환 됨.
newProduct.setCondition(condition);
newProduct.setFilename(fileName);   //tomcate.PNG

//싱글톤 객체로 생성
ProductRepository dao = ProductRepository.getInstance();
//새로운 상품 등록(Product 타입의 파라미터를 Product 타입(dto, vo)의 매개변수로 받음)
dao.addProduct(newProduct);

//목록으로 이동
response.sendRedirect("products.jsp");
%>
