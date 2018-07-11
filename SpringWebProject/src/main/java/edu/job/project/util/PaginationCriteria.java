package edu.job.project.util;

// 한 페이지의 보여줄 글 목록의 갯수 (start, end) 를 계산하기 위한 utility 클래스 
public class PaginationCriteria {
	
// 멤버변수 	
	private int page; // 브라우저에서 보고 있는 현재 페이지 번호 
	private int numsPerPage; // 한 페이지에 보여 줄 글 목록의 개수 
	private int start;
	private int end;

// 생성자 
	public PaginationCriteria() { // 기본페이지에서는 현재페이지는 1이고 한 페이지에 보여줄 글 개수는 10개 
		page = 1; 
		numsPerPage = 3;
	}
	
	public PaginationCriteria(int page, int numsPerPage) {
		this.page = page;
		this.numsPerPage = numsPerPage;
	}

	
// getter, setter
		
	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getNumsPerPage() {
		return numsPerPage;
	}


	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}
	
	
	// board-mapper.xml 에 정의된 SQL 문장의  #{start} 에 넣어줄 값을 계산한 메소드
	public int getStart() {  // #{start} EL 문장은 getStart()를 찾아. 
		return start;
	}
	
	// board-mapper.xml 에 정의된 SQL 문장의 #{end} 에 넣어줄 값을 계산한 메소드
	public int getEnd() {
		return end;
	}
	
	
	public void setStart(int start) {
		this.start = start;
	}
	
	public void setEnd(int end) {
		this.end = end;
	}

	
	
} // PaginationCriteria {}
