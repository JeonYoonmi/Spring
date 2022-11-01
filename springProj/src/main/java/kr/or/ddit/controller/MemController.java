package kr.or.ddit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.MemService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mem")
@Controller
public class MemController {
	
	@Autowired
	MemService memService;
	
	// 요청 URI : /mem/memRegist
	@GetMapping("/memRegist")
	public ModelAndView memRegist(MemVO memVO) {
		
		memVO.setUserNo(this.memService.makeUserNo());

		// 회원의 번호를 모델에 담아서 jsp로 보냄
		ModelAndView mav = new ModelAndView();
		mav.addObject("userNo", memVO.getUserNo());
		mav.setViewName("mem/memRegist");
		
		// forwarding
		return mav;
	}
	
	// let data = { "userId" : userId }
	// 요청 URI : /mem/dupChk
	// JSON 데이터를 받을 땐... (어노테이션)requestBody
	// JSON 데이터를 보낼 땐... (어노테이션)responseBody
	@ResponseBody
	@PostMapping("/dupChk")
	public Map<String, String> dupChk(@RequestBody MemVO memVO) {
		Map<String, String> map = new HashMap<String, String>();
		
		int result = this.memService.dupChk(memVO);
		
		// 1 : 있다 / 0 : 없다
		log.info("result : " + result);
		
		if(result > 0) {
			map.put("result", "1");
		}else {
			map.put("result", "0");
		}
		
		return map;
	}
	
	// 요청 URI : /mem/memRegistPost
	@PostMapping("/memRegistPost")
	public String memRegistPost(@Validated MemVO memVO, BindingResult brResult) throws IllegalStateException, IOException {
		log.info("memVO : " + memVO);
		
		// 회원 등록 화면으로
		// 톰켓 : 헤이 크롬! /mem/memRegist 다시 요청해달라며?
		// 크롬 : 응, 내가 그랬지
		// 톰켓 : 그럼 다시 요청해줘. 내가 처리해줄게
		// 크롬 : 응, 알겠어 다시 /mem/memRegist 요청해줘. 처리해줘
		// 톰켓 : 응, 나도 처리할게
		if(brResult.hasErrors()) {	// 오류 발생
			// 검사 결과 오류 확인
			List<ObjectError> allErrors = brResult.getAllErrors();
			// 객체와 관련된 오류
			List<ObjectError> globalErrors = brResult.getGlobalErrors();
			// 멤버 변수와 관련된 오류
			List<FieldError> fieldErrors = brResult.getFieldErrors();
			
			for (ObjectError objectError : allErrors) {
				log.info("allError : " + objectError);
			}
			
			for (ObjectError globalError : globalErrors) {
				log.info("globalError : " + globalError);
			}
			
			for (FieldError fieldError : fieldErrors) {
				log.info("fieldError : " + fieldError.getDefaultMessage());
			}
			
			// redirect로는 안되고, forwarding만 됨
			return "mem/memRegist";
		}
		
		// 업로드 될 폴더 설정
		String uploadFolder = "D:\\A_TeachingMaterial\\06_Spring\\springProj\\src\\main\\webapp\\resources\\upload";
		
		// 연/월/일 폴더 설정
		String uploadFolderPath = getFolder();
		
		// 폴더 생성(계획)
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		// 계획된 경로에 폴더가 없다면 생성
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		// memVO객체로부터 MultipartFile[] 타입의 파일 객체를 꺼내와보자
		MultipartFile[] uploadfile = memVO.getMemImage();
		
		// ATTACH 테이블에 입력할 목록을 생성
		List<AttachVO> attachVOList = new ArrayList<AttachVO>();
		
		int cnt = 1;
		// 파일 객체 배역로부터 하나씩 파일 객체를 꺼내보자
		for (MultipartFile multipartFile : uploadfile) {
			// 실제파일명 가져오기
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE 처리 => 경로를 제외한 파일명만 추출
			// c:\\temp\\개똥이.jpg => 개똥이.jpg
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			// UUID 붙이기
			UUID uuid = UUID.randomUUID();
			
			// memVO 객체에 filename 멤버변수에 실제 파일명을 넣어줌
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			// /2022/08/03/UUID_개똥이.jpg
			// /2022/08/03 / UUID_개똥이.jpg
			memVO.setFilename(uploadFolderPath.replace("\\", "/") + uploadFileName);
			
			// 파일 업로드 처리
			
			// uploadPath : static 폴더 및 연 월 일까지
			// uploadFileName : UUID_실제 파일명
			File saveFile = new File(uploadPath, uploadFileName);
			
			multipartFile.transferTo(saveFile);
			
			AttachVO attachVO = new AttachVO();
			attachVO.setUserNo(memVO.getUserNo());
			attachVO.setSeq(cnt++);	// 1을 attachVO에 setting한 후에 1증가
			attachVO.setFilename(memVO.getFilename());
//			attachVO.setFilesize(Long.valueOf(multipartFile.getSize()).intValue());
			attachVO.setFilesize((int)multipartFile.getSize());
			
			attachVOList.add(attachVO);
		}
		// attach 테이블에 list형태로 입력하기 위함
		memVO.setAttachVOList(attachVOList);
		
		// 회원 및 회원 권한 insert
		int result = this.memService.insert(memVO);
		
		if(result > 0) {	// 입력 성공
			return "redirect:/mem/memRegist?result=1";
		}else{
			return "redirect:/mem/memRegist?result=0";
		}
	}
	
	// 날짜 계층형 폴더
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		// str : 2022-08-03
		String str = sdf.format(date);
		
		// 2022폴더 > 08폴더 > 03폴더
		return str.replace("-", File.separator);
	}
	
	// 요청 URI : /mem/memList
	@GetMapping("/memList")
	public String memList(Model model, @RequestParam Map<String, String> map, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		log.info("map => " + map);
		
		int page = 10;
		if(map.size() > 0) {
			if(map.get("show") != null) {
				page = Integer.parseInt(map.get("show"));
			}
		}else {
				map.put("show", "10");
				map.put("cond", "");
				map.put("keyword", "");
		}
		
		// 페이징 처리(util 패키지의 ArticlePage.java를 통해 페이징 처리해보자)
		map.put("currentPage", currentPage+"");
		
		List<MemVO> memVOList = this.memService.memList(map);
		
		int total = this.memService.getTotal(map);		
		model.addAttribute("memVOList", new ArticlePage<MemVO>(total, currentPage, page, memVOList));
		// 요청 파라미터를 받은 map을 model의 속성의 값으로 포함
		model.addAttribute("map", map);
		
		// forwarding
		return "mem/memList";
	}
}
