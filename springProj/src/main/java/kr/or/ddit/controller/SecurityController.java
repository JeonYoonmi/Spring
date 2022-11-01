package kr.or.ddit.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/security")
@Controller
public class SecurityController {

	// 인증(Authentication) 거부
	// 요청 URI : /security/accessError
	@GetMapping("/accessError")
	public String accessError(Authentication auth, Model model) {
		// 인증과 관련된 정보를 보여주자
		log.info("accesss Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
		// forwarding
		return "security/accessError";
	}
	
	// 요청 URI : /security/login
	@GetMapping("/login")
	public String login() {
		log.info("login");
		
		// forwarding
		return "security/login";
	}
}
