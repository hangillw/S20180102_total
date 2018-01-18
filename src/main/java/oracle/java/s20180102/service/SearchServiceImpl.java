package oracle.java.s20180102.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.SearchDao;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;


@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao sDao;


	@Override
	public String oneItemName(String itemCode) {
		return sDao.oneItemName(itemCode);
	}

	@Override
	public int total_filter(SearchDto sDto) {
		return sDao.total_filter(sDto);
	}

	@Override
	public List<TourCardDto> keywordList(SearchDto sDto) {
		return sDao.keywordList(sDto);
	}

	@Override
	public int total_keyword(SearchDto sDto) {
		return sDao.total_keyword(sDto);
	}

	@Override
	public List<TourCardDto> filterList(SearchDto sDto) {
		return sDao.filterList(sDto);
	}

	@Override
	public void inKeyWord(String keyword) {
		sDao.inKeyWord(keyword);
	}


	

	
}