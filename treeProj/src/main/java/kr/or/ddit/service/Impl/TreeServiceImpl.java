package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.TreeDao;
import kr.or.ddit.service.TreeService;
import kr.or.ddit.vo.TreeVO;

// 서비스 클래스 : 비지니스 로직
// 스프링 MVC 구조에서 Controller와 DAO를 연결하는 역할
/*
	스프링 프레임워크는 직접 클래스를 생성하는 것을 지양하고,
	* 프링이는 인터페이스를 좋아해. 자꾸자꾸 좋아하면 Impl은 어떡해
	인터페이스를 통해 접근하는 것을 권장하고 있기 때문(확장성)
	그래서 서비스 레이어는 인터페이스(BookService)와 클래스(BookServiceImpl)를 함께 사용함
	
	Impl : inplement의 약자
*/
// "프링아 이 클래스는 서비스 클래스야"라고 알려주자. 프링이가 자바빈으로 등록해줌
@Service
public class TreeServiceImpl implements TreeService{
	// 데이터 베이스는 접근을 위해 BookDao 인스턴스를 주입받자
	@Autowired
	TreeDao treeDao;
	
	// Override 어노테이션 : 메소드 재정의
	@Override
	public List<TreeVO> select() {
		// bookId를 리턴받음
		return this.treeDao.select();
	}
}
