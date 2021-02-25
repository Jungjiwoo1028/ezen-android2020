package study.team.abuhae.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import clojure.pprint.print_table__init;
import lombok.Data;
import lombok.EqualsAndHashCode;

// 부모 멤버변수까지 동일한지 비교하기 위해 넣어준 어노테이션.
// Data 어노테이션을 쓰고 상속처리 할 경우 해당 속성을 지정해주어야한다. - 0206 Hari

@EqualsAndHashCode(callSuper=true)
@Data

/**
 * @author Hari
 * 맘 회원가입시 받는 데이터를 정의한 Beans.
 * momno를 PK값으로 사용, 다른 테이블과 JOIN한다.
 */

public class Mom_info extends Member {
	/** 1) 기본 컬럼 */
	private int momno;				// 맘회원 일련번호 PRI
	private String want_act1;		// 원하는 활동
	private String want_act2;		// 원하는 활동
	private String want_act3;		// 원하는 활동
	private String want_age;		// 원하는 시터 나이대
	private int kids_num;			// 아이 수
	private String kids_age;		// 아이 나이
	private int payment;			// 시터에게 지불하기 원하는 시급
	private String si;				// 시
	private String gu;				// 구
	private String dong;			// 동

	private char   schedule_ok;		// 일정 조정 가능 여부 ('Y' or 'N')
	private String description;		// 시터가 알아야할 사항
	private char   sitter_gender;	// 원하는 시터 성별 ('M' or 'F')
	private String interview_type;	// 원하는 인터뷰 방식
	private String care_type;		// 원하는 돌봄 타입
	private String openingdate;		// 신청서 등록 시간
	private String apply_title;		// 신청서 제목
	private String apply_content;	// 신청서 내용
	private String kids_age2;		// 아이가 2명일시 넣는 생년월일
	private char payment_ok; 		// 시급협의 여부 ('N', 'Y')
	private String schedule;		// 가능한 시간대 입력(JSON) 
	private String frequency;		// 스케줄 주기
	private String days;			// 가능한 요일
	private int memberno;           // 맘회원의 회원 일련번호
	
	/** 2) JOIN절에 따른 추가 컬럼 */
	// 찾기 기능의 JOIN - 0210 hari
	private int applySt;			// 맘이 게시한 일자리에 지원한 시터 수
	private int heartno;
	private int cntno;
	
	private String who;
	private int sitterno;
	
	// 인터뷰 구독권 여부에 필요한 JOIN - 2021 지우 
	private char subscribe;
	
	//조인절에 따른 추가 컬럼
	private String schedule_start;

	
	/** 3) 검색 조건용 추가 컬럼 */
	private static String[] act;		// 원하는 활동유형 검색 조건
	private static String[] kidsAge;		// 아이 나이
	private static String[] caredays;		// 돌봄 요일
	private static String[] timeRange;		// 돌봄 시간대
	private static String min_pay;			// 최저 시급
	private static String max_pay;			// 최고 시급
	private static String kids_cnt;			// 아이 수
	private static String loc1;				// 시
	private static String loc2;				// 구
	private static String loc3;				// 동
	
	// 시터 로그인 여부 확인 (for 찜)
	private static int loginSt;
	
	// 맘 스케쥴 시작시간 - 2023 지우 
	private String schedule_start_date;
	
	
	public static String[] getAct() {
		return act;
	}
	public static void setAct(String[] act) {
		Mom_info.act = act;
	}
	public static String[] getKidsAge() {
		return kidsAge;
	}
	public static void setKidsAge(String[] kidsAge) {
		Mom_info.kidsAge = kidsAge;
	}
	public static String[] getCaredays() {
		return caredays;
	}
	public static void setCaredays(String[] caredays) {
		Mom_info.caredays = caredays;
	}
	public static String[] getTimeRange() {
		return timeRange;
	}
	public static void setTimeRange(String[] timeRange) {
		Mom_info.timeRange = timeRange;
	}
	public static String getMin_pay() {
		return min_pay;
	}
	public static void setMin_pay(String min_pay) {
		Mom_info.min_pay = min_pay;
	}
	public static String getMax_pay() {
		return max_pay;
	}
	public static void setMax_pay(String max_pay) {
		Mom_info.max_pay = max_pay;
	}
	public static String getKids_cnt() {
		return kids_cnt;
	}
	public static void setKids_cnt(String kids_cnt) {
		Mom_info.kids_cnt = kids_cnt;
	}
	public static int getLoginSt() {
		return loginSt;
	}
	public static void setLoginSt(int loginSt) {
		Mom_info.loginSt = loginSt;
	}
	public static String getLoc1() {
		return loc1;
	}
	public static void setLoc1(String loc1) {
		Mom_info.loc1 = loc1;
	}
	public static String getLoc2() {
		return loc2;
	}
	public static void setLoc2(String loc2) {
		Mom_info.loc2 = loc2;
	}
	public static String getLoc3() {
		return loc3;
	}
	public static void setLoc3(String loc3) {
		Mom_info.loc3 = loc3;
	}


	
	
	

	
}
