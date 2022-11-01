package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemVO;

public interface MemService {
	
	// 메소드 시그니처
	// 회원번호 생성
	public int makeUserNo();
	
	// 아이디 중복 체크
	public int dupChk(MemVO memVO);
	
	// 회원 및 회원 권한 및 첨부 테이블 insert
	public int insert(MemVO memVO);
	
	public List<MemVO> memList(Map<String, String> map);
	
	public int getTotal(Map<String, String> map);
}
