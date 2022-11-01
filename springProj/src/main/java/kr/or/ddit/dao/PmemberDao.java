package kr.or.ddit.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.PmemberVO;
import oracle.net.aso.p;

@Repository
public class PmemberDao {
	// DI(Dependency Injection : 의존성 주입)
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 로그인
	public PmemberVO login(Map<String, Object> map) {
		// 로그인의 경우 아이디에 해당되는 행은 1행
		// .selectOne("namespace.id", 파라미터)
		return this.sqlSessionTemplate.selectOne("pmember.login", map);
	}
	
	// 회원가입
	// id=a001, password=1234, name=홍길동, gender=여, mail=Test@naver.com, phone=010-1234-1234, address=대전 유성구 문지동, registDay=null, birth=1999-05-09
	public int insert(PmemberVO pmemberVO) {
		// .insert("namespace.id", 파라미터)
		return this.sqlSessionTemplate.insert("pmember.insert", pmemberVO);
	}
	
	// 회원 상세
	public PmemberVO detail(String id) {
		// .selectOne("namespace.id", 파라미터)
		return this.sqlSessionTemplate.selectOne("pmember.detail", id);
	}
}
