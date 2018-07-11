package edu.job.project.domain;

import java.util.Date;

// Online Lecture에 대한 댓글 
public class OnReply {

	// 멤버변수
	int bno;
	int rno;
	String userid;
	String content;
	Date regdate;
	
	// 생성자
	public OnReply() {}
	public OnReply(int bno, int rno, String userid, String content, Date regdate) {
		this.bno = bno;
		this.rno = rno;
		this.userid = userid;
		this.content = content;
		this.regdate = regdate;
	}
	
	
	// getter, setter
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	



} // OnReply
