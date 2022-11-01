package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.MemAuthVO;
import kr.or.ddit.vo.MemVO;

public interface MemMapper {
	// 회원번호 생성
	public int makeUserNo();
	
	// 아이디 중복 체크
	public int dupChk(MemVO memVO);
	
	// 회원 테이블(MEM) INSERT
	public int insertMem(MemVO memVO);

	// 첨부 테이블(ATTACH) INSERT
	public int insertAttach(List<AttachVO> attachVOList);
	
	// 회원 권한 테이블(MEM_AUTH) INSERT
	public int insertMemAuth(List<MemAuthVO> memAuthVOList);
	
	// 회원 목록
	public List<MemVO> memList(Map<String, String> map);
	
	// 회원 상세
	public MemVO detail(String username);
	
	// 회원 전체 수
	public int getTotal(Map<String, String> map);
}
