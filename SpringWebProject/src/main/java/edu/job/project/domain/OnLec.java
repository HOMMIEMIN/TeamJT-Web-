package edu.job.project.domain;

import java.util.Date;

public class OnLec {
	
	private int bno;
	private int groupBno;
	private String lecCategory;
	private String title;
	private String content;
	private String videoPath;
	private String addFile;
	private String userId;
	private Date regDate;
	
	
	
	public OnLec() {

	}



	public OnLec(int bno, int groupBno, String lecCategory, String title, String content, String videoPath,
			String addFile, String userId, Date regDate) {
		this.bno = bno;
		this.groupBno = groupBno;
		this.lecCategory = lecCategory;
		this.title = title;
		this.content = content;
		this.videoPath = videoPath;
		this.addFile = addFile;
		this.userId = userId;
		this.regDate = regDate;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public int getGroupBno() {
		return groupBno;
	}



	public void setGroupBno(int groupBno) {
		this.groupBno = groupBno;
	}



	public String getLecCategory() {
		return lecCategory;
	}



	public void setLecCategory(String lecCategory) {
		this.lecCategory = lecCategory;
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



	public String getVideoPath() {
		return videoPath;
	}



	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}



	public String getAddFile() {
		return addFile;
	}



	public void setAddFile(String addFile) {
		this.addFile = addFile;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

	
	
	
	

}
