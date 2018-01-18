package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.QADao;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;

@Service
public class QAServiceImpl implements QAService {
	
	//소희
	@Autowired
	private QADao qaDao;
	
	@Override
	public int selTotalQA(PagingDto pdto) {
		return qaDao.selTotalQA(pdto);
	}
	
	//회원
	@Override
	public List<QADto> selQAList(PagingDto pdto){
		return qaDao.selQAList(pdto);
	}
	@Override
	public List<QADto> selQAList_rpy(PagingDto pdto){
		return qaDao.selQAList_rpy(pdto);
	}
	
	//가이드
	@Override
	public List<QADto> selQAList2(PagingDto pdto){
		return qaDao.selQAList2(pdto);
	}
	@Override
	public List<QADto> selQAList2_rpy(PagingDto pdto){
		return qaDao.selQAList2_rpy(pdto);
	}
	@Override
	public void insertQA_guide(QADto qad) {
		qaDao.insertQA_guide(qad);
	}
	
	//매니저
	@Override
	public int selTotalQA_manager(PagingDto pdto) {
		return qaDao.selTotalQA_manager(pdto);
	}
	@Override
	public List<QADto> selQAList3(PagingDto pdto){
		return qaDao.selQAList3(pdto);
	}	
	
	/*@Override
	public List<QADto> selQACkList(int qaNumber){
		return qaDao.selQACkList(qaNumber); 
	}*/

	
}
