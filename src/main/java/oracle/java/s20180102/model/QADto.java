package oracle.java.s20180102.model;

import java.sql.Date;

public class QADto {
	private String memberId;
	private int gServNo;
	//소문자로 고침 0111
	private int qaNumber;
	private String qaReceiver;
	private String qaTitle;
	private String qaContent;
	private Date qaCredate;
	private int qaStep;
	private String qaComplete;
	
	//소희 추가
	private String gServTitle; //문의가 어떤 gService에 대하여 작성된 것인지
	//----------------------

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getgServNo() {
		return gServNo;
	}

	public void setgServNo(int gServNo) {
		this.gServNo = gServNo;
	}

	public int getQaNumber() {
		return qaNumber;
	}

	public void setQaNumber(int qaNumber) {
		this.qaNumber = qaNumber;
	}

	public String getQaReceiver() {
		return qaReceiver;
	}

	public void setQaReceiver(String qaReceiver) {
		this.qaReceiver = qaReceiver;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaCredate() {
		return qaCredate;
	}

	public void setQaCredate(Date qaCredate) {
		this.qaCredate = qaCredate;
	}

	public int getQaStep() {
		return qaStep;
	}

	public void setQaStep(int qaStep) {
		this.qaStep = qaStep;
	}

	public String getQaComplete() {
		return qaComplete;
	}

	public void setQaComplete(String qaComplete) {
		this.qaComplete = qaComplete;
	}

	public String getgServTitle() {
		return gServTitle;
	}

	public void setgServTitle(String gServTitle) {
		this.gServTitle = gServTitle;
	}


	
	
	
	
}
