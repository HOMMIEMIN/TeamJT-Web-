package edu.job.project.util;

// 페이지 번호 링크들을 만들어 내기 위한 유틸리트 클래스 
public class PageLinkMaker {
	
	PaginationCriteria criteria; // 한 페이지에 얼마를 보여줄 것인지에 대한 정보를 알아야 하기 때문에 생성
	
	int totalCount; // 테이블의 전체 records 갯수
	private int numsOfPageLinks; // 페이지 링크의 갯수 
	private int startPageNo; // 페이지 링크의 시작 페이지 번호 
	private int endPageNo; // 페이지 링크의 끝 페이지 번호 
	private boolean hasPrev; // 이전 페이지 링크가 있는지를 결정하는 ( 있느냐? 없느냐? 그래서 boolean으로 설정)
	private boolean hasNext; // 다음 페이지 링크가 있는 지 결정 

	public PageLinkMaker() {
		numsOfPageLinks = 10;
	}
	
	public PaginationCriteria getCriteria() {
		return criteria;
	}


	public void setCriteria(PaginationCriteria criteria) {
		this.criteria = criteria;
	}

	
	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getNumsOfPageLinks() {
		return numsOfPageLinks;
	}



	public void setNumsOfPageLinks(int numsOfPageLinks) {
		this.numsOfPageLinks = numsOfPageLinks;
	}

	
	public int getStartPageNo() {
		return startPageNo;
	}


	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}




	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}



	public boolean isHasPrev() {
		return hasPrev;
	}


	public void setHasPrev(boolean hasPrev) {
		this.hasPrev = hasPrev;
	}


	public boolean isHasNext() {
		return hasNext;
	}



	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}



	public void setPageLinkData() {
		int totalPageLinks = (int) Math.ceil( (double) totalCount / criteria.getNumsPerPage());
		
		int temp = (int) Math.ceil((double) criteria.getPage() / numsOfPageLinks) * numsOfPageLinks;
		
		if (temp > totalPageLinks) {
			endPageNo = totalPageLinks;
		} else {
			endPageNo = temp;
		}
		
		
		startPageNo = ( (endPageNo - 1) / numsOfPageLinks ) * numsOfPageLinks + 1; // (double)로 나눈 것이 아니기 때문에 정수로 몫만 남게됨!! 
		
		if( startPageNo == 1) {
			hasPrev = false;
		} else {
			hasPrev = true;
		}
		
		
		if( endPageNo * criteria.getNumsPerPage() >= totalCount ) {
			hasNext = false;
		} else {
			hasNext = true;
		}
		
		
	} //setPageLinkData()
	
	
} // PageLinkMaker {}
