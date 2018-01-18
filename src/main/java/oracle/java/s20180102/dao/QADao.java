package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;

public interface QADao {
	//List<QADto> QAList(String ID, String gServNo); // 받은 문의. 보낸 문의 조회 
	//List<QADto> QAList(String complete);           // 답변여부 필터링..(?)
	//int inQA(QADto qaDto);                         // 문의 등록
	//int upQA(QADto qaDto);                         // 문의 수정
	//int delQA(int QAnumber);                       // 문의 삭제

	//소희
	int selTotalQA(PagingDto pdto);
	List<QADto> selQAList(PagingDto pdto); //member
	List<QADto> selQAList_rpy(PagingDto pdto); //member_rpy
	List<QADto> selQAList2(PagingDto pdto); //guide
	List<QADto> selQAList2_rpy(PagingDto pdto); //guide_rpy
	void insertQA_guide(QADto qad); //guide-ajax 가이드페이지에서 문의에 대한 답변을 입력한다

	int selTotalQA_manager(PagingDto pdto); //manager QA의 total
	List<QADto> selQAList3(PagingDto pdto); //manager

	/*List<QADto> selQACkList(int qaNumber); //member_ajax_내용과 답변
*/
}