package edu.job.project.messagepageutil;

public class MessagePageLinkMaker {
	
	// 현재보고있는 페이지, 한페이지에 몇개의 쪽지를 보여줄건지 정해진 클래스
	NowPageAndShowOnepageMessageNo nowpageandshowonepagemessageno;
	
	private int totalPageConut;  // 아래 보이는 페이징 숫자의 총갯수  <1,2,3,4,5...>
	private int showOfPageLinks; // 아래 보이는 페이징의 갯수 기본값 설정 필요
	private int linkStartPageNo; // 페이징링크에 시작 페이지 << (6),7,8,9,10>> 6번을 뜻함
	private int linkEndPageNo;   // 페이징처리 링크에서 끝페이지 << 6,7,8,9,(10)>> 10번을 뜻함
	private boolean hasPrev;     // 이전 페이지 링크가 있는 지 결정
	private boolean hasNext;	 // 다음 페이지 링크가 있는 지 결정
	
	public MessagePageLinkMaker() { // 아래  페이징 << 1,2,3,4,5,6,7,8,9,10 >> 의 갯수 설정
		this.showOfPageLinks = 10;
	}

	public NowPageAndShowOnepageMessageNo getNowpageandshowonepagemessageno() {
		return nowpageandshowonepagemessageno;
	}

	public void setNowpageandshowonepagemessageno(NowPageAndShowOnepageMessageNo nowpageandshowonepagemessageno) {
		this.nowpageandshowonepagemessageno = nowpageandshowonepagemessageno;
	}
	
	public int getTotalPageConut() {
		return totalPageConut;
	}
	
	public void setTotalPageConut(int totalPageConut) {
		this.totalPageConut = totalPageConut;
	}
	
	public int getShowOfPageLinks() {
		return showOfPageLinks;
	}
	
	public int getLinkStartPageNo() {
		return linkStartPageNo;
	}
	
	public int getLinkEndPageNo() {
		return linkEndPageNo;
	}

	public boolean isHasPrev() {
		return hasPrev;
	}


	public boolean isHasNext() {
		return hasNext;
	}
	
	// 멤버 변수 linkStartPageNo, linkEndPageNo, hasNext, hasPrev 값을 계산, 설정
	public void setPageLinkData() {
		// 전체 페이지 링크의 갯수
		int totalPageLinks = (int) Math.ceil((double) totalPageConut / nowpageandshowonepagemessageno.getOnePageMessageNo());
		// 현재 보고있는 페이지 번호
		int temp = (int) Math.ceil((double)nowpageandshowonepagemessageno.getNowShowPage() / showOfPageLinks) * showOfPageLinks;
		if( temp > totalPageLinks) {
			linkEndPageNo = totalPageLinks;
		} else {
			linkEndPageNo = temp;
		}
		// end 먼저 찾는게 나옴
		
		linkStartPageNo = ((linkEndPageNo - 1) / showOfPageLinks) * showOfPageLinks +1; // (double)로 나눈 것이 아니기 때문에 정수로 몫만 남게됨
		
		if ( linkStartPageNo == 1 ) {
			hasPrev = false;
		} else {
			hasPrev = true;
		}
		
		if (  linkEndPageNo * nowpageandshowonepagemessageno.getOnePageMessageNo() >= totalPageConut ) {
			hasNext = false;
		} else {
			hasNext = true;
		}
		
	} //end setPageLinkData()


	
	
}// end class MessagePageLinkMaker
