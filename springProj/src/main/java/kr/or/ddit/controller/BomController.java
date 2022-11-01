package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.BomService;
import kr.or.ddit.vo.BomVO;

@RequestMapping("/bom")
@Controller
public class BomController {
	@Autowired
	private BomService bomService;
	
	@GetMapping("/bomList")
	public String bomList(Model model) {
		List<BomVO> bomVOList = bomService.list();
		
		model.addAttribute("list", bomVOList);
		
		return "bom/bomList";
	}
}
