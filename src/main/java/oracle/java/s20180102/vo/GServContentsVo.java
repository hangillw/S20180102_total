package oracle.java.s20180102.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GServContentsVo {
	// contents 다중으로 받아오기 위한 변수
	private String[] gServIntro;
	private String[] gServOrder;
	private MultipartFile[] imgfile;
	private String[] imgSrc;

	// GServi
	private int gServNo;
	private int gNo;
	private String gServTitle;
	private String gServGps;
	private String gServLeadTime;
	private String gServSub;
	private String gServArea;
	private int gServPrice;
	private int memSizeMin;
	private int memSizeMax;
	private String gServLang;
	private String servTag;
	private String pInclude;
	private String notPInclude;
	private String caution;
	private String gServSDate;
	private String gServEDate;
	private String gServDay;
	private String days[];
	private Date gServCreDate;
	private Date gServFixDate;
	private String gServLock;
	private String pickUpLoc;
	private String pickUpTime;
	
	// 추가 항목
	
	
	
	public String[] getImgSrc() {
		return imgSrc;
	}
	public String[] getDays() {
		return days;
	}
	public void setDays(String[] days) {
		this.days = days;
	}
	public String getPickUpLoc() {
		return pickUpLoc;
	}
	public void setPickUpLoc(String pickUpLoc) {
		this.pickUpLoc = pickUpLoc;
	}
	public String getPickUpTime() {
		return pickUpTime;
	}
	public void setPickUpTime(String pickUpTime) {
		this.pickUpTime = pickUpTime;
	}
	public void setImgSrc(String[] imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String[] getgServIntro() {
		return gServIntro;
	}
	public void setgServIntro(String[] gServIntro) {
		this.gServIntro = gServIntro;
	}
	public String[] getgServOrder() {
		return gServOrder;
	}
	public void setgServOrder(String[] gServOrder) {
		this.gServOrder = gServOrder;
	}
	public MultipartFile[] getImgfile() {
		return imgfile;
	}
	public void setImgfile(MultipartFile[] imgfile) {
		this.imgfile = imgfile;
	}
	public int getgServNo() {
		return gServNo;
	}
	public void setgServNo(int gServNo) {
		this.gServNo = gServNo;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgServTitle() {
		return gServTitle;
	}
	public void setgServTitle(String gServTitle) {
		this.gServTitle = gServTitle;
	}
	public String getgServGps() {
		return gServGps;
	}
	public void setgServGps(String gServGps) {
		this.gServGps = gServGps;
	}
	public String getgServLeadTime() {
		return gServLeadTime;
	}
	public void setgServLeadTime(String gServLeadTime) {
		this.gServLeadTime = gServLeadTime;
	}
	public String getgServSub() {
		return gServSub;
	}
	public void setgServSub(String gServSub) {
		this.gServSub = gServSub;
	}
	public String getgServArea() {
		return gServArea;
	}
	public void setgServArea(String gServArea) {
		this.gServArea = gServArea;
	}
	public int getgServPrice() {
		return gServPrice;
	}
	public void setgServPrice(int gServPrice) {
		this.gServPrice = gServPrice;
	}
	public int getMemSizeMin() {
		return memSizeMin;
	}
	public void setMemSizeMin(int memSizeMin) {
		this.memSizeMin = memSizeMin;
	}
	public int getMemSizeMax() {
		return memSizeMax;
	}
	public void setMemSizeMax(int memSizeMax) {
		this.memSizeMax = memSizeMax;
	}
	public String getgServLang() {
		return gServLang;
	}
	public void setgServLang(String gServLang) {
		this.gServLang = gServLang;
	}
	public String getServTag() {
		return servTag;
	}
	public void setServTag(String servTag) {
		this.servTag = servTag;
	}
	public String getpInclude() {
		return pInclude;
	}
	public void setpInclude(String pInclude) {
		this.pInclude = pInclude;
	}
	public String getNotPInclude() {
		return notPInclude;
	}
	public void setNotPInclude(String notPInclude) {
		this.notPInclude = notPInclude;
	}
	public String getCaution() {
		return caution;
	}
	public void setCaution(String caution) {
		this.caution = caution;
	}
	public String getgServSDate() {
		return gServSDate;
	}
	public void setgServSDate(String gServSDate) {
		this.gServSDate = gServSDate;
	}
	public String getgServEDate() {
		return gServEDate;
	}
	public void setgServEDate(String gServEDate) {
		this.gServEDate = gServEDate;
	}
	public String getgServDay() {
		return gServDay;
	}
	public void setgServDay(String gServDay) {
		this.gServDay = gServDay;
	}
	public Date getgServCreDate() {
		return gServCreDate;
	}
	public void setgServCreDate(Date gServCreDate) {
		this.gServCreDate = gServCreDate;
	}
	public Date getgServFixDate() {
		return gServFixDate;
	}
	public void setgServFixDate(Date gServFixDate) {
		this.gServFixDate = gServFixDate;
	}
	public String getgServLock() {
		return gServLock;
	}
	public void setgServLock(String gServLock) {
		this.gServLock = gServLock;
	}
	//
	
}
