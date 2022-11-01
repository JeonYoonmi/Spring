package kr.or.ddit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
@RequestMapping("/upload")
public class UploadController {
	
	// void로 사용하는 방식은 좋은건 아님
	@GetMapping("/uploadForm")
	public void uploadForm() {
		// 리턴 타입을 void로 하면 /upload/uploadForm.jsp로 조립이 됨
		log.info("upload form");
	}
	
	
	// <input type="file" name="uploadFile" multiple /> 여기에 name과 이름이 같아야 한다.
	@PostMapping("/uploadFormAction")
	public void uploadFormAction(MultipartFile[] uploadFile) {
		// MultipartFile : 스프링에서 제공해주는 타입
		/*
		 	- 잘 씀
				String getOriginalFileName() : 업로드 되는 파일의 이름(실제 파일 명)
				boolean isEmpty() : 파일이 없다면 true
				long getSize() : 업로드 파일의 크기
				transferTo(File file) : 차일을 저장
			
			- 잘 안씀
				String getName() : <input type="file" name="uploadFile" 에서 uploadFile을 가져옴
				byte[] getBytes() : byte[]로 파일 데이터 변환
				inputStream getInputStream() : 파일 데이터와연결된 InputStream을 변환
		*/
		// 파일이 저장되는 경로
		String uploadFolder = "c:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("--------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				// 파일이 복사 됨
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
			
		}	// end for
		
//		return "";
	}
	
	// 요철  URI => /localhost/upload/uploadAjax
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		// forwarding
		return "upload/uploadAjax";
	}
	
	// 실전 스프링 교재 607
	// Ajax는 비동기
	// 요청 URI => /localhost/upload/uplodAjaxAction
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxAction(MultipartFile[] uploadFile) {
//		log.info("uploadAjaxAction 왔다.");
		log.info("uploadFile : " + uploadFile);
		
		String uploadFolder = "D:\\A_TeachingMaterial\\06_Spring\\springProj\\src\\main\\webapp\\resources\\upload";
		
		// make folder 시작 -------------------------------------
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		
		// 만약 해당 폴더가 없다면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			// make folder 끝 -------------------------------------
			
			// IE(인터넷 익스프롤러) 처리 => 경로를 제외한 파일 명만 추출
			// c:\\upload\\img01.jpg => img01.jpg
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name :" + uploadFileName);
			
			// ------------- 같은 날 같은 이미지를 업로드 시 파일 중복 방지 시작 -------------
			// java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID();	//임의 값을 생성
			
			// 원래의 파일 이름과 구분하기 위해 _를 붙임
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// ------------- 같은 날 같은 이미지를 업로드 시 파일 중복 방지 끝 -------------
			
			
			// File 객체 설계(복사할 대상 경로, 파일명)
//			File saveFile = new File(uploadFolder, uploadFileName);
			
			// uploadPath : D:\\A_TeachingMaterial\\06_Spring\\springProj\\src\\main\\webapp\\resources\\upload\\2022\\07\\22
			File saveFile = new File(uploadPath, uploadFileName);
			
			
			try {
				// 파일 복사가 일어남
				multipartFile.transferTo(saveFile);
				
				// 이미지 인지 체킹
				if(checkImageType(saveFile)) {	// 이미지라면
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					// 썸네일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}	// end catch
		}	// end for
	}	// uploadAjaxAction

	// 년/월/일 폴더 생성
	// 어디서든 접근할 수 있도록 접근제한자 - public
	// uploadController.getFolder()를 다이렉트로 쓰기 위해서 - static
	public static String getFolder() {
		// 2022-07-22 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		
		// 2022-07-22
		String str =sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	// 용량이 큰 파일을 썸네일 처리를 하지 않으면
	// 모바일과 같은 환경에서 많은 데이터를 소비해야 하므로
	// 이미지의 경우 특별한 경우가 아니면 썸네일을 제작해야 함.
	// 썸네일은 이미지만 가능함.
	// 이미지 파일의 판단
	public static boolean checkImageType(File file) {
		/*
			.jpeg / .jpg(JPEG이미지)의 MINE 타입 : image/jpeg
		*/
		// MIME 타입을 통해 이미지 여부 확인
		// file.toPath() : 파일 객체를 path객체로 변환
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			
			// Mine 타입 정보가 image로 시작하는지 여부를 return
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 이 파일이 이미지가 아닐 경우
		return false;
	}
	
	// 파일 다운로드
	// localhost/upload/download?fileName?=2022/07/25/a44c66c9-1e7d-4729-82aa-8796b940c417_P1237.jpg
	// (어노테이션)RequestParam을 붙여서  (어노테이션)RequestParam String fileName 가능
	// (어노테이션)ResponseBody : 비동기 => 화면이 깜빡일 수 있음 하지만 ifraim을 사용했기 때문에 깜빡임을 방지할 수 있음.
	// ----------------------------------------------------------------------------------------------
	// 내가 찾아본 참고 사항!
	/*
	- Part객체의 구조
	  1) 파일이 아닌 일반 데이터일 경우
	  -------------------------95fasffsdf5-ruuhfe89fu	==>파트를 구분하는 구분선
	  content-disposition: form-data; name="username"	==> 파라미터 명
	  							==> 빈줄
	  hong						==> 파라미터 값
	  
	  2) 파일 일 경우
	  -------------------------95fasffsdf5-ruuhfe89fu	==>파트를 구분하는 구분선
	  //  content-disposition,  content-type : 파일 헤더
	  content-disposition: form-data; name="upFile1"; filename="test1.txt"	==> 파일 정보
	  content-type: taxt/plain	==> 파일의 종류
	  							==> 빈줄
	  abcd1234안녕하세요			==> 파일 내용
	 */
	// form-data : html에서 form-data(enctype)을 보냈을 때 사용 / attachment : 다운로드 파일일 경우 사용
	// ---------------------------------------------------------------------------------------------
	@ResponseBody
	@GetMapping("/download")
	public ResponseEntity<Resource> download(String fileName) {
		log.info("fileName : " + fileName);
		
		// resource : 다운로드 받을 파일(지원)
		Resource resource = new FileSystemResource("D:\\A_TeachingMaterial\\06_Spring\\springProj\\src\\main\\webapp\\resources\\upload\\" + fileName);
		
		// a44c66c9-1e7d-4729-82aa-8796b940c417_P1237.jpg
		String resourceName = resource.getFilename();
		
		// header : 인코딩 정보, 파일명 정보
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			log.info(e.getMessage());
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
