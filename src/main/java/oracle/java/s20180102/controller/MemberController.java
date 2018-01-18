package oracle.java.s20180102.controller;

import oracle.java.s20180102.model.LikeItDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.LikeItService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.PayService;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.service.SearchService;
import oracle.java.s20180102.service.WishService;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	
	
	
/*-----------------------------------------------------------------------------------------
	[지영]
------------------------------------------------------------------------------------------*/


	@Autowired
	private WishService ws;
	@Autowired
	private LikeItService lis;
	@Autowired
	private ReservService ress;
	@Autowired
	private MemberService mbs;
	@Autowired
	private PayService ps;
	@Autowired
	private ReviewService revs;
	@Autowired
	private GServService gss;	
	@Autowired
	private QAService qs;

	
	
	
/*    상세 상품 페이지  - 위시리스트 등록 여부 체크 	*/	
	@RequestMapping(value = "inWishList", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String inWishList(int gservNo, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		WishDto wsDto = new WishDto();
		wsDto.setMemberId(ID);
		wsDto.setGservNo(gservNo);
		ws.inWishList(wsDto);
		
		return "위시리스트에 등록된 상품입니다.";
	}

	
/* (회원) 프로필 관리 : 회원 탈퇴 */
	
	@RequestMapping(value="delMemberForm")
	public String delMemberForm(HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID = "abcd@naver.com";
		MemberDto mbDto =  mbs.selMember(ID);
		model.addAttribute("mbDto", mbDto);
		
		return "delMemberForm";
		
	}
	
	@RequestMapping(value="delMemberPro")
	public String delMemberPro(HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID = "www@naver.com";
		mbs.delMember(ID);
		return "main";
	}
	
	
/* (회원) 위시리스트 페이지 	*/	
	
	@RequestMapping(value="wishList")
	public String wishList(String currentPage, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		
		PagingDto pdto = new PagingDto();
		int total = ws.totalWish(ID);
		Paging pg = new Paging(total, currentPage, 8);
		
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<TourCardDto> wishList = ws.selWishList(pdto);
		model.addAttribute("id", ID);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pg",pg);

		
		return "wishList";
	}

	
	
/*    (회원)위시리스트 페이지 - 위시리스트 삭제	*/	
	
	@RequestMapping(value="delWishList")
	public String delWishList(int gservNo, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		WishDto wdto = new WishDto();
		wdto.setMemberId(ID);
		wdto.setGservNo(gservNo);
		ws.delWishList(wdto);
		
		return "forward:wishList.do";
	}
	
	
	
/*   좋아요 등록 	*/	
	@RequestMapping(value="inLikeItPro")
	public String writeLikeItPro(SearchDto sDto, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		LikeItDto liDto = new LikeItDto();
		liDto.setMemberId(ID);
		liDto.setGservNo(sDto.getgServNo());
		lis.inLikeIt(liDto);

		switch (sDto.getCall()) {
			case 1:
				return "forward:wishList.do";
			case 2:
				return "forward:search_Keyword.do";
			default:
				return "forward:wishList.do";
		}
		
	}

	
	
/*   좋아요 삭제 	*/	
	@RequestMapping(value="delLikeItPro")
	public String delLikeItPro(SearchDto sDto, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		LikeItDto liDto = new LikeItDto();
		
		if(ID!=null) {			
			liDto.setMemberId(ID);
		}
		
		liDto.setGservNo(sDto.getgServNo());
		lis.delLikeIt(liDto);

		switch (sDto.getCall()) {
		case 1:
			return "forward:wishList.do";
		case 2:
			return "forward:search_Keyword.do";
		default:
			return "forward:wishList.do";
		}
	}
	

/*   (회원) 예약 현황 	*/	
	@RequestMapping(value="reservation_member")
	public String reservation_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ress.totalResv(ID);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<ReservDto> reservList = ress.selReservList(pdto);

		model.addAttribute("list",reservList);
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);

		return "reservation_member";
	}
	
	
/*   (회원) 예약 현황  - 예약 취소	*/	
	@RequestMapping(value="delResvPro")
	public String resvCancle(HttpServletRequest request, Model model) {
		String payCode = request.getParameter("payCode");		
		ress.resvCancel(payCode);

		// currentPage 보내줘야함.
		return "redirect:reservation_member.do";
		
	}
	

/*   상세 상품 페이지  - 예약 등록	*/	
	@RequestMapping(value="inResvPro")
	public String insertResvPro(ReservDto resvDto, HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		int p1 = (int)(Math.random()*100000);
		int p2 = (int)(Math.random()*100000);
		String payCode = "P_" + p1 + "_" + p2;
		resvDto.setMemberId(ID);
		resvDto.setPayCode(payCode);
		ress.inResv(resvDto);
		resvDto = ress.oneResv(payCode);
		TourCardDto tcDto = gss.oneTourCard(resvDto);
		model.addAttribute("resvDto", resvDto);
		model.addAttribute("tcDto", tcDto);
		return "insertResvPro";
	}
	
/*   (회원) 예약 현황  - 예약 수정 	*/	
	@RequestMapping(value="upResvForm")
	public String upResvForm(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String payCode = request.getParameter("payCode");
		ReservDto resvDto = ress.oneResv(payCode);
		TourCardDto tcDto = gss.oneTourCard(resvDto);
		model.addAttribute("resvDto", resvDto);
		model.addAttribute("tcDto", tcDto);
		return "upResvForm";
	}
	
	@RequestMapping(value="upResvPro")
	public String upResvPro(ReservDto resvDto, Model model) {
		int reMemSize = resvDto.getReMemSize();
		Date tourDate = resvDto.getTourDate();
		resvDto = ress.oneResv(resvDto.getPayCode());
		resvDto.setReMemSize(reMemSize);
		resvDto.setTourDate(tourDate);
		ress.upResv(resvDto);
		
		// currentPage 보내줘야함.
		return "redirect:reservation_member.do";
	}

	
	
/*   (회원) 예약 현황 - 결제하기 	*/	
	@RequestMapping(value="inPayForm")
	public String payPage(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String payCode = request.getParameter("payCode");
		ReservDto rsvDto = ress.oneResv(payCode);
		TourCardDto tcDto = gss.oneTourCard(rsvDto);
		MemberDto mbDto = mbs.selMember(ID);
		model.addAttribute("resvDto", rsvDto);
		model.addAttribute("mbDto", mbDto);
		model.addAttribute("tcDto", tcDto);
		return "inPayForm";
	}

	
	@RequestMapping(value="inPayPro")
	public String inPayPro(PayDto pDto, HttpServletRequest request, Model model) {
		ReservDto resvDto = ress.oneResv(pDto.getPayCode());
		pDto.setMemberId(resvDto.getMemberId());
		pDto.setGservNo(resvDto.getGservNo());
		pDto.setPcomplete("n");
		if(pDto.getPay_method().equals("card")) {
			pDto.setPay_method("신용카드");
		} else if(pDto.getPay_method().equals("vbank")) {
			pDto.setPay_method("무통장입금");
		} else if(pDto.getPay_method().equals("trans")) {
			pDto.setPay_method("실시간 계좌이체");
		} else if(pDto.getPay_method().equals("phone")) {
			pDto.setPay_method("핸드폰 소액결제");
		}
		// 결제 정보 입력
		ps.inPay(pDto);
		
		// 예약 정보 업데이트(결제됨!)
		resvDto.setPay_yn("y");
		ress.upPay(resvDto);
		
		// 포인트 사용시 포인트 사용분 차감
		String usePoint = request.getParameter("usePoint");
		if(usePoint!=null) {
			if(!usePoint.equals("")) {
				mbs.downPoint(Integer.parseInt(usePoint), pDto.getMemberId()); 
			}
		}
		String approvNum = request.getParameter("approvNum");
		model.addAttribute("pDto", pDto);
		model.addAttribute("approvNum",approvNum);
		
		return "inPayPro";
	}
	
	
	

/*   (회원) 결제 내역 	*/	
	@RequestMapping(value="pay_member")
	public String pay_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ps.total(ID);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<PayDto> payList = ps.selPayList(pdto);
		model.addAttribute("payList", payList);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		return "pay_member";
	}
	
/*   (회원) 후기 관리 	*/
	@RequestMapping(value="review_member")
	public String review_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ress.total_Complete(ID);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<ReservDto> complete = ress.completeList(pdto);
		
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		model.addAttribute("openReview",0);
		return "review_member";
	}

	
/*   (회원) 후기 관리 - 후기 등록 	*/
	@RequestMapping(value="inReviewForm")
	public String writeReview(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String payCode = request.getParameter("payCode");
		MemberDto mbDto = mbs.selMember(ID);
		ReservDto rsvDto = ress.oneResv(payCode);
		
		model.addAttribute("rsvDto", rsvDto);
		model.addAttribute("nickName", mbDto.getNickName());
		model.addAttribute("memberId", ID);
		return "inReviewForm";
	}
	
/*   (회원) 후기 관리 - 후기 수정 	*/
	@RequestMapping(value="upReviewForm")
	public String updateReviewForm(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));

		ReviewDto revDto = new ReviewDto();
		revDto.setMemberId(ID);
		revDto.setGservNo(gservNo);
		revDto = revs.oneReview(revDto);
		model.addAttribute("revDto", revDto);
		
		return "upReviewForm";
	}

/*   (회원) 후기 관리 - 후기 삭제 	*/
	@RequestMapping(value="delReviewPro")
	public String delReviewPro(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
        revDto.setMemberId(ID);
		revDto = revs.oneReview(revDto);
		revs.delReview(revDto);
		
		// 후기 삭제시 포인트 차감
		mbs.downPoint(100, revDto.getMemberId());
		model.addAttribute("gservNo", gservNo);
		
		// currentPage 보내줘야함.
		return "redirect:review_member.do";
	}

	
	
	
/*   (회원) 후기 관리 - 후기 보기 	*/
	@RequestMapping(value="getReviewPro")
	public String getReviewPro(int gservNo, HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
		revDto.setMemberId(ID);

		// 후기 선택
		revDto = revs.oneReview(revDto);
		
		// 후기 이미지 중 첫 번째 이미지 선택
		if(revDto.getRimg() != null) {
			String rImg = revDto.getRimg();
			String[] rImgs =rImg.split(",");
			revDto.setRimg(rImgs[0]);			
		}
		
		// 하나의 후기에 달린 후기 리스트 가져오기
		List<ReviewDto> revDtoList = revs.oneReviewList(revDto);  
		
		
		// 페이징
		String currentPage = request.getParameter("currentPage");
		int thisPage;
		if(currentPage==null) {
			thisPage=1;
		} else {
			thisPage=Integer.parseInt(currentPage);
		}
		
		PagingDto pdto = new PagingDto();
		int total = ress.total_Complete(ID);
		Paging pg = new Paging(total, currentPage);
		
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// 후기 open event 조정
		List<ReservDto> complete = ress.completeList(pdto);	  
		int rn = Integer.parseInt(request.getParameter("rn"));
		complete.get(total-rn).setOpenReview(1);
		
		// response
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		
		model.addAttribute("revDto",revDto);
		model.addAttribute("revList", revDtoList);
		model.addAttribute("currentPage", thisPage);
		return "review_member";
	}
	
	
/*   (회원) 후기 관리 - 답글 등록 	*/
	@RequestMapping(value="inCmtPro")
	public String writeCommentPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		int rn = Integer.parseInt(request.getParameter("rn"));
		revDto.setMemberId(ID);
		revs.inComment(revDto);
		model.addAttribute("gservNo", revDto.getGservNo());
		model.addAttribute("rn", rn);
		
		// currentPage 보내줘야함.
		return "redirect:getReviewPro.do";
	}

/*   (회원) 후기 관리 - 답글 삭제 	*/
	@RequestMapping(value="delCmtPro")
	public String delCmtPro(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		int rStep = Integer.parseInt(request.getParameter("rStep"));
		int rn = Integer.parseInt(request.getParameter("rn"));
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
        revDto.setMemberId(ID);
		revDto = revs.oneReview(revDto);
		revDto.setRstep(rStep);
		revs.delComment(revDto);
		
		model.addAttribute("gservNo", gservNo);
		model.addAttribute("rn", rn);
		
		// currentPage 보내줘야함.
		return "redirect:getReviewPro.do";
	}


	
/*-----------------------------------------------------------------------------------------
	[ 경희씨 ]
------------------------------------------------------------------------------------------*/	
	
	//회원 정보 페이지
	@RequestMapping(value="user_info")
	public String user_infoForm(HttpServletRequest request,Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		MemberDto mDto=mbs.selMember(ID);
		model.addAttribute("memberDto",mDto);
			
		return "user_info";
		
	}
	
	//회원 비밀번호 변경폼
	@RequestMapping(value="changePwForm")
	public String changePw(String memberId,Model model) {
		//String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		model.addAttribute("memberId",memberId);
		return "changePwForm";
	}
	
	//회원 비밀번호 변경
	@RequestMapping(value="changePasswd", method=RequestMethod.POST)
	public String changePasswd(MemberDto memberDto, HttpServletRequest request, Model model)throws Exception { 
		    // 1. changePw 정확성  호출  정확 :1 , 오류 : 0

		int status1 = mbs.changePwConfirm(memberDto);	
		String pw = request.getParameter("npw");	
		if (status1 > 0)  {			
			memberDto.setPw(pw);
			// 2. changePw Sevice 호출
			int status2 = mbs.changePw(memberDto);
			memberDto = mbs.selMember(memberDto.getMemberId());
			if (status2 > 0)  {
				model.addAttribute("memberDto",memberDto);
				model.addAttribute("message","성공수정");
				return "user_info";
			} else {
				model.addAttribute("message"," 수정 실패");
				return "changePwForm";
			}
		
		} else {
			model.addAttribute("message","password 검증실패");
			return "changePwForm";
		}
	} 

	//회원정보 수정 폼 페이지
	@RequestMapping(value="updateForm")
	public String user_updateForm(String memberId,Model model) {
		MemberDto mDto=mbs.selMember(memberId);
		model.addAttribute("memberDto",mDto);
		return "user_updateForm";
	}
	
	/*  (회원) 로그인 do  */
	@RequestMapping(value="logIn")
	public String logIn(MemberDto mbDto, Model model) {
		MemberDto mbDto2 = mbs.selMember(mbDto.getMemberId());
		if(mbDto.getPw().equals(mbDto2.getPw())) {
			
			// 태욱 수정
			
			int gno = mbs.selgNo(mbDto.getMemberId());
			
			if( gno > 0) {
				System.out.println("gno가져 왔다");
				model.addAttribute("gno", Integer.toString(gno));
			}
			
			// 태욱 수정
			
			model.addAttribute("result","1");
			model.addAttribute("ID", mbDto.getMemberId());
			return "loginCheck";
			
		}	else {
			model.addAttribute("result","0");
			return "loginCheck";
		}
		
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.setAttribute("ID", null);
		session.invalidate();
		return "logoutForm";
	}

	/*    회원가입 form 페이지  	*/
	@RequestMapping(value="joinForm")
	public String joinForm(Model model) {
		return"joinForm";
	}
	
	/*    회원가입[Member]   */
	@RequestMapping(value="joinMember")
	public String joinMember(MemberDto mbDto, Model model) {
		// Member 저장 Service ,  count ->저장여부 
		int count =mbs.inMember(mbDto);

		// 성공하면  logInForm
		// 실패하면  joinForm
		if (count > 0) {
			return "main";
		}
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "history.back(-1)";
		}
	
		
	}
	
	/* (회원) 비밀번호 찾기 Form */
	@RequestMapping(value="pswFindForm")
	public String pswFindForm(Model model) {
		
		return "pswFindForm";
		
	}
	
	
	
	//mailSending 
	@RequestMapping(value="mailSending")
	public String mailSending(HttpServletRequest request,Model model) {
		System.out.println("mailSending -> Start" );
		String toMail=request.getParameter("u_email");
		String memberId= request.getParameter("memberId");
		
		System.out.println(toMail);
		
		String setFrom="asparaguslee@gmail.com";
		
		String title="Follow Me 임시비밀번호 입니다."; 
		
		try {
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "logIn";
	}
	
	
/*	
 * @RequestMapping(value="email")
	public String u_email(String memberId,Model model) {  비번찾기 email발송 컨트롤러 생성전
		
		return "";
	}
*/	
	
	
/*-----------------------------------------------------------------------------------------
	소희
------------------------------------------------------------------------------------------*/

	@RequestMapping(value="selQAPro")
	public String selQAPro(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		System.out.println("여기까지 오긴하니?");
		String currentPage = request.getParameter("currentPage");
		System.out.println("currentPage="+currentPage);
		String qAreply = request.getParameter("qAreply");
		
		if(qAreply==null) {
			System.out.println("qAreply == null");
		}else if(qAreply.equals("y")||qAreply.equals("n")) {
			System.out.println("이건 그냥 넘겨줘야함");
		}else { //전체보기 위하여
			qAreply=null;
		}
		
		System.out.println("QAreply="+qAreply);
		PagingDto pdto = new PagingDto();
		//String ID = "abcd@naver.com";
		pdto.setMemberId(ID);
		System.out.println("pdto.getMemberId() = "+pdto.getMemberId());

		pdto.setReply_yn(qAreply);
		System.out.println("pdto.getReply_yn() = "+pdto.getReply_yn());
		//기본적으로는 ID로 전체 문의 개수 count
		//필터 적용시, 답변 여부 또한 확인해야함 
		int total = qs.selTotalQA(pdto);
		System.out.println("total : "+total);
		System.out.println("에러해결!");
		Paging pg = new Paging(total, currentPage);
		System.out.println("pg.getStart() : " + pg.getStart());
		System.out.println("pg.getEnd() : " + pg.getEnd());
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		// String reply_yn, String write_period도 PagingDto가 받아줘야함
		// 일단은 null로 받았을 경우로 만들어놓자
		List<QADto> qAList = qs.selQAList(pdto); //문의사항
		List<QADto> qAList_rpy = qs.selQAList_rpy(pdto); //이에 대한 답변
		System.out.println("qAList" + qAList);
		model.addAttribute("pg", pg);
		model.addAttribute("ID", ID); //접속한 사람의 ID
		model.addAttribute("qAList", qAList);
		model.addAttribute("qAList_rpy", qAList_rpy);
		model.addAttribute("qAreply", qAreply);
		System.out.println("여기까지 왔니?");
		return "selQAForm3";
	}
	

}