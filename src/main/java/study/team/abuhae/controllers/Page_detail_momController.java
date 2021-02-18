package study.team.abuhae.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.DetailService;

@Controller
public class Page_detail_momController {
	
	@Autowired
	DetailService detailService;
	
	// 맘 상세페이지
	@RequestMapping(value = "/page_detail/mom_page_detail/mom_detail.do", method = RequestMethod.GET)
	public String mom_detail(Model model,
			@RequestParam(value = "momno", defaultValue = "0") int momno) {
		
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Mom_info input = new Mom_info();
			input.setMomno(momno);
			
			// 조회결과를 저장할 객체 선언 
			Mom_info output = null;
			
			try {
				// 데이터 조회 
				output = detailService.getMomItem(input);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("output", output);
			return "/page_detail/mom_page_detail/mom_detail";
	}
	
	// 맘 상세페이지 > 인터뷰 페이지
		@RequestMapping(value = "/page_detail/mom_page_detail/mom_interview.do", method = RequestMethod.GET)
		public String mom_interview(Model model,
				@RequestParam(value = "momno", defaultValue = "0") int momno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Mom_info input = new Mom_info();
			input.setMomno(momno);
			
			// 조회결과를 저장할 객체 선언 
			Mom_info output = null;
			
			try {
				// 데이터 조회 
				output = detailService.getMomItem(input);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("output", output);
			return "/page_detail/mom_page_detail/mom_interview";
	}

}
