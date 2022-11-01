package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Override
	   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
			   Authentication auth) throws ServletException, IOException {
		
	      log.warn("onAuthenticationSuccess");
	      
	      // auth.getPrincipal() : 사용자 정보를 가져옴
	      // * 시큐리티에서 사용자 정보는 User 클래스의 객체로 저장함
	      User customUser = (User)auth.getPrincipal();
	      
	      // 사용자의 이름을 리턴해줌
	      log.info("username : " + customUser.getUsername());
	      
	      // SavedRequestAwareAuthenticationSuccessHandler을
	      // onAuthenticationSuccess
	      // 자식으로 request, response, auth를 파라미터로 받아서
	      // 부모(super)에게 setting
	      super.onAuthenticationSuccess(request, response, auth);
	   }
}
