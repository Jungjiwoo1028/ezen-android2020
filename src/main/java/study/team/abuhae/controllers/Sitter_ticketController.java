package study.team.abuhae.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Sitter_ticketController {
	
	// 시터 이용권 페이지
	@RequestMapping(value = "/buy/sitter_ticket.do", method = RequestMethod.GET)
	public String sitter_ticket(Model model) {

		return "/buy/sitter_ticket";
	}
}