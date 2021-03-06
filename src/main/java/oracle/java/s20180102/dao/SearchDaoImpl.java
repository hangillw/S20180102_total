package oracle.java.s20180102.dao;




import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;


@Repository
public class SearchDaoImpl implements SearchDao{
	@Autowired
	private SqlSession session;

	@Override
	public String oneItemName(String itemCode) {
		return session.selectOne("oneItemName", itemCode);
	}

	@Override
	public int total_filter(SearchDto sDto) {
		return session.selectOne("total_filter", sDto);
	}

	@Override
	public List<TourCardDto> keywordList(SearchDto sDto) {
		return session.selectList("keywordList", sDto);
	}

	@Override
	public int total_keyword(SearchDto sDto) {
		return session.selectOne("total_keyword", sDto);
	}

	@Override
	public List<TourCardDto> filterList(SearchDto sDto) {
		return session.selectList("filterList", sDto);
	}

	@Override
	public void inKeyWord(String keyword) {
		// 태욱 수정-------------------------------
		if(keyword!=null && keyword!="") {
		session.insert("inKeyWord", keyword);
		}
		// 태욱 수정-------------------------------
	}

	@Override
	public List<TourCardDto> selGPage(PagingDto pDto) {
		// TODO Auto-generated method stub
		return session.selectList("selGPage", pDto);
	}
	
}