package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.Message;
import edu.job.project.messagepageutil.NowPageAndShowOnepageMessageNo;



public interface MessageDao {
	   
/*	   // 해당 아이디에 달려있는 받은쪽지만 검색하는 메소드
	   List<Message> getSelect(String userId);*/
	   
	   // 해당 아이디에 달려있는 보낸쪽지만 검색하는 메소드
	   List<Message> sendSelect(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo);
	   
	   // 쪽지 작성
	   int insert(Message message);
	   
	   // 글번호만 보고 찾기
	   Message select(int mno);
	   
	   // 수신여부
	   int update(Message message);
	   
	   // 삭제
	   int delete(int mno);
	   
	   
	   
	   
	   // 내가 받은 레코드(쪽지)의 갯수 
	   int getNumOfRecords(String userId);
	   
	   // 내가 보낸 레코드(쪽지)의 갯수
	   int getSendNumOfRecords(String userId);
	   
	   
	   // 호민이형@@@@@
	   int selectByCount(Message message);
	   
	   
	   // 현재 보이는 페이지, 한페이지에 몇개의 쪽지보일건지 
	   List<Message> getSelect(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo);
	   
	   
	} // end interface MessegeDao