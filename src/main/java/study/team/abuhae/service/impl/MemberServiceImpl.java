package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.MemberService;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	//mybatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlsession;

	/*
	 * 회원 기본 정보 조회 (MemberTable)
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * @return 조회한 내용
	 */
	@Override
	public Mom_info getMemberLogin(Mom_info input) throws Exception {
		Mom_info result = null;
		
		try {
			result = sqlsession.selectOne("MemberMapper.selectIDItem", input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
			
			//반환받은 객체가 null이 아니고, 패스워드가 같다면 로그인 성공으로 침
			if(result != null && result.getPassword().equals(input.getPassword())) {
				return result;
			} else {
				//일치하는 정보가 없다면 null 리턴
				return null;
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
	}

	/*
	 * 회원 기본 정보 리스트 조회 (MemberTable)
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * @return 조회한 내용
	 */
	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;
		
		try {
            result = sqlsession.selectList("MemberMapper.selectList", input);

            if (result == null) {
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
	
	
	/*
	 * 회원 데이터가 저장되어있는 갯수 조회
	 * @apram 검색할 내용
	 * @return int
	 */
	@Override
	public int getMemberCount(Member input) throws Exception {
		int result = 0;
		
		return result;
	}
	
	
	/*
	 * 회원 정보 수정
	 * @param Member 수정할 정보를 담고있는 beans
	 * @return int
	 */
	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;
		return result;
	}

	
	/*
	 * 회원 탈퇴 -> leave 테이블로 이동
	 * @param Member 탈퇴하는 회원의 정보를 담고있는 beans
	 * @return int
	 */
	@Override
	public int leaveMember(Member input) throws Exception {
		int result = 0;
		
		
		return result;
	}

	@Override
	public int addMom(Mom_info input) throws Exception {
		int result1 = 0;
		int result2 = 0;

		try {
			result1 = sqlsession.insert("MemberMapper.insertMember", input);
			result2 = sqlsession.insert("MemberMapper.insertMom", input);
			if (result1 == 0 && result2 == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result1;
	}

	@Override
	public int idCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getIdCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int emailCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getEmailCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int phoneCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getPhoneCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	

}
