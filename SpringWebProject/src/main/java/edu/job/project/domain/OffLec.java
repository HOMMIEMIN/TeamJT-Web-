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
	private int curmember;
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
			int maxmember,int curmember, Date regdate ,String imgPath , String location , int groupBno) {
		this.bno = bno;					// 글번호 1
		this.userid = userid;			// 아이디 2
		this.category = category;		// 카테고리 3
		this.title = title;				// 글제목 4
		this.content = content;			// 글내용 5
		this.meetingday = meetingday;	// 모임날짜 6
		this.maxmember = maxmember;		// 최대수강인원 7
		this.curmember = curmember;		// 현재신청자 8
		this.regdate = regdate;			// 작성시간 9
		this.imgPath = imgPath;			// 이미지경로 10
		this.location=location;			// 모임위치 11
		this.groupBno=groupBno;			// 폴더 번호  12
		
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
	public int getCurmember() {
		return curmember;
	}
	public void setCurmember(int curmember) {
		this.curmember = curmember;
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
