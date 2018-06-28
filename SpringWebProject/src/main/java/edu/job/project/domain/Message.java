package edu.job.project.domain;

import java.util.Date;

// 쪽지함을 위한 vo??
public class Message {
	private String userId; // 자신이 보낸는 쪽지
	private String yourId; // 상대방이 보낸 쪽지
	private String mcontent;// 쪽지 내용
	private Date regdate; // 쪽지 작성 시간
	private int mno;	//   쪽지 번호(Primary Key)
	
	// 기본생성자
	public Message() {}

	// 매개변수를 갖은 생성자
	public Message(String userId, String yourId, String mcontent, Date regdate, int mno) {
		this.userId = userId;
		this.yourId = yourId;
		this.mcontent = mcontent;
		this.regdate = regdate;
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getYourId() {
		return yourId;
	}

	public void setYourId(String yourId) {
		this.yourId = yourId;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	};

	
	
	
}//end classs Messege
