package study.team.abuhae.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.ServletContextLiveBeansView;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Cus_category;
import study.team.abuhae.model.Cus_sub_category;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.CustomerService;



@Controller
public class CustomerController {
	/** 객체 주입 */
	@Autowired WebHelper webHelper;
	@Autowired RegexHelper regexHelper;
	@Autowired CustomerService customerService;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/customer/faq.do", method = RequestMethod.GET)
	public ModelAndView guide(Model model, HttpServletResponse response, HttpServletRequest request) {
		// 조건값 Beans에 저장하기
		List<Cus_category> out = null;
		
		try {
			// 데이터 조회 
			out = customerService.getCusSubCateList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<Cus_sub_category> output = null;
		
		try {
			// 데이터 조회 
			output = customerService.getCusBbslist(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("out", out);
		model.addAttribute("output", output);
		
		return new ModelAndView("customer/faq");
	}
	
	
	@RequestMapping(value = "/customer/notice_site.do", method = RequestMethod.GET)
	public ModelAndView notice_site(Model model) {
		// 조건값 Beans에 저장하기
		List<Cus_category> out = null;
		
		try {
			// 데이터 조회 
			out = customerService.getCusSubCateList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<Cus_sub_category> output = null;
		
		try {
			// 데이터 조회 
			output = customerService.getCusBbslist(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("out", out);
		model.addAttribute("output", output);
		
		return new ModelAndView("customer/notice_site");
	}
	
	@RequestMapping(value = "/customer/question_mom.do", method = RequestMethod.GET)
	public ModelAndView question_mom(Model model) {
		// 조건값 Beans에 저장하기
		List<Cus_category> out = null;
		
		try {
			// 데이터 조회 
			out = customerService.getCusSubCateList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<Cus_sub_category> output = null;
		
		try {
			// 데이터 조회 
			output = customerService.getCusBbslist(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("out", out);
		model.addAttribute("output", output);
		
		return new ModelAndView("customer/question_mom");
	}
	
	@RequestMapping(value = "/customer/question_sitter.do", method = RequestMethod.GET)
	public ModelAndView question_sitter(Model model) {
		// 조건값 Beans에 저장하기
		List<Cus_category> out = null;
		
		try {
			// 데이터 조회 
			out = customerService.getCusSubCateList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<Cus_sub_category> output = null;
		
		try {
			// 데이터 조회 
			output = customerService.getCusBbslist(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("out", out);
		model.addAttribute("output", output);
		
		return new ModelAndView("customer/question_sitter");
	}
	
	@RequestMapping(value = "/customer/cus_view.do", method = RequestMethod.GET)
	public ModelAndView cus_view(Model model,
			@RequestParam(value = "boardnum", defaultValue = "0") int boardnum) {
		// 값의 유효성 검사
		if (boardnum == 0) {
			return webHelper.redirect(null, "게시글 번호가 없습니다.");
		}
		
		// 데이터 조회
		Cus_sub_category input = new Cus_sub_category();
		input.setBoardnum(boardnum);
		
		// 조회 결과를 저장할 객체 
		Cus_sub_category output = null;
		
		try {
			output = customerService.getCusItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View 처리
		model.addAttribute("output", output);
		return new ModelAndView("customer/cus_view");
	}
	
	/**게시글 목록 전체 조회*/
	@RequestMapping(value = "/customer/cus_search.do", method = RequestMethod.GET)
	public ModelAndView cus_view(Model model,
			@RequestParam(value = "keyword", required = false) String keyword) {
		
		Cus_sub_category input = new Cus_sub_category();
		input.setTitle(keyword);
		
		List<Cus_sub_category> output = null;
		
		try {
			// 데이터 조회 
			output = customerService.getCusBbslist(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		return new ModelAndView("customer/cus_search");
	}
}