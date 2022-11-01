package kr.or.ddit.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.PmemberService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PmemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	PmemberService pmemberService;
	
	// 로그인 페이지로 포워딩
	// URI => http://localhost/member/loginMember
	@GetMapping("/loginMember")
	public String loginMember() {
		// forwarding
		return "member/loginMember";
	}
	
	// 로그인 페이지로 포워딩
	// URI => http://localhost/member/loginPmember
	@GetMapping("/loginPmember")
	public String loginPmember() {
		// forwarding
		return "member/loginPmember";
	}
	
	// http://localhost/member/loginmember에서 입력한 id, password를 map으로 받음
	// 요청 URI => /member/processLoginMember(post)
	@PostMapping("/processLoginMember")
	public String processLoginMember(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
		log.info("map : " + map);
		
		// request객체에 들어있는 session객체를 가지고 옴
		HttpSession session = request.getSession();
		
		// 로그인 처리
		PmemberVO pmemberVO = this.pmemberService.login(map);
		
		String id = "";
		// 로그인 성공 -> session.setAttribute("sessionId". id)
		// -> redirect:/member/resultMember
		if(pmemberVO != null) {
			// pmemberVO => 
			log.info("pmemberVO : " + pmemberVO.toString());
			id = (String)map.get("id");
			session.setAttribute("id", id);
			session.setAttribute("sessionId", pmemberVO);
			return "redirect:/member/resultMember";
		}else {
			// 로그인 실페 -> redirect:/member/loginMember?error=1
			model.addAttribute("error", 1);
			// forwarding
			return "/member/loginMember";
		}
	}
	
	// 로그인 성공
	// URI => member/resultMember
	@GetMapping("/resultMember")
	public String resultMember(Model model) {
		
		// msg : 0 => 회원 정보 수정
		// msg : 1 => 회원 가입
		// msg : 2 => 로그인 성공
		model.addAttribute("msg", 2);
		// forwarding
		return "member/resultMember";
	}
	
	// JSP의 기본 내장객체인 request 객체를 소환해보자.(servlet이 필요)
	// 로그아웃
	// URI => /member/logoutMember
	@GetMapping("/logoutMember")
	public String logoutMember(HttpServletRequest request) {
		// session을 사용해야한다
		HttpSession session = request.getSession();
		
		// 세션을 종료 => 로그아웃 처리 됨
		session.invalidate();
		
		// URI를 재요청
		// loginMember();
		return "redirect:/member/loginMember";
	}
	
	// 회원가입
	// URI => /member/addMember
	@GetMapping("/addMember")
	public String addMember(@ModelAttribute PmemberVO pmemberVO) {
		// forwarding
		return "member/addMember";
	}
	
	// 회원가입 처리
	// URI => /member/processAddMember
	// VO를 받으려면 => (어노테이션)ModelAttribute
	// String을 받으려면 => (어노테이션)RequestParam
	// PmemberVO 도메인 클래스(자바빈 클래스)에 입력값 검증을 활성화함
	@PostMapping("/processAddMember")
	public String processAddMember(@Validated PmemberVO pmemberVO, BindingResult brResult)	{
		log.info("pmemberVO : " + pmemberVO);
		
		// 요청 파라미터와 도메인 클래스의 멤버변수가 바인딩(set)될 때 오류가 생겼다면
		if(brResult.hasErrors()) {
			// 검사 결과 오류 확인
			List<ObjectError> allErrors = brResult.getAllErrors();
			// 객체와 관련된 오류
			List<ObjectError> globalErrors = brResult.getGlobalErrors();
			// 멤버 변수와 관련된 오류
			List<FieldError> fieldErrors = brResult.getFieldErrors();
			
			for (ObjectError objectError : allErrors) {
				log.info("allError : " + objectError);
			}
			
			for (ObjectError objectError : globalErrors) {
				log.info("globalError : " + objectError);
			}
			
			for (FieldError fieldError : fieldErrors) {
				log.info("fieldError : " + fieldError.getDefaultMessage());
			}
			
			// forwarding
			return "member/addMember";
		}
		
		// 회원가입 처리
		int result = this.pmemberService.inset(pmemberVO);
		
		if(result>0) {	// 가입 성공
			// redirect 처리
			// msg : 0 => 회원 정보 수정
			// msg : 1 => 회원 가입
			// msg : 2 => 로그인 성공
			ModelAndView mav = new ModelAndView();
			
//			model.addAttribute("msg", 1);	//jsp에서는 ${msg}
			mav.addObject("msg", "1");
			return "redirect:/member/resultMember?msg=1";	// jsp에서는 ${param.msg}
		}else {	// 가입실패
			return "redirect:/member/addMember";
		}
	}
	
	// //////////////////// 스트링 폼 연습 시작 //////////////////// 
	// 요청 URI : /member/registerForm01
	@GetMapping("/registerForm01")
	public String registerForm01(Model model) {
		log.info("registerForm01");
		
		PmemberVO pmemberVO = new PmemberVO();
		
		// <form:form modelAttribute="pmemberVO" method="post" action="/member/registerForm01Post">
		// 폼 객체를 모델에 추가
		model.addAttribute("pmemberVO", pmemberVO);
		
		// forwarding
		return "member/registerForm";
	}
	
	// <form:form modelAttribute="pmemberVO" method="post" action="/member/registerForm01Post">
	// 요청 URI : /member/registerForm02
	// 컨트롤러 메서드의 매개변수로 자바빈즈 객체를 사용하면 다시 화면으로 해당 객체를 전달해줌
	@GetMapping("/registerForm02")
	public String registerForm02(@ModelAttribute PmemberVO pmemberVO, Model model) {
		log.info("registerForm02");
		
		log.info("pmemberVO : " + pmemberVO.toString());
		
		// jsp에 반영이 됨
		pmemberVO.setId("a001");
		pmemberVO.setName("개똥이");
		
		// jsp에 반영이 안됨
		pmemberVO.setPassword("java");
		// 파라미터 : {"id" : "a001", "password", "java", "name" : "개똥이", "mail" : "asdf@asdf.com"}
		
		pmemberVO.setAddress("<p>안녕하세요?</p><p>반갑습니다</p>");
		
		// 취미
		Map<String, String> hobbyMap = new HashMap<String, String>();
		hobbyMap.put("01", "Sports");
		hobbyMap.put("02", "Music");
		hobbyMap.put("03", "Movie");
		
		// jsp에서 체크가 됨
//		pmemberVO.setHobbyMap(hobbyMap);
		
		// 성별(단일 선택) => form:radiobuttons
		Map<String , String> genderColdeMap = new HashMap<String, String>();
		genderColdeMap.put("Male", "Male");
		genderColdeMap.put("Female", "Female");
		genderColdeMap.put("Other", "Other");
		
		// 국적(단일 선택)
		// <select><option value="korea">한국</option>
		Map<String, String> nationalityMap = new HashMap<String, String>();
		nationalityMap.put("korea", "한국");
		nationalityMap.put("germany", "독일");
		nationalityMap.put("australia", "오스트레일리아");
		
		pmemberVO.setRegno("1111111111118");
		
		// model에 넣는다는 것은 items 속성을 사용한다는 의미도 됨
		model.addAttribute("nationalityMap", nationalityMap);
		model.addAttribute("genderColdeMap", genderColdeMap);
		model.addAttribute("hobbyMap", hobbyMap);
//		model.addAttribute("member", pmemberVO);
		
		// forwarding
		return "member/registerForm";
	}
	
	// <form:form modelAttribute="member" method="post" action="/member/registerForm01Post">
	// 요청 URI : /member/registerForm02
	// 컨트롤러 메서드의 매개변수로 자바빈즈 객체를 사용하면 다시 화면으로 해당 객체를 전달해줌
	// (어노테이션)ModelAttribute 어노테이션으로 폼 겍체의 속성명을 직접 시행할 수 있음
	@GetMapping("/registerForm03")
	public String registerForm03(@ModelAttribute("member") PmemberVO pmemberVO) {
		log.info("registerForm03");
		
		pmemberVO.setId("a001");
		pmemberVO.setName("개똥이");
		
		// forwarding
		return "member/registerForm";
	}
	
	// 파라미터 : {"id" : "a001", "name" : "개똥이", "mail" : "asdf@asdf.com", "password" : "java"}
	// 요청 URI => /member/registerForm01Post
	@PostMapping("/registerForm01Post")
	public String registerForm01Post(@ModelAttribute PmemberVO pmemberVO) {
		log.info("pmemberVO : " + pmemberVO.toString());
		
		// 생략가능
		// model.addAttribute("pmemberVO", pmemberVO);
		// pmemberVO = this.pmemberService.select(pmemberVO);
		
		// forwarding
		return "member/result";
	}
	// //////////////////// 스트링 폼 연습 끝 ///////////////////// 
	
	// 요청 URI => /member/detailMember
	// 요청 파라미터 : ?id=a001&name
	@GetMapping("/detailMember")
	public String detailMember(String id, @RequestParam Map<String, String> map, PmemberVO pmemberVO, Model model) {
		pmemberVO = this.pmemberService.detail(id);
		
		log.info("pmemberVO - detail : " + pmemberVO);
		
		// 스프링 폼을 사용하지 않는다면
		model.addAttribute("pmemberVO",pmemberVO);
		
		// forwarding
		return "member/detailMember";
	}
	
	// 컨트롤러 요청 연습 시작
	// 요청 URI : /member/register
	// 요청 파라미터 : ?id=a001&password=java
	@GetMapping("/register")
	public String registerByParameter(String id, String password) {
		log.info("registerByParameter");
		log.info("id : " + id);
		log.info("password : " + password);
		
		// forwarding
		return "member/loginMember";
	}
	
	// URL 경로 상의 경로 변수(path variable)로부터 요청 데이터를 취득할 수 있음
	// ${ id } : 경로변수
	// 요청 URI : /member/register/a001
	@GetMapping("/register/{id}")
	public String registerByPath(@PathVariable String id) {
		log.info("registerByPath");
		log.info("id : " + id);
		
		// forwarding
		return "member/loginMember";
	}
	
	// 폼 필드가 여러개일 때 폼 필드의 순서와 컨트롤러의 매개변수의 위치는 상관없음
	// 폼 필드값이 숫자일 때 매개변수는 문자로 전달되지만, 컨트롤러의 매개변수 타입이 숫자이면 숫자로 자동 타입 변환 됨
	// 요청 URI : /member/registerIntCast
	// 요청 파라미터 : ?id=a001&password=java&coin=10
	@GetMapping("/registerIntCast")
	public String registerIntCast(String password, String id, int coin) {
		log.info("registerIntCast");
		log.info("id : " + id);
		log.info("password : " + password);
		// 컨트롤러 매개변수 타입이 숫자형이면 타입 뱐환을 하여 요청데이터를 취득
		log.info("coin : " + coin);
		
		// forwarding
		return "member/loginMember";
	}
	
	// 폼필드명과 컨트롤러 매개변수명이 일치(대소문자 구분)해야 함
	// 요청 URI : /member/registerParamCorrect
	// 요청 파라미터 : ?id=a001&password=java&coin=10&bir=20220805
	@GetMapping("/registerParamCorrect")
	public String registerParamCorrect(String id, String password, int coin, @RequestParam("bir") String birth) {
		log.info("registerParamCorrect");
		log.info("id : " + id);
		log.info("password : " + password);
		log.info("coin : " + coin);
		log.info("memBir : " + birth);
		
		// forwarding
		return "member/loginMember";
	}
	
	// 폼 필드 요소 값을 자바빈즈 매개변수로 처리(바인딩) 가능하다.
	// 요청 URI : /member/register01
	// method : post
	// 요청 파라미터 : ?id=a001&password=java&name=개똥이&birth=2022-08-05
	@PostMapping("/register01")
	public String register01(@ModelAttribute PmemberVO pmemberVO, int coin) {
		log.info("register01");
		log.info("pmemberVO : " + pmemberVO.toString());
		
		// 폼 필드 요소 값을 1) 자바빈즈 매개변수(pmemberVO)와
		//			   2) 기본데이터 타입인 정수타입 매개변수로 처리 가능
		// 폼 필드 요소 값 목록의 순서와 상관이 없음
		log.info("coin : " + coin);
		
		// forwarding
		return "member/loginPmember";
	}
	
	// 기본은 연/월/일
	// 요청 URI : /member/registerByGet01?id=a001&birth=0805
	// 요청 URL : /member/registerByGet01
	// method : get
	// 1) 요청 파라미터 : ?id=a001&birth=0805
	// 1) 요청 파라미터 : ?id=a001&birth=2022-08-05
	// 1) 요청 파라미터 : ?id=a001&birth=20220805
	// 1) 요청 파라미터 : ?id=a001&birth=2022/08/05
	@GetMapping("/registerByGet01")
	public String registerByGet01(String id, Date birth) {
		log.info("registerByGet01");
		log.info("id : " + id);
		log.info("birth : " + birth);
		
		// forwarding
		return "member/loginPmember";
	}
	
	// 요청 URI : /member/registerFormField
	@GetMapping("/registerFormField")
	public String registerFormField() {
		log.info("registerFormField");
		
		// forwarding
		return "member/registerFormField";
	}
	
	// 요청 URI : /member/registerFormFieldPost
	@PostMapping("/registerFormFieldPost")
	public String registerFormFieldPost(String userId, String password, String gender, 
		String nationality, String[] carArray, String developer, boolean foreigner, MemberVO memberVO,
		AddressVO addressVO, String introduction, @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateOfBirth) {
		
		log.info("registerFormFieldPost");
		log.info("userId : " + userId);
		log.info("password : " + password);
		log.info("gender : " + gender);
		log.info("nationality : " + nationality);
		
		for (String car : carArray) {
			log.info("car : " + car);
		}
		
		log.info("developer : " + developer);
		log.info("foreigner : " + foreigner);
		log.info("postCode : " + addressVO.getPostCode());
		log.info("location : " + addressVO.getLocation());
		
		AddressVO address = memberVO.getAddress();
		if(address != null) {
			log.info("address.getPostCode() : " + address.getPostCode());
			log.info("address.getLocation() : " + address.getLocation());
		}
		
		List<CardVO> cardList = memberVO.getCardList();
		if(cardList != null) {
			for (CardVO cardVO : cardList) {
				log.info("cardList.no : " + cardVO.getNo());
				log.info("cardList.validMonth : " + cardVO.getValidMonth());
			}
		}
		
		log.info("introduction : " + introduction);
		log.info("dateOfBirth : " + dateOfBirth);
		
		log.info("memberVO : " + memberVO.toString());
		
		// forwarding
		return "member/registerFormField";
	}
	// 컨트롤러 요청 연습 끝
	
	// 파일 업로드 폼 방식 요청 처리 연습 시작
	// 요청 URI : /member/registerFile
	@GetMapping("/registerFile01")
	public String registerFile01() {
		log.info("registerFile01");
		
		// forwarding
		return "member/registerFile";
	}
	
	// 요청 URI : /member/registerFilePost
	// <input type="file" name="picture">
	// MultipartFile : 스프링 MVC가 지원하는 인터페이스
	// MultipartFile 매개변수로 처리
	// enctype="multipart/form-data"로 submit 되었어도
	// 폼필드를 String 타입의 매개변수로 받을 수 있음
	@PostMapping("/registerFilePost")
	public String registerFilePost(MultipartFile picture, MultipartFile picture2, String userId, 
			String password, MemberVO memberVO, MultipartFile[] pictureList, MultipartFile[] pictureMulti) {
		log.info("registerFilePost");
		log.info("========= picture : " + picture);
		
		log.info("picture - originalName : " + picture.getOriginalFilename());
		log.info("picture - size : " + picture.getSize());
		log.info("picture - contentType : " + picture.getContentType());
		
		log.info("picture2 - originalName : " + picture2.getOriginalFilename());
		log.info("picture2 - size : " + picture2.getSize());
		log.info("picture2 - contentType : " + picture2.getContentType());
		
		log.info("userId : " + userId);
		log.info("password : " + password);
		
		log.info("memberVO : " + memberVO.toString());
		
		// jsp에 name값을 pictureList로 동일하게 했을 경우 => List<MultipartFile>
		// pictureList[0], pictureList[1]로 받을 경우 => MultipartFile[] pictureList
		// 매개변수
		log.info("pictureList.length : " + pictureList.length);
		for (MultipartFile pic : pictureList) {
			log.info("pic(param - pictureList) - originalName : " + pic.getOriginalFilename());
			log.info("pic(param - pictureList) - size : " + pic.getSize());
			log.info("pic(param - pictureList) - contentType : " + pic.getContentType());
		}
		
		List<MultipartFile> pictureLists = memberVO.getPictureList();
		log.info("pictureLists.size() : " + pictureLists.size());
		for (MultipartFile pic : pictureLists) {
			log.info("pic(VO - pictureLists) - originalName : " + pic.getOriginalFilename());
			log.info("pic(VO - pictureLists) - size : " + pic.getSize());
			log.info("pic(VO - pictureLists) - contentType : " + pic.getContentType());
		}		
		
		// 매개변수
		// <input type="file" name="pictureMulti" multiple />
		log.info("pictureMulti.length : " + pictureMulti.length);
		for (MultipartFile pic : pictureMulti) {
			log.info("pic(param - pictureMulti) - originalName : " + pic.getOriginalFilename());
			log.info("pic(param - pictureMulti) - size : " + pic.getSize());
			log.info("pic(param - pictureMulti) - contentType : " + pic.getContentType());
		}
		
		// 자바빈 객체의 멤버변수
		// private list<MultipartFile> pictureMulti;
		List<MultipartFile> pictureMultiList = memberVO.getPictureMulti();
		for (MultipartFile pic : pictureMultiList) {
			log.info("pic(VO - pictureMultiList) - originalName : " + pic.getOriginalFilename());
			log.info("pic(VO - pictureMultiList) - size : " + pic.getSize());
			log.info("pic(VO - pictureMultiList) - contentType : " + pic.getContentType());
		}
		
		return "member/registerFile";
	}
	// 파일 업로드 폼 방식 요청 처리 연습 끝
	
	// Ajax 요청 처리 방식 시작
	// 요청 URI : /member/ajaxForm
	@GetMapping("/ajaxForm")
	public String ajaxForm() {
		log.info("ajaxForm");
		
		//forwarding
		return "member/ajaxForm";
	}
	
	// 요청 URI : /member/ajaxRegister/hongkd
	// (어노테이션)PathVariable : 경로상의 변수 가지고 옴
	@GetMapping("/ajaxRegister/{userId}")
	public ResponseEntity<String> ajaxRegister(@PathVariable("userId") String userId) {
		log.info("ajaxRegister");
		log.info("userId : " + userId);
		
		//return 1) String 2) network http 상태
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	// brdId(동적 게시판 아이디) => board, notice, qanda..
	// brdNo(게시판 글번호) => 100, 127, 35..
	// 요청 URI : /member/ajaxRegister/board/127
	// 요청 파라미터 : json 데이터 => {userId:userIdVal, password:passwordVal}
	// JSON 요청 데이터는 문자열 매개변수로 처리할 수 없음
	// 	-> 요청 URI에 쿼리 파라미터를 붙여서 전달하면 문자열 매개변수로 처리가 가능
	@PostMapping("/ajaxRegister/{brdId}/{brdNo}")
	public ResponseEntity<String> ajaxRegister2(@PathVariable("brdId") String brdId,
			@PathVariable("brdNo") String brdNo, @RequestBody MemberVO memberVO, String userId, String password) {
		log.info("brdId : " + brdId);
		log.info("brdNo : " + brdNo);
		
		log.info("userId : " + userId);	// null => ajax에서 ?해서 파라미터를 보내주면 해결 가능
		log.info("password : " + password);	// null
		
		log.info("memberVO : " + memberVO.toString());
		
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	// 요청 URI : /member/ajaxArrayForm
	// 요청 파라미터 : 객체 배열 타입의 JSON 데이터
	@GetMapping("/ajaxArrayForm")
	public String ajaxArrayForm() {
		log.info("ajaxArrayForm");
		
		//forwarding
		return "member/ajaxArrayForm";
	}
	
	// 요청 URI : /member/ajaxArrayFormPost
	// 요청 파라미터 : [{userId:"a001", password:"java"}, {userId:"b001", password:"java"}]
	// JSON 데이터는 (어노테이션)RequestBody로 받음
	// (어노테이션)PostMapping("/ajaxArrayFormPost")
	// 미디어 타입 .produces는 요청의 Accept 헤더 값을 지정하기 위함
	@RequestMapping(value = "/ajaxArrayPost", method = RequestMethod.POST, produces = "application/json")
	public HttpEntity<String> ajaxArrayFormPost(@RequestBody List<MemberVO> memberVOList) {
		log.info("ajaxArrayFormPost");
		
		for (MemberVO memberVO : memberVOList) {
			log.info("memberVO : " + memberVO.toString());
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	// Ajax 요청 처리 방식 끝
	
	// 파일 업로드 Ajax방식 요청 처리 연습 시작
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		log.info("uploadAjax");
		
		// forwarding
		return "member/uploadAjax";
	}
	
	// 요청 URI : /member/uploadAjaxPost
	// 요청 파라미터 : formData(폼 객체)
	// 요청 파라미터는 요청 헤더를 통해서 넘어오는데,
	// 헤더값을 매핑 조건으로 지정하는 경우에는 produces 속성을 사용함
	@RequestMapping(value = "/uploadAjaxPost", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjaxPost(MultipartFile file) {
		String originalFileName = file.getOriginalFilename();
		log.info("originalFileName : " + originalFileName);
		
		ResponseEntity<String> entity = new ResponseEntity<String>("UPLOAD SUCCESS " + originalFileName, HttpStatus.OK);
		
		return entity;
	}
	// 파일 업로드 Ajax방식 요청 처리 연습 끝
	
	// 데이터 전달자(Controller => jsp) 모델 연습 시작
	/*
		1) ModelAndView
		2) Model : 데이터
		3) (어노테이션)Responsebody : json 데이터
	*/
	
	// 요청 URI : /member/mhome
	@GetMapping("/mhome")
	public String mhome(Locale locale, Model model) {
		log.info("Welcome home! The client licale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		// 2022년 8월 9일 (화) 오후 12시 16분 17초
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("sercerTime", formattedDate);
		
		// forwarding
		return "member/mhome";
	}
	
	// 요청 URI : /member/read01
	@GetMapping("/read01")
	public String read01(Model model) {
		log.info("read01");
		
		model.addAttribute("userId", "a001");
		model.addAttribute("password", "java");
		model.addAttribute("email", "test@test.com");
		model.addAttribute("userName", "개똥이");
		model.addAttribute("birthDay", "1996-12-24");
		
		// forwarding
		return "member/read01";
	}
	
	// 요청 URI : /member/read02
	// 응답 데이터 : pmemberVO 객체
	@GetMapping("/read02")
	public String read02(Model model) {
		log.info("read02");
		
		PmemberVO pmemberVO = new PmemberVO();
		pmemberVO.setId("a001");
		pmemberVO.setPassword("java");
		pmemberVO.setMail("test@test.com");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1999);	// 년
		cal.set(Calendar.MONTH, 4);		// 월
		cal.set(Calendar.DAY_OF_MONTH, 9);	// 일
		
		// private Date birth;
		pmemberVO.setBirth(cal.getTime());
		
		model.addAttribute("pmemberVO", pmemberVO);
		
		// forwarding
		return "member/read02";
	}
	
	// 요청 URI : /member/read03
	@GetMapping("/read03")
	public String read03(Model model) {
		String[] carArray = {"saab", "audi"};
		
		List<String> carList = new ArrayList<String>();
		carList.add("제네시스");
		carList.add("티볼리");
		
		List<PmemberVO> pmemberVOList = new ArrayList<PmemberVO>();
		PmemberVO pmemberVO = new PmemberVO();
		pmemberVO.setId("a001");
		pmemberVO.setName("개똥이");
		
		pmemberVOList.add(pmemberVO);
		
		pmemberVO = new PmemberVO();
		pmemberVO.setId("b001");
		pmemberVO.setName("개진순");
		
		pmemberVOList.add(pmemberVO);
		
		model.addAttribute("carArray", carArray);
		model.addAttribute("carList", carList);
		model.addAttribute("pmemberVOList", pmemberVOList);
		
		return "member/read03";
	}
	
	// 요청 URI : /member/read03Post
	// (어노테이션)ResponseBody : JSON 타입으로 리턴
	@ResponseBody
	@PostMapping("/read03Post")
	public List<PmemberVO> read03Post() {
		List<PmemberVO> pmemberVOList = new ArrayList<PmemberVO>();
		PmemberVO pmemberVO = new PmemberVO();
		pmemberVO.setId("a001");
		pmemberVO.setName("개똥이");
		
		pmemberVOList.add(pmemberVO);
		
		pmemberVO = new PmemberVO();
		pmemberVO.setId("b001");
		pmemberVO.setName("개진순");
		
		pmemberVOList.add(pmemberVO);
		
		return pmemberVOList;
	}
	
	// 데이터 전달자(Controller => jsp) 모델 연습 끝
}
