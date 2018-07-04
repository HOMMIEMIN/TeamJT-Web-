package edu.job.project.domain;

import java.util.Date;

public class OffLec {
	private int bno;			// 글번호
	private String userid;		// 작성자
	private String category;	// 카테고리선택
	private String title;		// 강의제목
	private String content;		// 강의 내용
	
	private String meetingday;	// 모일날짜
	
	private int maxmember;
	private Date regdate;
	private String applyId; 	// 신청자 아이디 
	private String waitingId; 	// 수락대기중인 아이디들
	
	private String imgPath;     // 이미지 경로  ( imagePath )
	
	private String location;
	
	private int groupBno;
	// 그룹 폴더 이름??? 
	
	// 기본 생성자 
	public OffLec() {}
	
		


	public OffLec(int bno, String userid, String category, String title, String content, String meetingday,
			int maxmember, Date regdate ,String imgPath , String location , int groupBno) {
		this.bno = bno;
		this.userid = userid;
		this.category = category;
		this.title = title;
		this.content = content;
		this.meetingday = meetingday;
		this.maxmember = maxmember;
		this.regdate = regdate;
		this.imgPath = imgPath;
		this.location=location;
		this.groupBno=groupBno;
		
	}
	
	public OffLec(int bno,String waitingId) {
		this.bno=bno;
		this.waitingId=waitingId;
	}

	public OffLec(int bno) {
		
	}
	


	public int getBno() {
		return bno;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid; 
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMeetingday() {
		return meetingday;
	}

	public void setMeetingday(String meetingday) {
		this.meetingday = meetingday;
	}

	public int getMaxmember() {
		return maxmember;
	}

	public void setMaxmember(int maxmember) {
		this.maxmember = maxmember;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getApplyId() {
		return applyId;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

	public String getWaitingId() {
		return waitingId;
	}

	public void setWaitingId(String waitingId) {
		this.waitingId = waitingId;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public int getGroupBno() {
		return groupBno;
	}


	public void setGroupBno(int groupBno) {
		this.groupBno = groupBno;
	}
	
	
	
	
}
