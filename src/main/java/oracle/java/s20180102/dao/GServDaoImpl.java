package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;

@Repository
public class GServDaoImpl implements GServDao{
	@Autowired
	private SqlSession session;

//------- 태욱 ----------------------------------------------------------------------------------------------
	
	@Override
	public int total() { return session.selectOne("totalGserv");	}
	
	@Override
	public int total(int gno) {	
		int gnolength = Integer.toString(gno).length();
		int result = 0;
		if(gnolength>6) {
			result = 1;
		}else {
			result =  session.selectOne("totalGnoServ", gno);
		}
			
		return result;	
	}

	@Override
	public List<ContentsDto> selCont(int gservNo) {
		// TODO Auto-generated method stub
		return session.selectList("listContents", gservNo);
	}
	
	@Override
	public List<CodeSetDto> selCodeSet(String itemCode) {
		// TODO Auto-generated method stub
		//int code = Integer.parseInt(itemCode);
		System.out.println("gservDaoImpl->selCodeSet : "+itemCode);
		return session.selectList("listCodeSet", itemCode);
	}

	@Override
	public int upLock(GServDto lock) {
		return session.update("uplock", lock);
	}
	@Override
	public List<GServDto> selPayGuide(GServDto gsDto) {
		// TODO Auto-generated method stub
		System.out.println("selPayGuide >> gno = "+ gsDto.getGno());
		return session.selectList("gservPayList", gsDto);
	}
	
	
//------- 지영 ------------------------------------------------------------------------------------------	
	
	@Override
	public TourCardDto oneTourCard(ReservDto resvDto) {
		return session.selectOne("oneTourCard", resvDto);
	}
	
	
	
//------- 소희 ------------------------------------------------------------------------------------------	


	@Override
	public List<GServDto> selGServ(GServDto gsDto) {
		return session.selectList("listAll", gsDto);
	}

	@Override
	public GServDto oneGServ(int gservNo) {
		return session.selectOne("oneGserv", gservNo);
	}

	@Override
	public int upGServ(GServContentsVo gsctVO) {
		int gservNo = gsctVO.getgServNo();
		//List<ContentsDto> cntList = session.selectList("listContents", gservNo); 
		session.delete("deleteContents", gservNo);
		for(int i = 0; i < gsctVO.getgServOrder().length; i++) {
			if(gsctVO.getgServIntro()[i]==null && gsctVO.getgServIntro()[i].length()>1) {
				continue;
			}
			ContentsDto ctDto = new ContentsDto();
			ctDto.setGservNo(gsctVO.getgServNo());
			/*if(gsctVO.getgservOrder().length>cntList.size()) {
			ctDto.setgservIntro(gsctVO.getgservIntro()[i] == null ? gsctVO.getgservIntro()[i] : cntList.get(i).getgservIntro());
			ctDto.setgservOrder(gsctVO.getgservOrder()[i] == null ? gsctVO.getgservOrder()[i] : cntList.get(i).getgservOrder());
			ctDto.setImgSrc(gsctVO.getImgSrc()[i] == null ? gsctVO.getImgSrc()[i] : cntList.get(i).getImgSrc());
			}*/
			ctDto.setGservIntro(gsctVO.getgServIntro()[i]);
			ctDto.setGservOrder(gsctVO.getgServOrder()[i]);
			ctDto.setImgSrc(gsctVO.getImgSrc()[i]);
			System.out.println(gsctVO.getImgSrc()[i]);
			/*session.update("updateContents", ctDto);*/
			session.insert("insertContents", ctDto);
			System.out.println(i+"번 통과");
		}
		
		/*System.out.println("gsctVO.getgservTitle() = "+gsctVO.getgservTitle());
		System.out.println("gsctVO.getgno()"+gsctVO.getgno());
		System.out.println("gsctVO.getgservGps() = "+gsctVO.getgservGps());
		System.out.println("gsctVO.getgservLeadTime() = "+gsctVO.getgservLeadTime());
		System.out.println("gsctVO.getgservSub() = "+gsctVO.getgservSub());
		if(gsctVO.getgservArea()==null) {
			System.out.println("gsctVO.getgservArea() === null");
		}else {
			System.out.println("gsctVO.getgservArea() === notNull");
		}
		System.out.println("gsctVO.getgservArea() = "+gsctVO.getgservArea());
		System.out.println("gsctVO.getgservPrice() = "+gsctVO.getgservPrice());
		System.out.println("gsctVO.getgservLang() = "+gsctVO.getgservLang());
		System.out.println("gsctVO.getServTag() = "+gsctVO.getServTag());
		System.out.println("gsctVO.getgservDay() = "+gsctVO.getgservDay());
		System.out.println("gsctVO.getgservEDate() = "+gsctVO.getgservEDate());
		System.out.println("gsctVO.getgservSDate() = "+gsctVO.getgservSDate());
		System.out.println("gsctVO.getPickUpLoc() = "+gsctVO.getPickUpLoc());
		System.out.println("gsctVO.getPickUpTime() = "+gsctVO.getPickUpTime());
		System.out.println("gsctVO.getpInclude() = "+gsctVO.getpInclude());
		System.out.println("gsctVO.getNotPInclude() = "+gsctVO.getNotPInclude());
		System.out.println("gsctVO.getCaution() = "+gsctVO.getCaution());
		System.out.println("gsctVO.getgservLock() = "+gsctVO.getgservLock());*/
		return session.update("updateGserv", gsctVO);
	}

	@Override
	public int inGServ(GServContentsVo gsctVO) {
		int result = 0;
		result = session.update("inGserv", gsctVO);
		for(int i = 0; i < gsctVO.getgServOrder().length; i++) {
			if(gsctVO.getgServIntro()[i]==null && gsctVO.getgServIntro()[i].length()>1) {
				continue;
			}
			ContentsDto ctDto = new ContentsDto();
			System.out.println("gsctVO.getgservNo() = "+gsctVO.getgServNo());
			System.out.println("gsctVO.getgservIntro()["+i+"] = "+gsctVO.getgServIntro()[i]);
			System.out.println("gsctVO.getgservOrder()["+i+"] = "+gsctVO.getgServOrder()[i]);
			System.out.println("gsctVO.getImgSrc()["+i+"] = "+gsctVO.getImgSrc()[i]);
			ctDto.setGservNo(gsctVO.getgServNo());
			ctDto.setGservIntro(gsctVO.getgServIntro()[i]);
			ctDto.setGservOrder(gsctVO.getgServOrder()[i]);
			ctDto.setImgSrc(gsctVO.getImgSrc()[i]);
			System.out.println(gsctVO.getImgSrc()[i]);
			/*session.update("updateContents", ctDto);*/
			session.insert("insertContents", ctDto);
			System.out.println(i+"번 통과");
		}
		
		/*System.out.println("gsctVO.getgservTitle() = "+gsctVO.getgservTitle());
		System.out.println("gsctVO.getgno()"+gsctVO.getgno());
		System.out.println("gsctVO.getgservGps() = "+gsctVO.getgservGps());
		System.out.println("gsctVO.getgservLeadTime() = "+gsctVO.getgservLeadTime());
		System.out.println("gsctVO.getgservSub() = "+gsctVO.getgservSub());
		if(gsctVO.getgservArea()==null) {
			System.out.println("gsctVO.getgservArea() === null");
		}else {
			System.out.println("gsctVO.getgservArea() === notNull");
		}
		System.out.println("gsctVO.getgservArea() = "+gsctVO.getgservArea());
		System.out.println("gsctVO.getgservPrice() = "+gsctVO.getgservPrice());
		System.out.println("gsctVO.getgservLang() = "+gsctVO.getgservLang());
		System.out.println("gsctVO.getServTag() = "+gsctVO.getServTag());
		System.out.println("gsctVO.getgservDay() = "+gsctVO.getgservDay());
		System.out.println("gsctVO.getgservEDate() = "+gsctVO.getgservEDate());
		System.out.println("gsctVO.getgservSDate() = "+gsctVO.getgservSDate());
		System.out.println("gsctVO.getPickUpLoc() = "+gsctVO.getPickUpLoc());
		System.out.println("gsctVO.getPickUpTime() = "+gsctVO.getPickUpTime());
		System.out.println("gsctVO.getpInclude() = "+gsctVO.getpInclude());
		System.out.println("gsctVO.getNotPInclude() = "+gsctVO.getNotPInclude());
		System.out.println("gsctVO.getCaution() = "+gsctVO.getCaution());
		System.out.println("gsctVO.getgservLock() = "+gsctVO.getgservLock());*/
		return result;
	}

	@Override
	public int selGServNo(int gno) {
		System.out.println("gno = " + gno );
		int result = session.selectOne("selGservNo", gno);
		System.out.println("result(NewgservNo) = "+result);
		return result;
	}

	@Override
	public List<GServDto> selGServRes(int gno) {
		return session.selectList("gservResList", gno);
	}

	@Override
	public List<GServDto> selGServList(String id) {
		return session.selectList("selGservList",id);
	}

}