package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReservDto;

public interface ReservDao {

	List<ReservDto> selReservList(PagingDto pdto);    // 회원별 예약 리스트 조회
	ReservDto oneResv(String payCode);                // 하나의 예약 조회
	int totalResv(String ID);                         // 회원별 예약 총 개수 구하기(결제 안된)
	int total_Complete(String iD);                    // 투어 완료된 총 개수 구하기
	List<ReservDto> completeList(PagingDto pdto);     // 투어 완료된 리스트 구하기
	void resvCancel(String payCode);                  // 예약 취소
	void inResv(ReservDto resvDto);                   // 예약 등록
	void upResv(ReservDto resvDto);                   // 예약 수정
	void upPay(ReservDto resvDto);                    // 결제 시, 환불 시 pay_yn update
	int updateConfirm(ReservDto resDto);
	
}