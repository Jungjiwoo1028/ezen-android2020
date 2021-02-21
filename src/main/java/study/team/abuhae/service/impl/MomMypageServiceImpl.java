package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.MailHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.service.MomMypageService;

@Slf4j
@Service
public class MomMypageServiceImpl implements MomMypageService{
	// mybatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlSession;
	//mailhelper 주입
	@Autowired
	MailHelper mailhelper;
	// Service 객체 주입
	MomMypageService momMypageService;
	
	@Override
	public Mom_info getMemberItem(Mom_info input) throws Exception {
		 Mom_info result = null;
	      
	      try {
	         result = sqlSession.selectOne("MomMypageMapper.selectMomItem", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 데이터가 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      
	      return result;

	}

	/** 리뷰 수정 기능 (view에서는 리뷰 insert 기능처럼 보여짐) */
	@Override
	public int editReview(Review input) throws Exception {
		int result = 0;
	      
	      try {
	         result = sqlSession.update("ReviewMapper.editReview", input);
	         
	         if (result == 0) {
	            throw new NullPointerException("result = 0");
	         } 
	      }  catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("수정된 데이터가 없습니다.");
	      } catch (Exception e) {
	         throw new Exception("데이터 수정에 실패했습니다.");
	      }
	      return result;
	}

	/** 후기 작성할 수 있는 회원 목록 조회 (조건: 매칭성공) */
	@Override
	public List<Review> getReviewMemberList(Review input) throws Exception {
		List<Review> result = null;
	      
	      try {
	         result = sqlSession.selectList("ReviewMapper.selectMReviewMemberList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	/** 작성한 후기 목록 조회 기능 */
	@Override
	public List<Review> getReviewList(Review input) throws Exception {
		List<Review> result = null;
	      
	      try {
	         result = sqlSession.selectList("ReviewMapper.selectReviewList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	/** 찜한 회원 목록 조회 */
	@Override
	public List<Heart> getHeartList(Heart input) throws Exception {
		List<Heart> result = null;
	      
	      try {
	         result = sqlSession.selectList("MomMypageMapper.selectHeartList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	/** 채용 내역 조회 */
	@Override
	public List<Connect> getWorkList(Connect input) throws Exception {
		List<Connect> result = null;
	      
	      try {
	         result = sqlSession.selectList("MomMypageMapper.selectWorkList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	/** 신고 내역 조회 */
	@Override
	public List<Report> getReprotList(Report input) throws Exception {
		List<Report> result = null;
	      
	      try {
	         result = sqlSession.selectList("MomMypageMapper.selectReportList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	/** 구매 내역 조회 */
	@Override
	public Mom_info getBuyList(Mom_info input) throws Exception {
		Mom_info result = null;
	      
	      try {
	         result = sqlSession.selectOne("MomMypageMapper.selectBuyList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

	@Override
	public List<Coupon> getCouponList(Coupon input) throws Exception {
		List<Coupon> result = null;
	      
	      try {
	         result = sqlSession.selectList("MomMypageMapper.selectCouponList", input);
	         
	         if (result==null) {
	            throw new NullPointerException("result=null");
	         }  
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("조회된 회원이 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }
	      return result;
	}

}
