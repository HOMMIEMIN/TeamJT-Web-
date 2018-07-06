package edu.job.project.domain;

public class WaitingOff {
	
	private String bno;
	private String userid;
	
	public WaitingOff () {}

	public WaitingOff(String bno, String userid) {
		this.bno = bno;
		this.userid = userid;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
