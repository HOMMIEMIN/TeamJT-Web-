package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.Message;



public interface MessageDao {
	   
	   // 해당 아이디에 달려있는 받은쪽지만 검색하는 메소드
	   List<Message> getSelect(String userId);
	   
	   // 해당 아이디에 달려있는 보낸쪽지만 검색하는 메소드
	   List<Message> sendSelect(String userId);
	   
	   // 쪽지 작성
	   int insert(Message message);
	   
	   // 글번호만 보고 찾기
	   Message select(int mno);
	   
	   // 수신여부
	   int update(Message message);
	   
	   // 삭제
	   int delete(int mno);
	   
	   
	} // end interface MessegeDao