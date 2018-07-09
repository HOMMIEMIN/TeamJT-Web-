package edu.job.project.prisitence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.Message;

@Repository
public class MessageDaoImple implements MessageDao {

   private static final String NAMESPACE = "edu.job.project.mappers.MessageMapper";
   
   @Autowired private SqlSession sqlSession;
   
   
   // userId에 받은 메세지.
   @Override
   public List<Message> getSelect(String userId) {
      String yourId = userId;
      
      return sqlSession.selectList(NAMESPACE + ".messageAll", yourId);
   }//end select()
   
   // yourId에 보낸 메세지.
   @Override
   public List<Message> sendSelect(String userId) {
      
      return sqlSession.selectList(NAMESPACE + ".sendMessageAll", userId);
   }//end select()

   
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
   

}//end class MessegeDaoImple
