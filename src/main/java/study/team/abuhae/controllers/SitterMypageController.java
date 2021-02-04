package study.team.abuhae.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SitterMypageController {
	/** mypage controller */
	@RequestMapping(value = "/mypage/mypage_sitter/sitter_mypage.do", method = RequestMethod.GET)
	public String sitter_mypage(Locale locale, Model model) {

		return "mypage/mypage_sitter/sitter_mypage";
	}
	
	/** 비밀번호 변경 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/update_password.do", method = RequestMethod.GET)
	public String update_password_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/update_password";
	}
	
	/** 내 구직 현황 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/get_mom_mps.do", method = RequestMethod.GET)
	public String get_mom(Locale locale, Model model) {

		return "mypage/mypage_sitter/get_mom_mps";
	}
	
	/** 내 구직현황 - 거절 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/reason_deny.do", method = RequestMethod.GET)
	public String reason_deny(Locale locale, Model model) {

		return "mypage/mypage_sitter/reason_deny";
	}
	
	/** 찜한 일자리 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/like_mom_mps.do", method = RequestMethod.GET)
	public String like_mom(Locale locale, Model model) {

		return "mypage/mypage_sitter/like_mom_mps";
	}
	
	/** 내 프로필 보기 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/profile_mps.do", method = RequestMethod.GET)
	public String profile_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/profile_mps";
	}
	
	/** 내 프로필 수정 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/update_profile.do", method = RequestMethod.GET)
	public String update_profile(Locale locale, Model model) {

		return "mypage/mypage_sitter/update_profile";
	}
	
	/** 내 적립금 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/fund.do", method = RequestMethod.GET)
	public String fund_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/fund";
	}
	
	/** 내 쿠폰함 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/coupon.do", method = RequestMethod.GET)
	public String coupon_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/coupon";
	}
	/** 내 쿠폰함 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/review.do", method = RequestMethod.GET)
	public String review_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/review";
	}
	
	/** 내 인증 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/certify.do", method = RequestMethod.GET)
	public String certify(Locale locale, Model model) {

		return "mypage/mypage_sitter/certify";
	}
	
	/** 내 인증 - 등초본 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/certify_resident.do", method = RequestMethod.GET)
	public String certify_resident(Locale locale, Model model) {

		return "mypage/mypage_sitter/certify_resident";
	}
	
	/** 내 맘시터 채용 내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/count_mom_mps.do", method = RequestMethod.GET)
	public String count_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/count_mom_mps";
	}
	
	/** 신고내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/sue.do", method = RequestMethod.GET)
	public String sue_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/sue";
	}
	
	/** 결제내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/payment_list.do", method = RequestMethod.GET)
	public String payment_list_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/payment_list";
	}
	
	/** 계정관리 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/manage_account.do", method = RequestMethod.GET)
	public String manage_account_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/manage_account";
	}
	
	/** 회원탈퇴 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/leave_abu.do", method = RequestMethod.GET)
	public String leave_abu_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/leave_abu";
	}
	
	/** 이용동의 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/agree_service.do", method = RequestMethod.GET)
	public String agree_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/agree_service";
	}
}