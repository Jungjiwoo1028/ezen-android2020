package study.team.abuhae.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Sitter_interviewController {
	
	@RequestMapping(value = "/page_detail/sitter_page_detail/sitter_interview.do", method = RequestMethod.GET)
	public String IntroWebsite(Model model) {

		return "/page_detail/sitter_page_detail/sitter_interview";
	}

}

