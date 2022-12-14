package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

// @ : 어노테이션

/*
	Controller 어노테이션
	스프링 프레임워크에게 "이 클래스는 웹 브라우저의 요청(request)를
	받아들이는 컨트롤러야" 라고 알려주는 것임
	servlet-context.xml의 context:component-scan의 설정에 의해
	이 클래스를 자바빈(bean) 객체로 등록(메모리에 바인딩).
*/
@Slf4j
@Controller
public class BookController {
	// 도서관리 프로그램
	// 서비스를 호출하기 위해 의존성 주입(Dependency Injection - DI)
	@Autowired
	BookService bookService;
	
	// URI => http://localhost/create
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		/*
			ModelAndView
			1) Model : Controller가 반환할 데이터(String, int, List, Map, VO..)를 담당
			2) View : 화면을 담당(뷰(View : JSP)의 경로)
		*/
		ModelAndView mav = new ModelAndView();
		
		// servlet-context.xml에서 beans:bean에 beans:property로 prefix와 suffix를 설정
		// prefix : /WEB-INF/views/
		// forward
		mav.setViewName("book/create");	// svn 친 후 ctrl+space : setViewName
		// suffix : .jsp
		return mav;
	}
	
	// <form action="/create" method="post">
	// HTTP 파라미터(요청 파라미터)
	//	=> {"title" : "총알탄 개똥이", "category" : "소설", "price" : "10000", "insertDate" : ""} 
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute BookVO bookVO, ModelAndView mav) {
		log.info("bookVO : " + bookVO.toString());
		
		int bookId = this.bookService.insert(bookVO);
		log.info("bookId : " + bookId);		
		
		if(bookId<1) {	// 등록 실패
			// ModelAndView mav = new ModelAndView();
			// /create로 redirect => 요청을 다시 함 => uti 주소가 바뀜
			mav.setViewName("redirect:/create");
		}else {	// 등록 성공
			mav.setViewName("redirect:/detail?bookId=" + bookId);
		}
		
		return mav;
	}
	
	// 책 상세보기
	// 요청된 URI 주소 : http://localhost/detail?bookId=3
	// ?bookId=3 : 쿼리 스트링(Query String)
	// bookVO => {"bookId" : "1", "title" : "", "category" : "", "price" : "0", "insertDate" : ""}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@ModelAttribute BookVO bookVO, ModelAndView mav) {
		log.info("bookVO : " + bookVO.toString());
		
		// {"bookId" : "1", "title" : "총알탄 개똥이", "category" : "소설", "price" : "10000", "insertDate" : "2022/07/18"}
		BookVO data = this.bookService.select_detail(bookVO);
		
		// model : 데이터를 jsp로 넘겨줌
		mav.addObject("data", data);
		mav.addObject("bookId", data.getBookId());
		
		// forwarding => 데이터를 jsp로 넘겨줌 / but, redirect => 데이터를 jsp로 못넘겨줌
		// view : jap 경로
		// /WEB-INF/views/ + ... + .jsp
		mav.setViewName("book/detail");
		
		return mav;
	}
	
	// 요청URL : /update?bookId=3
	//(어노테이션)GetMapping
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	// update(어노테이션@RequestParam int bookId)
	// int bookId는.. bookId=3을 받으면 String임. 자동 형변환이 됨
	public ModelAndView update(@ModelAttribute BookVO bookVO, ModelAndView mav) {
		// 책 수정 롸면 = 책 입력 화면 + 챡 상세 화면
		// 책 입력 화면 형식을 그대로 따라고 빈 칸을 데이터로 채워주면 됨
		BookVO data = this.bookService.select_detail(bookVO);
		
		mav.addObject("data", data);
		
		// view : jsp의 경로
		// /WEB-INF/views/ + ... + .jsp
		// forwading
		mav.setViewName("book/update");
		
		return mav;
	}
	
	// <form action="/update" method="post">
	// 요청 파라미터 => {"bookId" : "3", "title" : "총알탄 개똥이", "category" : "소설", "price" : "10000", "insertDate" : "2022/07/18"}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute BookVO bookVO, ModelAndView mav) {
		int result = this.bookService.update(bookVO);
		
		if(result>0) {	// 업데이트 성공 -> 책 상세페이지(detail.jsp)로 이동
			// 요청된 URI 주소 : http://localhost/detail?bookId=3
			mav.setViewName("redirect:/detail?bookId=" + bookVO.getBookId());
		}else {	// 업데이트 실패 -> 업데이트 뷰(update.jsp) 페이지로 이동
			mav.setViewName("redirect:/update?bookId=" + bookVO.getBookId());
		}
		
		return mav;
	}
	
	// 요청 URI => http://localhost/delete
	// 요청 파라미터(post) => {"bookId" : "3"}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute BookVO bookVO, ModelAndView mav) {
		log.info("bookVO : " + bookVO.toString());
		
		int result = this.bookService.delete(bookVO);
		
		if(result>0) {	// 삭제 성공
			// 목록으로 요청 이동(상세페이지가 없으므로)
			mav.setViewName("redirect:/list");
		}else {	// 삭제 실패
			// 상세페이지로 이동
			mav.setViewName("redirect:/detail?bookId=" + bookVO.getBookId());
		}
		
		return mav;
	}
	
	// 요청 URI => http://localhost/list?keyword=검색어
	// @RequestParam(value = "파라미터 name(keyword)", required = false(? keyword= 일때 오륩아지))
	// 스프링에서 파라미터를 매개변수로 받을 수 있다.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav, @RequestParam(value = "keyword", required = false) String keyword) {
		List<BookVO> list = this.bookService.list(keyword);
		
		// select 결과 목록을 데이터로 넣어줌. jsp로 리턴
		mav.addObject("data", list);
		mav.addObject("keyword", keyword);
		
		// forwarding
		mav.setViewName("book/list");
		
		return mav;
	}
}















