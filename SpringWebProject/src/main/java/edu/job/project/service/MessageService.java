package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.Message;




public interface MessageService {
	
	// 해당 아이디에 달려있는 쪽지만 검색하는 메소드
	List<Message> getRead(String userId);
	
	List<Message> sendRead(String userId);
	
	// 쪽지 보내는 메소드
	int create(Message message);
	
}// end interface MessegeService
