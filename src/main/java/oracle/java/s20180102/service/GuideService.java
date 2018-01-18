package oracle.java.s20180102.service;


import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.PagingDto;


@Service
public interface GuideService {

	int totalGuide();                          // 총 가이드 수
	List<GuideDto> g_list(PagingDto pDto);     // 가이드리스트(전체)
	GuideDto g_info(String memberId);          // 가이드 디테일 정보
	void upGuide(GuideDto gDto);               // 가이드 정보 수정
	GuideDto selOneGuide(int gNo);             //gNo로 가이드 정보 출력
	int upCostGuide(GuideDto gDto);            // 정산후 남은 정산 금액 조정 
	// int inGuide(GuideDto guideDto);         // 가이드 등록
	// int upGuidePay(int price);              // 미정산금액(update)
	// List<GuideDto> selGuideList();          // 가이드리스트(전체)
	// int refund(String ID, int price);       // 환불 시 미정산금액 - 환불액(update)
	// int withdraw(String ID, int price);     // 인출 시 미정산금액 - 인출액(update)

	
}