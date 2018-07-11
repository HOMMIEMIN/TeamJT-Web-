package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.Message;
import edu.job.project.messagepageutil.NowPageAndShowOnepageMessageNo;




public interface MessageService {
	   
	   // 해당 아이디에 달려있는 받은쪽지만 검색하는 메소드
	  // List<Message> getRead(String userId);
	   
	   // 해당 아이디에 달려있는 보낸쪽지만 검색하는 메소드
	   List<Message> sendRead(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo);
	   
	   // 쪽지 보내는 메소드(쪽지생성)
	   int create(Message message);
	   
	   // (받은) 쪽지 자세히 보기
	   Message getDetail (int mno);
	   
	   // (보낸) 쪽지 자세히 보기
	   Message sendDetail (int mno);
	   
	   // 쪽지 삭제
	   int delete(int mno);
	   
	   // 내가 받은 페이지의 레코드 갯수
	   int getNumOfRecords(String userId);
	   
	   // 내가 보낸 페이지의 레코드 갯수
	   int getSendNumOfRecords(String userId);
	   
	   // 호민이형꺼@@@@@
	   int readCount(Message message);
	   
	   
	   // 끝번호만 검색해주는 메소드
	   List<Message> getRead(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo);
	   
	   
	}// end interface MessegeService
