package edu.job.project.messagepageutil;

public class NowPageAndShowOnepageMessageNo {

	// mapper에게 값을 주기위한 변수
	private int nowShowPage; // 현재 블라우저에서 보고 있는 현재 페이지 번호
	private int onePageMessageNo; // 한 페이지에 보여줄 글 목록의 갯수
	
	
	// 기본 설정 생성자
	public NowPageAndShowOnepageMessageNo () {
		nowShowPage =1 ; // 현재 페이지 = 1 라고 초기화
		onePageMessageNo = 10; // 한 페이지에 보여줄 글 갯수 = 10 라고 초기화
	}

	// getter/setter
	// 현재 보고있는 페이지
	public int getNowShowPage() {
		return nowShowPage;
	}


	public void setNowShowPage(int nowShowPage) {
		this.nowShowPage = nowShowPage;
	}

	// 한페이지에 보여질 메세지 갯수
	public int getOnePageMessageNo() {
		return onePageMessageNo;
	}


	public void setOnePageMessageNo(int onePageMessageNo) {
		this.onePageMessageNo = onePageMessageNo;
	}
	
	// message-mapper.xml에 정의된 SQL 문장의 #{start}에 넣어줄 값
	// 만약 3번 페이지를 보고 있고 3번 페이지의 보이는 글이 10개씩이라면 
	// 그 3번 페이지의 시작 글은 21번째 글이 될것이다.
	public int getStart() {
		return (nowShowPage -1) * onePageMessageNo + 1;
	}
	
	// board-mapper.xml에 정의된 SQL 문장의 #{end}에 넣어줄 값
	public int getEnd() {
		return nowShowPage * onePageMessageNo;
	}
	
	
	
	
	
	
}// end class NowPageAndShowOnepageMessageNo
