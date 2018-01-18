package oracle.java.s20180102.model;

import java.sql.Date;

public class MsgDto {
	private String msgSender;
	private String msgReceiver;
	private Date msgEndate;
	private String msgContent;
	private String msgCheck;
	private Date msgCheckDate;
	
	public String getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}
	public String getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	public Date getMsgEndate() {
		return msgEndate;
	}
	public void setMsgEndate(Date msgEndate) {
		this.msgEndate = msgEndate;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getMsgCheck() {
		return msgCheck;
	}
	public void setMsgCheck(String msgCheck) {
		this.msgCheck = msgCheck;
	}
	public Date getMsgCheckDate() {
		return msgCheckDate;
	}
	public void setMsgCheckDate(Date msgCheckDate) {
		this.msgCheckDate = msgCheckDate;
	}
	
	
}
