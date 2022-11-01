package kr.or.ddit.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.BomMapper;
import kr.or.ddit.service.BomService;
import kr.or.ddit.vo.BomVO;


@Service
public class BomServiceImpl implements BomService {
	@Autowired
	private BomMapper bomMapper;
	
	@Override
	public List<BomVO> list() {
		return bomMapper.list();
	}
	
}
