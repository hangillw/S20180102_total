package oracle.java.s20180102.controller;


import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.WishDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.WishService;

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
public class MainController {
	@Autowired
	private GServService gss;
	@Autowired
	private WishService ws;
	@Autowired
	private MemberService mbs;
	@Autowired
	private GuideService gs;
	@Autowired
	private NoticeService ns;
	
	
	/*    메인 페이지  	*/
	@RequestMapping(value="main")
	public String main(HttpSession session, Model model) {
		String ID =  (String)session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String page = "main";
		
		if(ID == null || ID.equals("")){
			model.addAttribute("loginChk", 0); // ID 가 NULL 이면 로그아웃 상태
		} else {
			authorityChk(ID, page, model);  // ID가 널이 아니면 로그인 상태 -> 권한 체크 (회원/가이드/관리자)
		}

		return "main";
	}
	
	/*    상세 상품 페이지  	*/
		@RequestMapping(value="tour_detail")
		public String tour_detail(int gservNo, HttpSession session, Model model) {
			String ID =  (String) session.getAttribute("ID");
			//String ID =  "abcd@naver.com";
			String page = "tour_detail";
			
			if(ID == null || ID.equals("")){
				model.addAttribute("loginChk", 0); // ID 가 NULL 이면 로그아웃 상태
			} else {
				authorityChk(ID, page, model);  // ID가 널이 아니면 로그인 상태 -> 권한 체크 (회원/가이드/관리자)
			}
			
			GServDto gsDto = gss.oneGServ(gservNo);
			List<ContentsDto> cDtoList = gss.selCont(gservNo);
			
			WishDto wdto = new WishDto();
			wdto.setGservNo(gservNo);
			wdto.setMemberId(ID);
			int wishCheck = ws.wishCheck(wdto);
			
			model.addAttribute("wishCheck", wishCheck);
			model.addAttribute("gsDto", gsDto);
			model.addAttribute("cDtoList", cDtoList);
			return "tour_detail";
		}
		
	
		
	/*    전체 공지사항  	*/
		
		@RequestMapping(value="notice") //전체 공지사항
		public String notice(HttpServletRequest request, Model model) {
			String ID = (String) request.getSession().getAttribute("ID");
			String page = "notice";
			if(ID == null || ID.equals("")){
				model.addAttribute("loginChk", 0); // ID 가 NULL 이면 로그아웃 상태
			} else {
				authorityChk(ID, page, model);  // ID가 널이 아니면 로그인 상태 -> 권한 체크 (회원/가이드/관리자)
			}
	
			String currentPage = request.getParameter("currentPage");
		    PagingDto pdto = new PagingDto();
			//공지 게시글의 총 개수
			int total = ns.total_CompleteForNotice(); 
			System.out.println("total count of Notice = "+total);
			
			Paging pg = new Paging(total, currentPage, 15); //10개씩 보여주는거 너무 적지?
			System.out.println("pg.getStart() = "+pg.getStart()+"  pg.getEnd() = "+pg.getEnd());
			pdto.setStart(pg.getStart());
			pdto.setEnd(pg.getEnd());
			//공지 게시글 리스트
			List<NoticeDto> noticeList = ns.selNoticeList(pdto);
			
			model.addAttribute("pg", pg);
			model.addAttribute("ID", ID);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("noticeList", noticeList);
			
			return "noticeForm_All";
		}		

		private String authorityChk(String ID, String page, Model model) {
			
				//아이디로 DTO 가져오기
				MemberDto mbDto = mbs.selMember(ID);
				GuideDto gDto = gs.g_info(ID);
				
				//가이드 등록이 되어있을 시 
				if(gDto.getMemberId()!=null || !gDto.getMemberId().equals("")) {
					model.addAttribute("guideChk",1);
					model.addAttribute("gDto", gDto);
				}
				//관리자 일 때
				if(mbDto.getAuthority().equals("3")) {
					model.addAttribute("manageChk",1);
				}
				
				model.addAttribute("mbDto", mbDto);
				model.addAttribute("loginChk", 1); // 로그인 상태
	
			return "forward:"+ page + ".do";
		}		

}