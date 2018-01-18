package oracle.java.s20180102.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.ReviewService;

@Controller
public class UploadController {

  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Resource(name = "uploadPath")
	  private String uploadPath;
  @Autowired
  	private GuideService gs;
  @Autowired
	private ReviewService revs;
  @Autowired
  	private MemberService mbs;
  
  @RequestMapping(value = "inRImg", method = RequestMethod.GET)
  public void inRImg() {
		System.out.println("uploadForm GET Start");
 }

  
/* 후기 등록  */
  
/*  @RequestMapping(value = "inRImg", method = RequestMethod.POST)
  public String inRImg(@RequestParam("images") List<MultipartFile> rImg, HttpServletRequest request, Model model) throws Exception {
		String[] savedName = new String[rImg.size()];
		for(int i=0; i<rImg.size(); i++) {
			savedName[i] = uploadFile(rImg.get(i).getOriginalFilename(), rImg.get(i).getBytes());
		}
	    model.addAttribute("savedName", savedName);
    return "inRImg";
  }*/ // 이 방식으로 뿌려주면 이미지가 리프레쉬되기까지 시간이 약간 걸려서 바로 뜨지 않음...;
  
  @RequestMapping(value="inReviewPro", method = RequestMethod.POST)
	public String writeReviewPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		String savedName = "";
		if(revDto.getImages() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] images = revDto.getImages();
			for(int i=0; i<images.length; i++) {
				if(!images[i].getOriginalFilename().equals("")) {
					try {
						if(i==0) {
							savedName = uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						} else {
							savedName +=","+uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					revDto.setRimg(savedName);   // rImg DB 저장될 이름 셋팅
				}
			}			
		}
		
		// 후기등록
		revs.inReview(revDto);
		
		// 회원 포인트 100점 쌓아주기
		String ID = revDto.getMemberId();
		mbs.upPoint(100,ID);

		// currentPage 보내줘야함.
		return "redirect:review_member.do";
	}
  
/* 후기 수정  */  
	@RequestMapping(value="upReviewPro")
	public String updateReviewPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		String savedName = "";
		System.out.println("revDto.getImages" + revDto.getImages());
		if(revDto.getImages() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] images = revDto.getImages();
			
			for(int i=0; i<images.length; i++) {
				if(!images[i].getOriginalFilename().equals("")) {
					
					try {
						if(i==0) {
							savedName = uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						} else {
							savedName +=","+uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					revDto.setRimg(savedName);   // rImg DB 저장될 이름 셋팅	
				}
				
			}			
		}
		// 수정시 파일이  null로 들어왔을 때 처리
		if(revDto.getRimg() == null) {
			ReviewDto rDto =  revs.oneReview(revDto);
			revDto.setRimg(rDto.getRimg());
		}
		
		// 리뷰 수정
		revs.upReview(revDto);
		return "redirect:review_member.do";
	} 
	
/* 회원 프로필 수정  */  
	@RequestMapping(value="user_update",  method = RequestMethod.POST)
	public String  user_update(MemberDto mbDto, Model model) {
		String savedName = "";
		System.out.println("mbDto.getMemberImage() : " + mbDto.getMemberImage());
		if(mbDto.getMemberImage() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile images = mbDto.getMemberImage();
			
			if(!images.getOriginalFilename().equals("")) {
					try {
						savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
					}  catch (Exception e) {
						System.out.println(e.getMessage());
					}
					mbDto.setMimg(savedName);   // gImg DB 저장될 이름 셋팅	
				}
			// 수정시 파일이  null로 들어왔을 때 처리
			if(images.getOriginalFilename().equals("")) {
				MemberDto mbdto =  mbs.selMember(mbDto.getMemberId());
				mbDto.setMimg(mbdto.getMimg());
			}
		}
		
		mbs.upMember(mbDto); // 프로필 수정
		return "redirect:user_info.do";
	}
	
/* 가이드 프로필 수정  */  
	@RequestMapping(value="upGuidePro", method = RequestMethod.POST)
	public String upGuidePro(GuideDto gDto, Model model) {
		String savedName = "";
		System.out.println("gDto.getGuideImg() : " + gDto.getGuideImg());
		if(gDto.getGuideImg() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile images = gDto.getGuideImg();
			
			if(!images.getOriginalFilename().equals("")) {
					try {
						savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
					}  catch (Exception e) {
						System.out.println(e.getMessage());
					}
					gDto.setGimg(savedName);   // gImg DB 저장될 이름 셋팅	
				}
			// 수정시 파일이  null로 들어왔을 때 처리
			if(images.getOriginalFilename().equals("")) {
				GuideDto gdto =  gs.g_info(gDto.getMemberId());
				gDto.setGimg(gdto.getGimg());
			}
		}
		
		gs.upGuide(gDto); // 프로필 수정
		
		return "redirect:profile_guide.do";
	}
	
  private String uploadFile(String originalName, byte[] fileData) throws Exception {

    UUID uid = UUID.randomUUID();

    String savedName = uid.toString() + "_" + originalName;

    File target = new File(uploadPath, savedName);

    FileCopyUtils.copy(fileData, target);

    return savedName;

  }
  
}