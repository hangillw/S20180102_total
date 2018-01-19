package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;

public interface GServDao {
	List<GServDto> selGServ(GServDto gsDto);                  // 전체 상품 조회
	//List<GServDto> selGServ(String Id, int GservNo);        // 선택 조회
	//List<GServDto> selGServ(String keyword);                // 검색(JOIN하기 때문에 return타입 변경 필요)
	//int delGServ(String[] GservNo);                         // 상품 일괄 삭제
	int total();											  // 전체 상품 수
	int total(int gNo);										  // 가이드별 상품 수
	GServDto oneGServ(int gServNo);							  // 1개의 상품에 대한 상세정보
	List<ContentsDto> selCont(int gServNo);                   // 1개의 상품에 대한 행선지 정보
	List<CodeSetDto> selCodeSet(String itemCode);			  // 상분류지역에 따른 하부 지역 검색, 리턴
	int upGServ(GServContentsVo gsctVO);					  // 상품 수정
	int inGServ(GServContentsVo gsctVO);					  // 상품 등록
	int selGServNo(int gNo);								  // 상품 등록페이지 진입을 위한 새로운 gServNo 번호 검색, 리턴
	int upLock(GServDto lock);								  // 상품 노출여부 수정
	List<GServDto> selGServRes(int gNo);    
	List<GServDto> selPayGuide(GServDto gsDto);
	int totalnLock(int gno);								  // 가이드별 상품 중 노출상품
	
	//------- 지영 -------------------------------------------------------------------------------
	TourCardDto oneTourCard(ReservDto resvDto);               // 하나의 투어카드 선택
	

	//------- 소희 -------------------------------------------------------------------------------
	List<GServDto> selGServList(String id);

}