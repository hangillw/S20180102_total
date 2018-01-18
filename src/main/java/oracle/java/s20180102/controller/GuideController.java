package oracle.java.s20180102.controller;


import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	@Autowired
	private GServService gss;
	@Autowired
	private QAService qs;
	@Autowired
	private ReservService ress;
	@Autowired
	private GuideService gs;
	@Autowired
	private MemberService mbs;

/*-----------------------------------------------------------------------------------------
	태욱
------------------------------------------------------------------------------------------*/
	@RequestMapping(value="service_guide")
	public String service_guide(HttpSession session, GServDto gsDto, String currentPage, Model model) {
		int total = 0;
		String gno = (String)session.getAttribute("gno");
		if(gno!=null) {
			total = gss.total(Integer.parseInt(gno)); 
		}else {
			total = gss.total();
		}
		System.out.println("total=>" + total);
		System.out.println("currentPage=>" + currentPage);
		Paging pg = new Paging(total, currentPage);
		gsDto.setStart(pg.getStart());
		gsDto.setEnd(pg.getEnd());
		gsDto.setGno(Integer.parseInt(gno));
		List<GServDto> list = gss.selGServ(gsDto);
		model.addAttribute("list", list);
		model.addAttribute("pg",pg);
		
		return "service_guide";
	}
	
	@RequestMapping(value="selGServForm")
	public String selGservForm(String gservNo, Model model) {
		System.out.println("gservNo = " + gservNo);
		GServDto gsDto = gss.oneGServ(Integer.parseInt(gservNo));
		//System.out.println("gsDto = " + gsDto);
		List<ContentsDto> cDtoList = gss.selCont(Integer.parseInt(gservNo));
		//System.out.println("cDtoList = " + cDtoList);
		System.out.println("수정 페이지로 넘어갈때 gno = "+gsDto.getGno());
		model.addAttribute("gsDto", gsDto);
		model.addAttribute("cDtoList", cDtoList);
		return "selGServForm";
	}
	
	@RequestMapping(value="inGServForm")
	public String inGservForm(HttpSession session, Model model) {
		String gno = (String)session.getAttribute("gno");
		System.out.println("gno = " + gno);
		GServDto gsDto = new GServDto();
		int gservNo = gss.selGServNo(Integer.parseInt(gno));
		gsDto.setGno(Integer.parseInt(gno));
		gsDto.setGservNo(gservNo);
		System.out.println("등록 페이지로 넘어갈때 gno = "+ gsDto.getGno());
		model.addAttribute("gsDto", gsDto);
		return "inGServForm";
	}
	
	@RequestMapping(value="tourDiary")
	public String tourDiary(HttpSession session, Model model) {
		String gno = (String)session.getAttribute("gno");
		List<GServDto> gsDtolist = gss.selGServRes(Integer.parseInt(gno));
		
		for(int i= 0; i < gsDtolist.size(); i++) {
			String[] pt = gsDtolist.get(i).getPickUpTime().split(":");
			int lt = Integer.parseInt(gsDtolist.get(i).getGservLeadTime());
			int sum = Integer.parseInt(pt[0])+lt;
			String endTime = Integer.toString(sum);
			endTime = endTime + ":00";
			gsDtolist.get(i).setEndTime(endTime);
		}
		
		
		model.addAttribute("gsList", gsDtolist);
		return "tourDiary";
	}
	@RequestMapping(value="confirmResForm")
	public String confirmResForm(String gservNo, String tourDate, Model model) {
		model.addAttribute("gservNo", gservNo);
		model.addAttribute("tourDate", tourDate);
		return "confirmResForm";
	}
	@RequestMapping(value="confirmResPro")
	public String confirmResPro(ReservDto resDto , Model model) {
		int result = ress.updateConfirm(resDto);
		model.addAttribute("result", result);
		
		return "confirmResPro";
	}
	
	@RequestMapping(value="pay_guide")
	public String pay_guide(HttpSession session, GServDto gsDto, Model model) {
		String gno = (String)session.getAttribute("gno");
		System.out.println("pay_guide gno => " + gno);
		gsDto.setGno(Integer.parseInt(gno));
		List<GServDto> list = gss.selPayGuide(gsDto);
		model.addAttribute("payGlist", list);
		//model.addAttribute("gno", gsDto.getGno());
		System.out.println("실패인거 같은데???");
		return "pay_guide";
	}
	
	@RequestMapping(value="pay_guideForm")
	public String pay_guideForm(HttpSession session, Model model) {
		String gno = (String)session.getAttribute("gno");
		GuideDto gDto = gs.selOneGuide(Integer.parseInt(gno));
		
		model.addAttribute("gDto", gDto);
		
		return "pay_guideForm";
	}
	
	@RequestMapping(value="pay_guidePro")
	public String pay_guidePro(HttpSession session, GuideDto gDto, String cost, Model model) {
		String gno = (String)session.getAttribute("gno");
		gDto.setGno(Integer.parseInt(gno));
		gDto.setTotalCost(gDto.getTotalCost()-Integer.parseInt(cost));
		gs.upCostGuide(gDto);
		GServDto gsDto = new GServDto();
		gsDto.setGno(gDto.getGno());
		List<GServDto> list = gss.selPayGuide(gsDto);
		model.addAttribute("payGlist", list);
		model.addAttribute("gno", gDto.getGno());
		return "pay_guide";
	}
	

/*-----------------------------------------------------------------------------------------
	소희
------------------------------------------------------------------------------------------*/

	
	@RequestMapping(value = "selGuideQAPro")
	public String selGuideQAPro(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		String qAreply = request.getParameter("qAreply"); 
		String gservTitle = request.getParameter("gservTitle");
		
		if(qAreply==null) {
			System.out.println("qAreply == null");
		}else if(qAreply.equals("y")||qAreply.equals("n")) {
			System.out.println("이건 그냥 넘겨줘야함");
		}else { //전체보기 위하여
			qAreply=null;
		}
		
		if(gservTitle==null) {
			System.out.println("gservTitle == null");
		}else if(gservTitle.length()>1){ //전체보기 위하여
			System.out.println("제목을 가져가는 경우");
		}else {
			gservTitle=null;
		}
		
		PagingDto pdto = new PagingDto();
		//String ID = "abcd@naver.com";
		//작성자가 아닌.. 쓴 사람(누구에서 작성했나)으로 들어가야함!!
		pdto.setQaReceiver(ID);
		pdto.setReply_yn(qAreply);
		pdto.setGservTitle(gservTitle);
		
		//필터로 받아온 내용 제대로 들어갔는지 확인해보자
		System.out.println("pdto.getReply_yn() = "+pdto.getReply_yn());
		System.out.println("pdto.getgservTitle() = "+pdto.getGservTitle());
		System.out.println("pdto.getqAReceiver() = "+pdto.getQaReceiver());
		
		//selQAPro에서 썼던 method와 동일
		int total = qs.selTotalQA(pdto);
		
		System.out.println("total = "+total);
		//해당 ID를 가진 Guide가 제공하는 gservice의 목록(select 박스에서 이용) -->gservTitle만 저장하도록 코딩(0109 / 11:55)
		List<GServDto> gservList = gss.selGServList(ID);	//문의사항
		
		Paging pg = new Paging(total, currentPage);
		System.out.println("pg.getStart() : " + pg.getStart());
		System.out.println("pg.getEnd() : " + pg.getEnd());
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// String reply_yn, String gservTitle도 PagingDto가 받아줘야함
		// 일단은 null로 받았을 경우로 만들어놓자
		List<QADto> qAGuideList = qs.selQAList2(pdto); //selQAPro와 동일하게 하려했으나 그냥 새로 만들기로 함
		List<QADto> qAGuideList_rpy = qs.selQAList2_rpy(pdto); //selQAPro와 동일하게 하려했으나 그냥 새로 만들기로 함
		
		for (int i = 0; i < qAGuideList.size(); i++) {
			System.out.println("qAList["+i+"] = " + qAGuideList.get(i));
			System.out.println("qAList["+i+"].getqareceiver = " + qAGuideList.get(i).getQaReceiver());
		}
		
		model.addAttribute("qAreply", qAreply);
		model.addAttribute("gservTitle", gservTitle);
		
		model.addAttribute("pg", pg);
		model.addAttribute("ID", ID);
		model.addAttribute("gservList", gservList);
		model.addAttribute("qAGuideList", qAGuideList);
		model.addAttribute("qAGuideList_rpy", qAGuideList_rpy);
		
		//답변여부, 상품명
		return "selGuideQAForm";
	}
	

/*-----------------------------------------------------------------------------------------
	지영
------------------------------------------------------------------------------------------*/	
	
	
	@RequestMapping(value="profile_guide")
	public String profile_guide(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		GuideDto gDto = gs.g_info(ID);
		MemberDto mbDto = mbs.selMember(ID);
		
		model.addAttribute("gDto", gDto);
		model.addAttribute("mbDto", mbDto);
		return "profile_guide";
	}
	@RequestMapping(value="upGuideForm")
	public String upGuideForm(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		GuideDto gDto = gs.g_info(ID);
		model.addAttribute("gDto", gDto);
		return "upGuideForm";
	}
	

}