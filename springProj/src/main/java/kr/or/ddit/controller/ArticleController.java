package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.ArticleService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArticleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/article")
@Controller
public class ArticleController {
	// IoC(Inversion of Controller)
	@Inject
	ArticleService articleService;
	
	// (어노테이션)ModelAttribute ArticleVO articleVO의 articleVO 이름과
	// <form:form modelAttribute="articleVO" 이름을 통해
	// view(jsp)와 컨트롤러(java) 간에 연결이 됨
	// 요청 URI : /article/write
	@GetMapping("/write")
	public String write(@ModelAttribute ArticleVO articleVO, HttpServletRequest request) {
		log.info("articleVO : " + articleVO);
		
		HttpSession session = request.getSession();
		
		// session에서 id를 받아왔다고 하자.
		articleVO.setWriterId("a001");
		
		// forwarding
		return "article/write";
	}
	
	// 요청 URI : /article/writePost
	// (어노테이션)validated : 입력값 검증 기능을 활성화
	/*
		p.384
		BindingResult에는 요청 파라미터의 바인딩 오류와 입력값 검증(숫자타입의 멤버변수에 문자가 옴) 오류 정보가 저장더;ㅁ
		- hasErrors() : 오류 발생시 true를 반환
	*/
	@PostMapping("/writePost")
	public String writePost(@Validated ArticleVO articleVO, BindingResult brResult) {
		
		/*
			ArticleVO(articleNo=0, writerId=a001, writerName=개똥이, title=닥터로이어, 
			artContent=<p>내용입니다.</p>, regdate=null, modate=null, readCnt=0)
		 */
		
		// 도메인 클래스(ArticleVO의 writerName 및 title 멤버 변수에 오류가 발생함
		// brResult.hasErrors() => true
		log.info("brResult.hasErrors() : " + brResult.hasErrors());
		
		// 오류 발생시
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
			
			for (ObjectError globalError : globalErrors) {
				log.info("globalError : " + globalError);
			}
			
			for (FieldError fieldError : fieldErrors) {
				log.info("fieldError : " + fieldError.getDefaultMessage());
			}
			
			// redirect로는 안되고, forwarding만 됨
			return "article/write";
		}
		
		log.info("articleVO : " + articleVO.toString());
		
		int result = this.articleService.insert(articleVO);
		log.info("result : " + result);
		
		return "redirect:/article/list";
	}
	
	// 요청 URI : /article/list
	//  RedirectAttributes 타입 : 일회성으로 데이터를 전달하는 용도로 사용
	@GetMapping("/list")
	public String list(Model model, @RequestParam Map<String, String> map, RedirectAttributes rttr) {
		// map : {show=10, cond=전체, keyword=개똥이 currentPage=3}
		log.info("map : " + map);
		
		// 한 화면에 보여지는 행의 수(기본 10행)
		int page = 10;
		if(map.size() > 0) {
			if(map.get("show") != null) {
				page = Integer.parseInt(map.get("show"));
			}
		}else {
				map.put("show", "10");
				map.put("cond", "");
				map.put("keyword", "");
				map.put("currentPage", "1");
			}
		
		String currentPage = map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		// 글 검색 후 목록 리턴
		List<ArticleVO> list = this.articleService.list(map);
		
		
		if(list!=null) {
			log.info("data : " + list.get(0).toString());
		}
		
		int total = this.articleService.getTotal(map);
		
		// select 결과 list를 페이징 객체에 테워서 보냄
		// (전체 글 수 , 현재페이지, 한 화면에 보여질 행 수, select결과 list)
		model.addAttribute("data", new ArticlePage<ArticleVO>(total, Integer.parseInt(currentPage), page, list));
		
		// JSP 쪽으로 map : {show=10, cond=전체, keyword=개똥이 currentPage=3}
		model.addAttribute("map", map);
		
		// redirect에서만 사용 가능
//		rttr.addFlashAttribute("map", map);
		
		// forwarding
		return "article/list";
	}
	
	// 요청 URI : /article/detail?articleNo=1
	// 스프링에서는 요청 파라미터(articleNo=1)을 매게변수로 받을 수 있음
	// 파라미터는 String인데 spring에서 int로 자동 형변환 해줌
	@GetMapping("/detail")
	public String detail(int articleNo, Model model) {
		log.info("detail");
		
		ArticleVO articleVO = this.articleService.detail(articleNo);
		
		log.info("articleVO : " + articleVO);
		
		model.addAttribute("data", articleVO);
		
		// forwarding
		return "article/detail";
	}
	
	// 파라미터  : {"articleNo" : "79" , "writerId" : "a001", "writerName" : "개똥이", "title" : "제목", "artContent" : "내용"}
	// 요청  URI => /article/updatePost
	@PostMapping("/updatePost")
	public String updatePost(RedirectAttributes rat, String articleNo, String writerId, String writerName, String title, @RequestParam("artContent") String artContent, @RequestParam Map<String, String> map, @ModelAttribute ArticleVO articleVO) {
		log.info("articleVO : " + articleVO);
		
		int result = this.articleService.update(articleVO);
		
		log.info("update : " + result);
		
		// /article/detail?articleNo=1
		rat.addFlashAttribute("articleNo", articleVO.getArticleNo());
		
		// redirect
		return "redirect:/article/detail?articleNo=" + articleVO.getArticleNo();
	}
	
	// 파라미터  : {"articleNo" : "79" , "writerId" : "a001", "writerName" : "개똥이", "title" : "제목", "artContent" : "내용"}
	// 요청 URI => /locathost/article/deletPost
	@PostMapping("/deletePost")
	public String deletePoat(@ModelAttribute ArticleVO articleVO) {
		log.info("articleNo : " + articleVO.getArticleNo());
		
		int articleNo = articleVO.getArticleNo();
		
		int result = this.articleService.delete(articleNo);
		
		log.info("delete : " + result);
		
		// redirect
		return "redirect:/article/list";
	}
}
