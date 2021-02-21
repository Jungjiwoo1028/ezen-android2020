package study.team.abuhae.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Review;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.CustomerService;
import study.team.abuhae.service.SitterMypageService;

@RestController
public class SitterMypageRestController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	AdminService adminService;
	@Autowired
	SitterMypageService sitterMypageService;
	
	@RequestMapping(value = "/mypage/edit_ok_accept", method = RequestMethod.POST)
	public Map<String, Object> edit_ok(
			@RequestParam(value = "momno", defaultValue = "0") int momno,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "cntno", defaultValue = "0") int cntno,
			@RequestParam(value = "accept", defaultValue = "") String accept,
			@RequestParam(value = "deny_type", defaultValue = "") String deny_type) {
		/** 사용자가 입력한 파라미터 유효성 검사 */
		if (momno == 0) { return webHelper.getJsonWarning("나에게 인터뷰를 요청한 부모 회원 번호가 없습니다."); }
		if (sitterno == 0) { return webHelper.getJsonWarning("시터 회원 번호가 없습니다."); }
		if (cntno == 0) { return webHelper.getJsonWarning("Not connect"); }
		
		/** accept 수정(connect table) - insert */
		Connect input1 = new Connect();
		input1.setAccept("Y");
		input1.setMomno(momno);
		
		try {
			// 데이터 수정
			sitterMypageService.editAccept(input1);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 리뷰 입력 (review table) - update */
		Review input2 = new Review();
		input2.setMomno(momno);
		input2.setSitterno(sitterno);
		input2.setCntno(cntno);
		
		try {
			// 데이터 입력
			sitterMypageService.addReview(input2);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "/mypage/edit_ok_deny", method = RequestMethod.POST)
	public Map<String, Object> edit_no(
			@RequestParam(value = "momno", defaultValue = "0") int momno,
			@RequestParam(value = "accept", defaultValue = "") String accept,
			@RequestParam(value = "deny_type", defaultValue = "") String deny_type) {
		/** 사용자가 입력한 파라미터 유효성 검사 */
		if (momno == 0) { return webHelper.getJsonWarning("나에게 인터뷰를 요청한 부모 회원 번호가 없습니다."); }
		
		/** accept 수정(connect table) - insert */
		Connect input1 = new Connect();
		input1.setAccept("N");
		input1.setDeny_type(deny_type);
		input1.setMomno(momno);
		
		try {
			// 데이터 수정
			sitterMypageService.editAccept(input1);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
}