package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.TreeService;
import kr.or.ddit.vo.TreeVO;
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
@RequestMapping("/tree")
public class TreeController {
	// 도서관리 프로그램
	// 서비스를 호출하기 위해 의존성 주입(Dependency Injection - DI)
	@Autowired
	TreeService treeService;
	
	// URI => http://localhost/create
	@GetMapping("/tree")
	public String tree(Model model) {
		List<TreeVO> list = this.treeService.select();
		model.addAttribute("list", list);
		log.info("list : " + list);
		
		return "tree/treeView";
	}
}















