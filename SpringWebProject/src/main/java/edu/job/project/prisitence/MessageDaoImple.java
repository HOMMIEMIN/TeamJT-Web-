package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.Message;
import edu.job.project.messagepageutil.NowPageAndShowOnepageMessageNo;

@Repository
public class MessageDaoImple implements MessageDao {

   private static final String NAMESPACE = "edu.job.project.mappers.MessageMapper";
   
   @Autowired private SqlSession sqlSession;
  private static final Logger logger = LoggerFactory.getLogger(MessageDaoImple.class);
   
   

   
   @Override
   public int insert(Message message) {
      
      
      return sqlSession.insert(NAMESPACE+ ".messageSend" , message);
   }// end insert()
   
   @Override
   public Message select(int mno) {
      // 
      return sqlSession.selectOne(NAMESPACE+".selectByMno", mno);
   }// end select()
   
   @Override
   public int update(Message message) {
      
      return sqlSession.update(NAMESPACE+".updateReadOr", message);
   }// end update()
   
   @Override
   public int delete(int mno) {
      
      return sqlSession.delete(NAMESPACE+".deleteMessege", mno) ;
   }// end delete()
   
   @Override
	public int getNumOfRecords(String userId) {
	   String yourId = userId;
	   
	   return sqlSession.selectOne(NAMESPACE + ".totalGetCount", yourId);
	}// end getNumOfRecords()
   
   @Override
	public int getSendNumOfRecords(String userId) {
		
		return sqlSession.selectOne(NAMESPACE + ".totalSendCount", userId);
	}
   
   @Override
	public int selectByCount(Message message) {
		
		return sqlSession.selectOne(NAMESPACE + ".selectCount", message);
	}
   
   
   @Override
	public List<Message> getSelect(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo) {
	   String yourId = userId;
	   logger.info("메세지DaoImple의 최종 값 들어오는것 =({}, {}, {})", userId, nowPageAndShowOnepageMessageNo.getStart(), nowPageAndShowOnepageMessageNo.getEnd());
	   
	   Map<String, Object> list = new HashMap<>();
	   list.put("yourId", yourId);
	   list.put("start", nowPageAndShowOnepageMessageNo.getStart());
	   list.put("end", nowPageAndShowOnepageMessageNo.getEnd());
	   return sqlSession.selectList(NAMESPACE+ ".listgetPage", list);
	}// end select(nowPageAndShowOnepageMessageNo)
   
   // yourId에 보낸 메세지.
   @Override
   public List<Message> sendSelect(String userId, NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo) {
	   
	   Map<String, Object> list = new HashMap<>();
	   list.put("userId", userId);
	   list.put("start", nowPageAndShowOnepageMessageNo.getStart());
	   list.put("end", nowPageAndShowOnepageMessageNo.getEnd());
	   return sqlSession.selectList(NAMESPACE + ".listsendPage", list);
   }//end select()

   
   
   /*   // userId에 받은 메세지.
   @Override
   public List<Message> getSelect(String userId) {
      String yourId = userId;
      
      return sqlSession.selectList(NAMESPACE + ".messageAll", yourId);
   }//end select()
    */   
}//end class MessegeDaoImple
