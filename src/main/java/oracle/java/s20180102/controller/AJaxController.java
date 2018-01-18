package oracle.java.s20180102.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.service.QAService;

@RestController
@RequestMapping("/shCon")
public class AJaxController {

	/* @Autowired
	 private GServService gss;
	 
	 @RequestMapping("/selArea")
	  public List<CodeSetDto> selArea(String itemCode) {
		System.out.println("@RestController selArea  START");
		System.out.println("Controller in itemCode : " + itemCode);
		List<CodeSetDto> codeSetList = gss.selCodeSet(itemCode);
		System.out.println("codeSetList : "+codeSetList);
		return codeSetList;
		}*/
	
	@Autowired
	private QAService qs;
	/*@Autowired
	private GServService gss;*/
	
	//받아온 답글을 저장하고, 밑에 붙여서 다시 보여주도록 함
	
	//고치기 --> 그냥 qadto로 전부 받아오도록 하자~
	@RequestMapping("/writeQA_guide")
	public QADto writeQA_guide(int send_qAnumber, String send_qAcontent,String send_qAreceiver,String send_gServNo,String send_memberId) {
		
		System.out.println("여기까지 왔어??");
		
		//새로 insert하려는 QADto
		QADto qad = new QADto();
		System.out.println("qad 생성!!");
		qad.setQaNumber(send_qAnumber);
		qad.setQaContent(send_qAcontent);
		qad.setQaReceiver(send_qAreceiver);
		qad.setgServNo(Integer.parseInt(send_gServNo));
		qad.setMemberId(send_memberId);
		System.out.println("받은 값 set!!!");
				
		qad.setQaTitle("답변에는 제목 안만들거야");
		qad.setQaComplete("n");

				
		//값을 새로 Insert한다
		qs.insertQA_guide(qad);
		
		System.out.println("여기까지 못오는듯");
		
		return qad;
	}
	
	//selQAForm2에서 쓰는건데 결과적으로 안쓰는 페이지
	/*@RequestMapping("/selQATitle")
	public List<QADto> selQATitle(String data){
		System.out.println("@RestController selQATitle START! QAnumber : "+data);
		
		List<QADto> conNRepList = qs.selQACkList(Integer.parseInt(data));
		System.out.println("conNRepList : "+conNRepList);
		System.out.println("conNRepList.get(0).getMemberId() : "+conNRepList.get(0).getMemberId());
		return conNRepList;
}*/
}