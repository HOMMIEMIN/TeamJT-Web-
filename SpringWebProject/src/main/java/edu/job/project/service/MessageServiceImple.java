package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.Message;
import edu.job.project.messagepageutil.NowPageAndShowOnepageMessageNo;
import edu.job.project.prisitence.MessageDao;

@Service
public class MessageServiceImple implements MessageService {

   @Autowired MessageDao messageDao;
   
/*   //받은거 읽기
   @Override
   public List<Message> getRead(String userId) {
      
      return messageDao.getSelect(userId);
   } // end
*/   
   // 보낸거 읽기
   @Override
   public List<Message> sendRead(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo) {
      
      return messageDao.sendSelect(userId, nowPageAndShowOnepageMessageNo);
   } // end
   
   // 쪽지 생성
   @Override
   public int create(Message message) {
      // TODO Auto-generated method stub
      return messageDao.insert(message);
   } // end
   
   // 받은쪽지 자세히 보기
   @Override
   public Message getDetail(int mno) {
      Message m = new Message();
      m.setMno(mno);
      int result = messageDao.update(m);
      System.out.println("업데이트 : " + m);
      
      return messageDao.select(mno);
   } // end
   
   // 보낸 쪽지 자세히 보기
   @Override
   public Message sendDetail(int mno) {
      
      return messageDao.select(mno);
   } // end
   
   // 삭제 하기
   @Override
   public int delete(int mno) {
      
      return messageDao.delete(mno);
   } // end
   
   @Override
	public int getNumOfRecords(String userId) {
		
		return messageDao.getNumOfRecords(userId);
	} // end
   
   @Override
	public int getSendNumOfRecords(String userId) {
		
		return messageDao.getSendNumOfRecords(userId);
	}
   
   
   @Override
   public int readCount(Message message) {

      return messageDao.selectByCount(message);
   }
   
   
   @Override
	public List<Message> getRead(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo) {
		
		return messageDao.getSelect(userId ,nowPageAndShowOnepageMessageNo);
	} // end
   
   
   
}
