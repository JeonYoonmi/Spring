package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.MemMapper;
import kr.or.ddit.service.MemService;
import kr.or.ddit.vo.MemVO;

@Service
public class MemServiceImpl implements MemService {
	
	@Autowired
	MemMapper memMapper;
	
	// 회원번호 생성
	@Override
	public int makeUserNo() {
		return this.memMapper.makeUserNo();
	}

	// 아이디 중복 체크
	@Override
	public int dupChk(MemVO memVO) {
		return this.memMapper.dupChk(memVO);
	}

	// 회원 및 회원 권한 insert. 스프링이 알아서 트렌젝션 처리를 해줌
	@Transactional
	@Override
	public int insert(MemVO memVO) {
		// 하나의 트렌젝션에 여러개의 SQL이 실행되고 있음
		// 회원 테이블(MEM) INSERT
		this.memMapper.insertMem(memVO);
		
		// 첨부파일이 있을 시에만 실행
		if(memVO.getAttachVOList() != null) {
			// 첨부 테이블(ATTACH) INSERT (List<AttachVO>) => 선택
			this.memMapper.insertAttach(memVO.getAttachVOList());
		}
		
		// 회원 권한 테이블(MEM_AUTH) INSERT => 필수 
		return this.memMapper.insertMemAuth(memVO.getMemAuthVOList());
	}

	// 회원 목록
	@Override
	public List<MemVO> memList(Map<String, String> map) {
		return this.memMapper.memList(map);
	}

	@Override
	public int getTotal(Map<String, String> map) {
		return this.memMapper.getTotal(map);
	}

}
