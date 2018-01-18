package oracle.java.s20180102.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;  // 

import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.ReservDao;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReservDto;


@Service
public class ReservServiceImpl implements ReservService{
	@Autowired
	private ReservDao resDao;

	@Override
	public int totalResv(String ID) {
		
		return resDao.totalResv(ID);
	}

	@Override
	public List<ReservDto> selReservList(PagingDto pdto) {
		
		return resDao.selReservList(pdto);
	}

	@Override
	public ReservDto oneResv(String payCode) {
		return resDao.oneResv(payCode);
	}

	@Override
	public int total_Complete(String ID) {
		return resDao.total_Complete(ID);
	}

	@Override
	public List<ReservDto> completeList(PagingDto pdto) {
		return resDao.completeList(pdto);
	}

	@Override
	public void resvCancel(String payCode) {
		resDao.resvCancel(payCode);
	}

	@Override
	public void inResv(ReservDto resvDto) {
		resDao.inResv(resvDto);
	}

	@Override
	public void upResv(ReservDto resvDto) {
		resDao.upResv(resvDto);
	}

	@Override
	public void upPay(ReservDto resvDto) {
		resDao.upPay(resvDto);
	}

	@Override
	public int updateConfirm(ReservDto resDto) {
		return resDao.updateConfirm(resDto);
	}


	
}