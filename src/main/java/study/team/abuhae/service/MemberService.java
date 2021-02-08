package study.team.abuhae.service;

import java.util.List;

import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;

public interface MemberService {
	//회원 단일 조회
	public Member getMemberLogin(Mom_info input) throws Exception;
	
	//회원 리스트 조회
	public List<Member> getMemberList(Member input) throws Exception;
	
	//회원 수 조회
	public int getMemberCount(Member input) throws Exception;
	
	//회원 데이터 수정
	public int editMember(Member input) throws Exception;
	
	//회원 탈퇴
	public int leaveMember(Member input) throws Exception;
	
	/**
	 * 맘 데이터 등록하기 
	 * @param Mom_info 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addMom(Mom_info input) throws Exception;
	
	/*
	 * id 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int idCheck(Member input) throws Exception;
	
	/*
	 * email 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int emailCheck(Member input) throws Exception;
	
	/*
	 * phone 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int phoneCheck(Member input) throws Exception;
}
