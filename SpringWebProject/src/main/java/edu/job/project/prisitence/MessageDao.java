package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.Message;



public interface MessageDao {
	
	// 해당 아이디에 달려있는 쪽지만 검색하는 메소드
	List<Message> select(String userId);
	
} // end interface MessegeDao