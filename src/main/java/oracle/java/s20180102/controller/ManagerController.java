package oracle.java.s20180102.controller;

import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.PayService;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.service.WishService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {

	@Autowired
	private ReviewService revs;
	@Autowired
	private NoticeService ns;
	@Autowired
	private MemberService mbs;
	@Autowired
	private GuideService gs;
	@Autowired
	private GServService gss;
	@Autowired
	private QAService qs;

/*--------------------------------------------------------------------------------------------------------------
	[ 경희 ]
--------------------------------------------------------------------------------------------------------------*/	
	
	//회원 리스트 페이지
	@RequestMapping(value="mb_List")
	public String list(HttpServletRequest reqeust,Model model) {
		String currentPage = reqeust.getParameter("currentPage");
		int total=mbs.totalMember();	
		Paging pg = new Paging(total, currentPage);
			PagingDto pDto=new PagingDto();
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			
		List<MemberDto> list= mbs.selMemberList(pDto);
		
		model.addAttribute("list", list);
		model.addAttribute("pg",pg);
		return "mb_List";
	}

	//회원 리스트 회원디테일정보
	@RequestMapping(value="mb_info")
	public String mb_info(String memberId,Model model) {
		
		MemberDto mbDto = mbs.selMember(memberId);	
		model.addAttribute("memberDto",mbDto);
		
		return "mb_info";
	}
	
	//가이드 리스트 
	@RequestMapping(value="gd_manager")
	public String g_list(HttpServletRequest request,Model model) {
		String currentPage = request.getParameter("currentPage");
		int total=gs.totalGuide();
			
			Paging pg=new Paging(total,currentPage);
				PagingDto pDto= new PagingDto();
					pDto.setStart(pg.getStart());
					pDto.setEnd(pg.getEnd());
					
				List<GuideDto> g_list=gs.g_list(pDto);
				
				model.addAttribute("g_list",g_list);
				model.addAttribute("pg",pg);
			return "g_list";
	}
	
	//가이드 리스트 디테일정보
	@RequestMapping(value="g_info")
	public String g_info(String memberId,Model model) {
		
		GuideDto g_dto=gs.g_info(memberId);			
		model.addAttribute("g_dto",g_dto);			
		
		return "g_info";		
	}
	
	
	
	
/*	가이드 회원 삭제 >> db수정후 생성예정
 * 
 * @RequestMapping(value="g_delete")
	public String delete(String memberId,Model model) {
		gs.g_delete(memberId);
		return "redirect:g_list.do";
	}
*/		
/*--------------------------------------------------------------------------------------------------------------
	[ 우경 ]
--------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "review_manager")
	public String review_manage(HttpServletRequest request, Model model) {
		System.out.println("review_manage Start");
		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage" + currentPage);
		String ID = "abcd@naver.com";
		ReviewDto reviewDto = new ReviewDto();
		PagingDto pdto = new PagingDto();
		int total = revs.total_Complete(reviewDto);
		List<ReviewDto> complete = revs.selReviewList(reviewDto);
		System.out.println("total ::" + total);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "review_manager";
	}

	@RequestMapping(value = "writeReviewPro")
	public String writeReviewPro(HttpServletRequest request, Model model) {
		ReviewDto revDto = new ReviewDto();
		revDto.setMemberId(request.getParameter("memberId"));
		revDto.setRtitle(request.getParameter("rtitle"));
		revDto.setRcontent(request.getParameter("rcontent"));
		revDto.setGservNo(Integer.parseInt(request.getParameter("gservNo")));
		revs.inReview(revDto);

		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage" + currentPage);
		String ID = "abcd@naver.com";
		ReviewDto reviewDto = new ReviewDto();
		PagingDto pdto = new PagingDto();
		int total = revs.total_Complete(reviewDto);
		List<ReviewDto> complete = revs.selReviewList(reviewDto);
		System.out.println("total ::" + total);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);

		return "review_manage";
	}

	@RequestMapping(value = "noticeList")
	public String noticeList(HttpServletRequest request, Model model) {
		System.out.println("noticeList Start");
		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage->" + currentPage);
		String ID = "abcd@naver.com";
		NoticeDto noticeDto = new NoticeDto();
		PagingDto pdto = new PagingDto();
		int total = ns.total_CompleteForNotice();
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<NoticeDto> complete = ns.selNoticeList(pdto);
		System.out.println("total ::" + total);
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "noticeList";
	}

	// @RequestMapping(value = "writeNoticePro")
	// public String writeNoticePro(HttpServletRequest request, Model model) {
	// NoticeDto nsDto = new NoticeDto();
	// nsDto.setNoticeNo(Integer.parseInt(request.getParameter("noticeno")));
	// nsDto.setnTitle(request.getParameter("ntitle"));
	// // nsDto.setnReadCount(Integer.parseInt(request.getParameter("nreadcount")));
	// nsDto.setnContent(request.getParameter("ncontent"));
	//
	// ns.inNotice(nsDto);
	//
	// // String ID = (String) request.getSession().getAttribute("ID"); String
	// currentPage = request.getParameter("currentPage");
	// System.out.println("currentPage" + currentPage);
	// String ID = "abcd@naver.com";
	// NoticeDto noticeDto = new NoticeDto();
	// PagingDto pdto = new PagingDto();
	// int total = ns.total_CompleteForNotice();
	// List<NoticeDto> complete = ns.selNoticeList(noticeDto);
	// System.out.println("total ::" + total);
	// Paging pg = new Paging(total, currentPage);
	// pdto.setMemberId(ID);
	// pdto.setStart(pg.getStart());
	// pdto.setEnd(pg.getEnd()); // List<ReservDto>
	// complete = rsvs.completeList(pdto);
	// System.out.println("pdto" + pdto);
	// model.addAttribute("list", complete);
	// model.addAttribute("pg", pg);
	// model.addAttribute("total", total);
	//
	// return "review_manage";
	// }

	@RequestMapping(value = "writeNoticeForm")
	public String writeNoticeForm(HttpServletRequest request, Model model) {
		System.out.println("review_manage Start");
		// String ID = (String) request.getSession().getAttribute("ID");
		String ID = "abcd@naver.com";

		model.addAttribute("noticeno", 1); /////// 임시
		return "writeNoticeForm";
	}

	@RequestMapping(value = "writeNoticePro")
	public String writeNoticePro(HttpServletRequest request, Model model) {
		System.out.println("writeNoticePro Start");
		NoticeDto nsDto = new NoticeDto();
		// nsDto.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
		nsDto.setNtitle(request.getParameter("ntitle"));
		nsDto.setNcontent(request.getParameter("ncontent"));
		ns.inNotice(nsDto);

		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage" + currentPage);
		String ID = "abcd@naver.com";
		// List<ReservDto> complete = rsvs.completeList(pdto);

		PagingDto pdto = new PagingDto();
		int total = ns.total_CompleteForNotice();
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<NoticeDto> complete = ns.selNoticeList(pdto);
		System.out.println("total ::" + total);
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);

		return "noticeList";
	}

	@RequestMapping(value = "selNoticeDetail")
	public String selNoticeDetail(HttpServletRequest request, Model model) {
		String nNo = request.getParameter("noticeNo");
		if (nNo == null || nNo.trim().equals("")) {
			nNo = "1";
			System.out.println("에러");
		}
		int noticeNo = Integer.parseInt(nNo);
		System.out.println("selNoticeDetail Start");
		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage->" + currentPage);
		String ID = "abcd@naver.com";
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setNoticeNo(noticeNo);
		System.out.println("noticeNo : " + noticeNo);///
		PagingDto pdto = new PagingDto();
		int total = ns.total_CompleteForNotice();
		// List<NoticeDto> complete = ns.selNoticeListDetail(noticeDto);
		NoticeDto complete = ns.selNoticeDetail(noticeNo);
		System.out.println("total ::" + total);
		// System.out.println("complete" + complete.size());
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
		// System.out.println("complete : " + complete.size());
		// System.out.println(complete.get(0).getNoticeNo());
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "selNoticeDetail";
	}
	
	@RequestMapping(value = "delNoticeDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String delNoticeDetail(HttpServletRequest request, Model model) {
		System.out.println("delNoticeDetail Start");
		// String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage->" + currentPage);
		String ID = "abcd@naver.com";
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		NoticeDto noticeDto = new NoticeDto();
		ns.delNotice(noticeNo);
		
		/*PagingDto pdto = new PagingDto();
		int total = ns.total_CompleteForNotice();
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		System.out.println("total ::" + total);
		// List<ReservDto> complete = rsvs.completeList(pdto);
		System.out.println("pdto" + pdto);
//		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);*/
		return "redirect:noticeList.do";
	}


/*--------------------------------------------------------------------------------------------------------------
	[ 태욱 ]
--------------------------------------------------------------------------------------------------------------*/	
			@RequestMapping(value="service_manager")
		public String service_manager(String searchServ, GServDto gsDto, String currentPage, Model model) {
			int total = 0;
				gsDto.setGno(0);
				gsDto.setGservNo(0);
				System.out.println("searchServ = "+searchServ);
			if (searchServ != null && !searchServ.equals("")) {
				if (searchServ.length() == 5) {
					total = gss.total(Integer.parseInt(searchServ));
					gsDto.setGno(Integer.parseInt(searchServ));
					System.out.println("gsDto.getgno in Controller = "+gsDto.getGno());
				} else if(searchServ.length() > 5){
					gsDto.setGservNo(Integer.parseInt(searchServ));
					total = gss.total(Integer.parseInt(searchServ));
					System.out.println("gsDto.getgserv in Controller = "+gsDto.getGservNo());
				}
			}else {
				total = gss.total();
			}
//			System.out.println("total=>" + total);
//			System.out.println("currentPage=>" + currentPage);
			Paging pg = new Paging(total, currentPage);
//			System.out.println("pg.getStart() = " + pg.getStart());
//			System.out.println("pg.getEnd() = " + pg.getEnd());
			gsDto.setStart(pg.getStart());
			gsDto.setEnd(pg.getEnd());
			/*if(searchServ!=null) {
			gsDto.setgno(Integer.parseInt(searchServ));
			}*/
			List<GServDto> list = gss.selGServ(gsDto);
			model.addAttribute("list", list);
			System.out.println("list.length = " + list.size());
			model.addAttribute("pg",pg);
			model.addAttribute("searchServ", searchServ);
			
			return "service_manager";
		}

/*--------------------------------------------------------------------------------------------------------------
	[ 소희 ]
--------------------------------------------------------------------------------------------------------------*/	
			
			@RequestMapping(value="QA_manager") //관리자 QnA
			public String QA_manager(HttpServletRequest request, Model model) {
				// 관리자입니다
				// String ID = (String) request.getSession().getAttribute("ID");
				String ID = "kingAdmin@admin.com";
				System.out.println("QA_manager.do 입장~~");
				String currentPage = request.getParameter("currentPage");
				//필터링 --> 답변여부
				String qAreply = request.getParameter("qAreply");
				System.out.println("qAreply = "+qAreply);
				if(qAreply==null) {
					System.out.println("qAreply == null");
				}else if(qAreply.equals("y")||qAreply.equals("n")) {
					System.out.println("이건 그냥 넘겨줘야함");
				}else { //전체보기 위하여
					qAreply=null;
				}
				PagingDto pdto = new PagingDto();
				pdto.setMemberId(ID);
				pdto.setReply_yn(qAreply);
				int total = qs.selTotalQA_manager(pdto); //총 개수
				Paging pg = new Paging(total, currentPage, 20);
				pdto.setStart(pg.getStart());
				pdto.setEnd(pg.getEnd());
				//QA List
				List<QADto> qAList = qs.selQAList3(pdto);
				
				model.addAttribute("pg", pg);
				model.addAttribute("ID", ID); //접속한 사람의 ID
				model.addAttribute("qAList", qAList);
				model.addAttribute("qAreply", qAreply);
				
				return "selQA_managerForm"; //보여주는 페이지
			}
							
			
}