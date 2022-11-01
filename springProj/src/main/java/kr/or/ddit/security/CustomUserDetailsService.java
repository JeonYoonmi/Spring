package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MemMapper;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

// UserDetailsService : 스프링 시큐리티에서 제공해주고 있는
// 사용자 상세 정보를 갖고 있는 클래스
@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemMapper memMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username : 로그인시 입력받은 회원의 아이디
		MemVO memVO = memMapper.detail(username);
		
		log.warn("memVO : " + memVO.toString());
		
		// MVC에서는 Controller로 리턴하지 않고, CustomerUser로 리턴함
		// CustomerUser : 사용자 정의 유저 정보. extends User를 하고 있음
		// 2) 스프링 시큐리티의 User 객체의 정보로 넣어줌 => 프링이가 이제부터 해당 유저를 관리
		// User : 스프링 시큐리티에서 제공해주고 있는 사용자 정보 클래스
		return memVO == null ? null:new CustomerUser(memVO);
	}

}
