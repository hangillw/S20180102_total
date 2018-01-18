package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;

@Repository
public class QADaoImpl implements QADao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int selTotalQA(PagingDto pdto) {
		return session.selectOne("selTotalQA",pdto);
	}
	//회원
	@Override
	public List<QADto> selQAList(PagingDto pdto){
		return session.selectList("selQAList",pdto);
	}
	@Override
	public List<QADto> selQAList_rpy(PagingDto pdto){
		return session.selectList("selQAList_rpy",pdto);
	}
	
	//가이드
	@Override
	public List<QADto> selQAList2(PagingDto pdto){
		return session.selectList("selQAList2",pdto);
	}
	@Override
	public List<QADto> selQAList2_rpy(PagingDto pdto){
		return session.selectList("selQAList2_rpy",pdto);
	}
	@Override
	public void insertQA_guide(QADto qad) {
		session.insert("insertQA_guide", qad);
	}
	
	//매니저
	@Override
	public int selTotalQA_manager(PagingDto pdto) {
		return session.selectOne("selTotalQA_manager", pdto);
	}
	@Override
	public List<QADto> selQAList3(PagingDto pdto){
		return session.selectList("selQAList3",pdto);
	}	
	
	
	
	
	/*@Override
	public List<QADto> selQACkList(int qaNumber){
		return session.selectList("selQACkList",qaNumber);
	}*/
	
	
}
