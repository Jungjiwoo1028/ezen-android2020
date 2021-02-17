package study.team.abuhae.model;

import lombok.Data;

/** connect 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Connect {
	
	private int cntno; // 구인 성사 일련번호
	private String applydate; // 지원날짜
	private String who; // 지원한 사람 타입 구분
	private int momno; // 맘 일련번호
	private int sitterno; // 시터 일련번호 
	private String accept; // 지원 승인여부
	private String deny_type; // 거절 타입
	private String deny_text; // 거절 사유
	
}
