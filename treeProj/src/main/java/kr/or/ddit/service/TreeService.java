package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.TreeVO;

// 서비스 interface : 비지니스 로직
public interface TreeService {
	public List<TreeVO> select();
}
