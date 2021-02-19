package study.team.abuhae.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

//부모 멤버변수까지 동일한지 비교하기 위해 넣어준 어노테이션.
//Data 어노테이션을 쓰고 상속처리 할 경우 해당 속성을 지정해주어야한다. - 0206 Hari

@EqualsAndHashCode(callSuper=true)
@Data

/**
* @author Hari
* 시터 회원가입시 받는 데이터를 정의한 Beans.
* sitterno를 PK값으로 사용, 다른 테이블과 JOIN한다.
*/

public class Sitter_info extends Member {
	private int sitterno;				// 시터회원 일련번호 PRI
	private String sitter_type;			// 시터 타입 (대학생, 부모님 등)
	private String want_act1;			// 원하는 활동
	private String want_act2;			// 원하는 활동
	private String want_act3;			// 원하는 활동
	private String want_age1;	
	private String want_age2;	
	private String want_age3;			// 돌보기 원하는 나이 (신생아, 영아 등)
	private String si;					// 시
	private String gu;					// 구
	private String dong;				// 동
	private int payment;				// 원하는 시급
	private String cctv;				// CCTV 동의 여부
	private char schedule;				// 활동 가능 시간 (1, 2, 3, 4)
	private String schedule_set;		// 원하는 시간 직접 입력 (JSON)
	private String introduce;			// 자기소개
	private int answer;					// 응답률
	private String openingdate; 		// 신청서 등록 시간
	private char payment_ok; 			// 시급협의 여부 ('N', 'Y')

	/** 2) JOIN절에 따른 추가 컬럼 */
	// 찾기 기능의 JOIN - 0206 hari
	private int rev_rate;				// 별점(소숫점 이하 반올림)
	private int rev_count;				// 후기 수
	private int resino;					// 인증
	private String profile_img_file;	// 프로필 이미지 파일(수정 예상)
	
	// 시터 상세페이지에 필요한 JOIN - 0209 지우 
	private int heartno; // 시터를 찜한 횟수 
	private String who; // 시터를 찜한 유형 구별 
	private String applydate; // 지원날짜 
	private String accept; // 지원승인여부
	private int revno; // 리뷰갯수 
	private String favorite_act; // 선호하는 돌봄 유형
	private int cntno; // 매칭 갯수  
	private int view; // 조회수
	
	/** 3) 검색 조건용 추가 컬럼 */
	private static String[] actList;		// 원하는 활동유형 검색 조건
	private static String[] wtage;			// 원하는 시터 나이대 검색 조건
	
	
	public static String[] getActList() {
		return actList;
	}
	public static void setActList(String[] actList) {
		Sitter_info.actList = actList;
	}
	public static String[] getWtage() {
		return wtage;
	}
	public static void setWtage(String[] wtage) {
		Sitter_info.wtage = wtage;
	}
	
	
	

}
