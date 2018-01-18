package oracle.java.s20180102.dao;


import java.util.List;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;

public interface MemberDao {
	
	/* 지영 */
	void upPoint(MemberDto mbDto);              // 포인트 up!
	void upMember(MemberDto mbDto);             // 프로필 수정
	MemberDto selMember(String id);              // 한 회원 선택
	void delMember(String ID);                   // 회원 삭제

	//int inMember(MemberDto memberDto);        // 회원가입
	//List<MemberDto> selMemberList();          // 회원조회
	//int delMember(String id);                 // 회원삭제
 
	/* 경희씨 */
	int totalMember();
	List<MemberDto> selMemberList(PagingDto pDto);
	int changePw(MemberDto memberDto);          //비번변경
	int changePwConfirm(MemberDto memberDto);   //비번변경확인
	int inMember(MemberDto memberDto);          // 회원가입
	
}