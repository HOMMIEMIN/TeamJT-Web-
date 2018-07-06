package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.Message;




public interface MessageService {
	   
	   // 해당 아이디에 달려있는 받은쪽지만 검색하는 메소드
	   List<Message> getRead(String userId);
	   
	   // 해당 아이디에 달려있는 보낸쪽지만 검색하는 메소드
	   List<Message> sendRead(String userId);
	   
	   // 쪽지 보내는 메소드(쪽지생성)
	   int create(Message message);
	   
	   // (받은) 쪽지 자세히 보기
	   Message getDetail (int mno);
	   
	   // (보낸) 쪽지 자세히 보기
	   Message sendDetail (int mno);
	   
	   // 쪽지 삭제
	   int delete(int mno);
	   
	   
	}// end interface MessegeService
