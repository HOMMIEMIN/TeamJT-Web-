package edu.job.project.domain;

public class Member {

	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String profileUrl;
	private String onLec;
	private String offLec;
	private String offLecWaiting;
	
	
	
	public Member() {

	}

	public Member(String userId, String password, String userName, String phone) {
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.phone = phone;
	}



	public Member(String userId, String password, String userName, String phone, String profileUrl, String onLec,
			String offLec, String offLecWaiting) {

		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.phone = phone;
		this.profileUrl = profileUrl;
		this.onLec = onLec;
		this.offLec = offLec;
		this.offLecWaiting = offLecWaiting;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileUrl() {
		return profileUrl;
	}

	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}

	public String getOnLec() {
		return onLec;
	}

	public void setOnLec(String onLec) {
		this.onLec = onLec;
	}

	public String getOffLec() {
		return offLec;
	}

	public void setOffLec(String offLec) {
		this.offLec = offLec;
	}

	public String getOffLecWaiting() {
		return offLecWaiting;
	}

	public void setOffLecWaiting(String offLecWaiting) {
		this.offLecWaiting = offLecWaiting;
	}
	
	
	
}
