package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.TreeVO;
import lombok.extern.slf4j.Slf4j;

// 메퍼xml(book_SQL.xml)을 실행시키는 DAO클래스
// DAO(Data Access Object) 클래스
// Repository 어노테이션 : 데이터에 접근하는 클래스
// 스프링이 대이토를 관리하는 클래스라고 인지하여 자바빈으로 등록하여 관리함
@Slf4j
@Repository
public class TreeDao {
	// DI(Dependency Injection) : 의존성 주입
	// ★new 키워드를 통해 직접 생성하지 않고
	// 스프링이 미리 만들어 놓은(서버 실행 시 스프링이 미리 xml을 읽어 객채를 인스턴스화 해놓음)
	// SqlSessionTemplate 타입 객체를 BookDao 객체에 주입함
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// <insert id="insert" parameterType="bookVO">
	public List<TreeVO> select() {
		List<TreeVO> list = this.sqlSessionTemplate.selectList("tree.select");
		log.info("list : " + list);
		return list;
	}
}





















