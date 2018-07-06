package edu.job.project.domain;

public class BlackBoard {
	private String userid;
	private String title;
	private String json;
	private int bno;
	
	public BlackBoard(){};
	public BlackBoard(String userid, String title, String json,int bno){
		this.json = json;
		this.title = title;
		this.userid = userid;
		this.bno = bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	};
	
	
	
	
}
