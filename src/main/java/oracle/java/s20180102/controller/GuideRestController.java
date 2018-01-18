package oracle.java.s20180102.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.service.GServService;


@RestController
@RequestMapping("/rest")
public class GuideRestController {
	 @Autowired
	 private GServService gss;
	 
	 @RequestMapping("/selArea")
	  public List<CodeSetDto> selArea(String itemCode) {
		System.out.println("@RestController selArea  START");
		System.out.println("Controller in itemCode : " + itemCode);
		List<CodeSetDto> codeSetList = gss.selCodeSet(itemCode);
		System.out.println("codeSetList : "+codeSetList);
		return codeSetList;
		}
	 @RequestMapping("/upLock")
	 public int upLock(String lock) {
		 
		 GServDto gsDto = new GServDto();
		 String gservLock = lock.substring(8); 
		 System.out.println("gservLock = "+gservLock);
		 String gservNo = lock.substring(0, 8);	
		 System.out.println("gservNo = " +gservNo);
		 gsDto.setGservNo(Integer.parseInt(gservNo));
		 gsDto.setGservLock(gservLock);
		 int result = gss.upLock(gsDto);
		 return result;
	 }
/*	 @RequestMapping("/downExcel")
    public void listExcel(HttpServletRequest request, HttpServletResponse response, GServDto gsDto, ModelMap modelMap) throws Exception, Exception {
		 System.out.println("downExcel in gNo = "+ gsDto.getgNo());
		 System.out.println("downExcel in gservNo = "+ gsDto.getgservNo());
		 System.out.println("downExcel in gStartSearch = "+ gsDto.getStartSearch());
        
        // 그냥 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
		 List<GServDto> dataList = gss.selPayGuide(gsDto);
        System.out.println("dataList.get(0).getgservNo() = "+dataList.get(0).getgservNo());
        System.out.println("dataList.get(0).getgservTitle() = "+dataList.get(0).getgservTitle());
        // 받은 데이터를 맵에 담는다.
        Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("dataList", dataList);
        
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        MakeExcel me = new MakeExcel();
        System.out.println("MakeExcel 객체 생성 ! 여기까지 무사히");
        me.download(request, response, beans, "test" , "temp.xlsx", "");
    }*/
}
