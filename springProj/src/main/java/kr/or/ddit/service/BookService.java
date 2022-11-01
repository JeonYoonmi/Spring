package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BookVO;

// 서비스 interface : 비지니스 로직
public interface BookService {
	// 메소드 시그니처
	public int insert(BookVO bookVO);
	
	// 책 상세보기
	public BookVO select_detail(BookVO bookVO);
	
	// 책 수정하기
	public int update(BookVO bookVO);
	
	// 책 삭제하기
	public int delete(BookVO bookVO);
	
	// 책 목록 보기
	public List<BookVO> list(String keyword);
}
