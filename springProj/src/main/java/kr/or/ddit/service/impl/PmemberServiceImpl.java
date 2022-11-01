package kr.or.ddit.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.PmemberDao;
import kr.or.ddit.service.PmemberService;
import kr.or.ddit.vo.PmemberVO;

/*
	- 트렌젝션 : 데이터 베이스를 변결하기 위해 수행 되어야 할 논리적 단위. 여러개의 SQL(Insert, Update, Delete)로 구성.
		원일고지
			=> 치킨 한 마리를 먹기를 원하는가? 그러면 혼자 먹지 말고 친구에게 고지하여 함께 먹자. 그래야 더 맛있는 법이다.
			* 원자성 : All or Nothing
			* 일관성 : 트렌젝션 성공시 모든 데이터는 일관성을 유지해야함
			* 고립성 : 트렌젝션 진행시 외부 간섭없도록 함.(화장실)
			* 지속성 : 트렌젝션 성공시 그 결과는 영속적으로 보관되어야 함.
		
	
*/

@Service
public class PmemberServiceImpl implements PmemberService{
	// IoC(Inversion of Control : 제어의 역전)
	// DI(Dependency Injection : 의존성 주입)
	@Autowired
	PmemberDao pmemberdao;
	
	// 로그인
	// member : {"id":"a001", "password":"java"}
	@Override
	public PmemberVO login(Map<String, Object> map) {
		return this.pmemberdao.login(map);
	}

	// 회원가입
	@Override
	public int inset(PmemberVO pmemberVO) {
		return this.pmemberdao.insert(pmemberVO);
	}

	@Override
	public PmemberVO detail(String id) {
		return this.pmemberdao.detail(id);
	}

}
