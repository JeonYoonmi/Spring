package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainController {
	// 요청 URI : /
	@GetMapping("/")
	public String home() {
		// forwarding
		return "index";
	}
}
