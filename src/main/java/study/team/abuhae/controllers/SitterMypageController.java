package study.team.abuhae.controllers;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.MomMypageService;
import study.team.abuhae.service.SitterMypageService;
import study.team.abuhae.service.UploadService;
import study.team.abuhae.service.impl.MomMypageServiceImpl;
import study.team.abuhae.service.impl.SitterMypageServiceImpl;

@Controller
public class SitterMypageController {
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	SitterMypageService sitterMypageService;
	
	@Autowired
	MomMypageService momMypageService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	UploadService uploadService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** mypage controller */
	@RequestMapping(value = "/mypage/mypage_sitter/sitter_mypage.do", method = RequestMethod.GET)
	public ModelAndView sitter_mypage(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
		/** ????????? ?????? */
		Sitter_info input = new Sitter_info();
		ProfileFile input2 = new ProfileFile();
		ResiCert input3 = new ResiCert();
		
		input.setSitterno(sitterno);
		input2.setSitterno(sitterno);
		input3.setSitterno(sitterno);
		
		/** ?????? ?????? */
		Sitter_info output = null;
		ProfileFile output2 = null;
		ResiCert output3 = null;
		int heartcount = 0;
		int workcount = 0;
		int reportcount = 0;
		
		try {
			output = sitterMypageService.getSitterItem(input);
			output2 = uploadService.getProfileItem(input2);
			output3 = uploadService.getCertifyItem(input3);
			heartcount = sitterMypageService.getSitterHeartCount(input);
			workcount = sitterMypageService.getSitterWorkCount(input);
			reportcount = sitterMypageService.getSitterReportCount(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		model.addAttribute("profile", output2);
		model.addAttribute("certify", output3);
		model.addAttribute("heartcount", heartcount);
		model.addAttribute("workcount", workcount);
		model.addAttribute("reportcount", reportcount);
		
		return new ModelAndView("mypage/mypage_sitter/sitter_mypage");
	}
	
	
	
	/** ???????????? ?????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/updp/{memberno}", method = RequestMethod.GET)
	public ModelAndView update_password_sitter(Model model, HttpSession session,
			@PathVariable int memberno) {

		   /** 1) ???????????? ????????? ?????? */
	      if (memberno == 0) {
	         return webHelper.redirect(null, "??????????????? ????????????.");
	      }
	      
	      /** 2) ????????? ???????????? */
	      Sitter_info input = new Sitter_info();
	      input.setMemberno(memberno);
	      
	      // ?????? ?????? ??????
	      Sitter_info output = null;
	      
	      try {
	         output = sitterMypageService.getSitterMember(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
		
		return new ModelAndView("mypage/mypage_sitter/update_password");
	}
	
	/** ???????????? ?????? ????????? */
	   @RequestMapping(value = "/mypage/mypage_sitter/update_passwordOk.do", method = RequestMethod.POST)
	   public ModelAndView update_passwordOK(Model model, HttpSession session,
	         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
	         @RequestParam(value = "now_pw") String oldpassword,
	         @RequestParam(value = "new_pw") String newpassword) {

	      /** 1) ???????????? ????????? ?????? */
	      if (memberno == 0) {
	         return webHelper.redirect(null, "??????????????? ???????????? ????????????.");
	      }
	      if(oldpassword=="" || oldpassword==null) {
	         return webHelper.redirect(null, "?????? ??????????????? ???????????????.");
	      }
	      if(newpassword=="" || newpassword==null) {
	         return webHelper.redirect(null, "????????? ??????????????? ???????????????.");
	      }
	      
	      /** 2) ????????? ???????????? */
	      Sitter_info input = new Sitter_info();
	      input.setMemberno(memberno);
	      input.setPassword(oldpassword);
	      
	      // ?????? ?????? ??????
	      int bigyo =0;
	      //????????? ???????????? ????????? ?????? 
	      Sitter_info newpw = new Sitter_info();
	      newpw.setPassword(newpassword);
	      newpw.setMemberno(memberno);
	      
	      Sitter_info output = new Sitter_info();
	      
	      try {
	         //?????? ???????????? ??????
	         bigyo = sitterMypageService.bigyoSitterPassword(input);
	         
	         if(bigyo==0) {
	            return webHelper.redirect(null, "checking your current password!");
	         }
	         //?????? ??????????????? ???????????? ????????? ??????????????? ????????????
	         sitterMypageService.updatSitterePassword(newpw);
	         output = sitterMypageService.getSitterMember(input);
	         
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      /** 3) View ?????? */
	      String url = contextPath+"/mypage/mypage_sitter/sitter_mypage.do?&sitterno="+output.getSitterno();
	      return webHelper.redirect(url, "??????????????? ?????????????????????.");
	   }
	
	/** ??? ?????? ?????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/getm/{sitterno}", method = RequestMethod.GET)
	public ModelAndView get_mom(Model model,
			@PathVariable int sitterno) {
		/** ????????? ?????? */
		Sitter_info in = new Sitter_info();
		in.setSitterno(sitterno);
		
		Sitter_info out = null;
		
		try {
			out = sitterMypageService.getSitterItem(in);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("out", out);
		

		
		/** ????????? ?????? */
		Connect input = new Connect();
		input.setSitterno(sitterno);
		
		List<Connect> output = null;
		
		try {
			output = sitterMypageService.getConnectList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
		List<Connect> output2 = null;
		
		try {
			output2 = sitterMypageService.getSitterApplyList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output2", output2);
		
		return new ModelAndView("mypage/mypage_sitter/get_mom_mps");
	}
	
	/** ??? ???????????? - ?????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/reason_deny.do", method = RequestMethod.GET)
	public String reason_deny(Locale locale, Model model) {

		return "mypage/mypage_sitter/reason_deny";
	}
	
	/** ?????? ????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/likem/{sitterno}", method = RequestMethod.GET)
	public ModelAndView like_mom(Model model,
			@PathVariable int sitterno) {
		/** ????????? ?????? */
		Sitter_info in = new Sitter_info();
		in.setSitterno(sitterno);
		
		int heartcount = 0;
		
		try {
			heartcount = sitterMypageService.getSitterHeartCount(in);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** ????????? ?????? */
		Heart input = new Heart();
		input.setSitterno(sitterno);
		
		List<Heart> output = null;
		
		try {
			output = sitterMypageService.getSitterHeartList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("heartcount", heartcount);
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_sitter/like_mom_mps");
	}
	
	/** ??? ????????? ?????? ????????? */
	/**@RequestMapping(value = "/mypage/mypage_sitter/update_sitter_profile.do", method = RequestMethod.GET)
	public ModelAndView update_profile(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {

		return new ModelAndView("mypage/mypage_sitter/update_sitter_profile");
	} */
	
	/** ??? ????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/fund.do", method = RequestMethod.GET)
	public String fund_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/fund";
	}
	
	/** ???????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/rv/{sitterno}", method = RequestMethod.GET)
	public ModelAndView review_sitter(Model model,
			@PathVariable int sitterno) {
		/** ????????? ?????? */
		Sitter_info in = new Sitter_info();
		in.setSitterno(sitterno);
		
		Sitter_info out = null;
		
		try {
			out = sitterMypageService.getSitterItem(in);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** ????????? ?????? */
		Review input = new Review();
		input.setSitterno(sitterno);
		
		List<Review> output = null;
		
		try {
			output = sitterMypageService.getSitterReviewList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("out", out);
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_sitter/review");
	}
	
	/** ??? ?????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/ct/{sitterno}", method = RequestMethod.GET)
	public ModelAndView certify(Model model,
			@PathVariable int sitterno) {
		ResiCert input = new ResiCert();
		input.setSitterno(sitterno);
		
		ResiCert output = null;
		
		try {
			output = uploadService.getCertifyItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("certify", output);
		return new ModelAndView("mypage/mypage_sitter/certify");
	}
	
	/** ??? ????????? ?????? ?????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/coutm/{sitterno}", method = RequestMethod.GET)
	public ModelAndView count_sitter(Model model,
			@PathVariable int sitterno) {
		/** ????????? ?????? */
		Sitter_info in = new Sitter_info();
		in.setSitterno(sitterno);
		
		int workcount = 0;
		
		try {
			workcount = sitterMypageService.getSitterWorkCount(in);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** ????????? ?????? */
		Connect input = new Connect();
		input.setSitterno(sitterno);
		
		List<Connect> output = null;
		
		try {
			output = sitterMypageService.getSitterWorkList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("workcount", workcount);
		model.addAttribute("output", output);
		
		return new ModelAndView("mypage/mypage_sitter/count_mom_mps");
	}
	
	/** ???????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/rp/{sitterno}", method = RequestMethod.GET)
	public ModelAndView sue_sitter(Model model,
			@PathVariable int sitterno) {

		/** ????????? ?????? */
		Sitter_info in = new Sitter_info();
		in.setSitterno(sitterno);
		
		Sitter_info out = null;
		
		try {
			out = sitterMypageService.getSitterItem(in);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** ????????? ?????? */
		Report input = new Report();
		input.setSitterno(sitterno);
		
		List<Report> output = null;
		
		try {
			output = sitterMypageService.getSitterReprotList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("out", out);
		model.addAttribute("output", output);
		
		return new ModelAndView("mypage/mypage_sitter/sue");
	}
	
	/** ???????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/ma/{memberno}", method = RequestMethod.GET)
	public ModelAndView manage_account_sitter(Model model,
			@PathVariable int memberno) {

		if(memberno ==0 ) {
	         webHelper.getJsonWarning("You cannot check your phone number without member number");
	      }
	      
	      //????????? ??????
	      Sitter_info input = new Sitter_info();
	      input.setMemberno(memberno);
	      
	      //????????? ?????? 
	      Sitter_info output = null;
	      
	      try {
	         output = sitterMypageService.getSitterMember(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      //????????? ??????
	      model.addAttribute("output", output);
	      
		return new ModelAndView("/mypage/mypage_sitter/manage_account");
	}
	
	   
   @RequestMapping(value = "/mypage/updateSitterPhone.do", method = RequestMethod.POST)
   public ModelAndView updatePhone(Model model,
         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
         @RequestParam(value = "phone", defaultValue = "") String phone) {
      if(memberno ==0 ) {
         webHelper.redirect(null, "You cannot access without your member number");
      }
      if(phone =="" || phone==null ) {
         webHelper.redirect(null, "Please write your new phone number");
      }
      
      //????????? ??????
      Sitter_info input = new Sitter_info();
      input.setMemberno(memberno);
      input.setPhone(phone);
      
      Sitter_info output = null;
      
      try {
         sitterMypageService.editSitterPhone(input);
         output = sitterMypageService.getSitterMember(input);
         
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }
      
      String url = contextPath+"/mypage/mypage_sitter/ma/"+output.getMemberno();
      
      return webHelper.redirect(url, null);
   }
   
   
   @RequestMapping(value = "/mypage/updateSitterEmail.do", method = RequestMethod.POST)
   public ModelAndView updateMemberPhone(Model model,
         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
         @RequestParam(value = "email", defaultValue = "") String email) {
      if(memberno ==0 ) {
         webHelper.redirect(null, "You cannot access without your member number");
      }
      if(email =="" || email==null ) {
         webHelper.redirect(null, "Please write your new email");
      }
      
      //????????? ??????
      Sitter_info input = new Sitter_info();
      input.setMemberno(memberno);
      input.setEmail(email);
      
      Sitter_info output = null;
      
      try {
         sitterMypageService.editSitterEmail(input);
         output = sitterMypageService.getSitterMember(input);
         
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }
      
      String url = contextPath+"/mypage/mypage_sitter/ma/"+output.getMemberno();
      
      return webHelper.redirect(url, null);
   }
	
	/** ???????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/leave_abu.do", method = RequestMethod.GET)
	public String leave_abu_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/leave_abu";
	}
	
	/** ???????????? ?????? ok */
	@RequestMapping(value = "/mypage/mypage_sitter/leaveok.do", method = RequestMethod.POST)
	public ModelAndView leave_sitterOK(Model model,
			@RequestParam(value = "memberno", defaultValue = "0") int memberno,
			@RequestParam(value = "leave_reason") String reason) {
		
		//????????? ????????? ??????
		Leave_member input = new Leave_member();
		Sitter_info input2 = new Sitter_info();
		input2.setMemberno(memberno);
		
		//?????? ?????? ??????
		Sitter_info output = null;
		int output2=0;
		
		try {
			//memberno??? ?????? ?????? ?????? ??????
			output = sitterMypageService.getSitterAccountItem(input2);
			
			//????????? ?????? ????????? leavemember??? ????????? ??????
			output2 = adminService.getLeaveSitterCount(output);
			
			//????????? ????????? null????????? ?????? X
			if(output2 == 0) {
				input.setType(output.getType());
				input.setId(output.getId());
				input.setName(output.getName());
				input.setEmail(output.getEmail());
				input.setPhone(output.getPhone());
				input.setReason(reason);
				momMypageService.addAbuOut(input);
			} else {
				return webHelper.redirect(null, "?????? ??????????????? ???????????????.");
			}
			
			
			
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String url = contextPath+"/logout";
		return webHelper.redirect(url, "?????? ????????? ?????????????????????.");
	}
	
	/** ???????????? ????????? */
	@RequestMapping(value = "/mypage/mypage_sitter/agree_service.do", method = RequestMethod.GET)
	public String agree_sitter(Locale locale, Model model) {

		return "mypage/mypage_sitter/agree_service";
	}
}
