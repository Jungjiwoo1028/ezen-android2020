package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Member;
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
	public Member getMemberItem(Member input) throws Exception {
		Member result = null;
		
		
		return result;
	}

	/*
	 * 회원 기본 정보 리스트 조회 (MemberTable)
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * @return 조회한 내용
	 */
	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;
		
		
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

	

}
