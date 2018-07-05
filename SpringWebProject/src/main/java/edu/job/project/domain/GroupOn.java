package edu.job.project.domain;

import java.util.Date;

public class GroupOn {
	
	private int bno;
	private int lecBno;
	private String userId;
	private String lecName;
	private String lecType;
	private String lecCategory;
	private int lecLike;
	private Date regdate;
	private String imagePath;
	private int cnt;
	
	
	public GroupOn() {

	}


	public GroupOn(int bno, int lecBno, String userId, String lecName, String lecType, String lecCategory, int lecLike,
			Date regdate, String imagePath, int cnt) {

		this.bno = bno;
		this.lecBno = lecBno;
		this.userId = userId;
		this.lecName = lecName;
		this.lecType = lecType;
		this.lecCategory = lecCategory;
		this.lecLike = lecLike;
		this.regdate = regdate;
		this.imagePath = imagePath;
		this.cnt = cnt;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getLecBno() {
		return lecBno;
	}


	public void setLecBno(int lecBno) {
		this.lecBno = lecBno;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getLecName() {
		return lecName;
	}


	public void setLecName(String lecName) {
		this.lecName = lecName;
	}


	public String getLecType() {
		return lecType;
	}


	public void setLecType(String lecType) {
		this.lecType = lecType;
	}


	public String getLecCategory() {
		return lecCategory;
	}


	public void setLecCategory(String lecCategory) {
		this.lecCategory = lecCategory;
	}


	public int getLecLike() {
		return lecLike;
	}


	public void setLecLike(int lecLike) {
		this.lecLike = lecLike;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	



	
	


	
	
	



	
	
	
	

}
