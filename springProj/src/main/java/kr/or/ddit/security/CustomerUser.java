package kr.or.ddit.security;

import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.MemVO;

// 사용자가 유저를 정의람
// memVO(사용자 정의한 유저) 정보를 User(스프링 시큐리티에서 정의된 유저) 객체 정보에 연계하여 넣어줌
// Customer의 객체 => principal
public class CustomerUser extends User {

	/*
		private String password;
		private final String username;
		private final Set<GrantedAuthority> authorities;
		private final boolean accountNonExpired;
		private final boolean accountNonLocked;
		private final boolean credentialsNonExpired;
		private final boolean enabled;
	*/
	
	// 객체 선언
	private MemVO memVO;
	
	// User의 샹성자를 처리해주는 생성자임
	public CustomerUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
	}
	
	// 생성자. return memVO == null? null:new CustomerUser(memVO);
	public CustomerUser(MemVO memVO) {
		// 시용자가 정의한 (select한) MemVO 타입의 객체 memVO를
		// 스프링 시큐리티에서 제공해주고 있는 UsersDetails 타입으로 변환
		// 회원정보를 보내줄테니 이제부터 프링이 너가 관리해줘
		super(memVO.getUserNo() + "", memVO.getUserPw(), 
			memVO.getMemAuthVOList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.memVO = memVO;
	}

	public MemVO getMemVO() {
		return memVO;
	}

	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
	
}
