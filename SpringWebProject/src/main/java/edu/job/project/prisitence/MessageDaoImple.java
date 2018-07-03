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
	
	// userId에 받은 메세지.
	@Override
	public List<Message> sendSelect(String userId) {
		
		return sqlSession.selectList(NAMESPACE + ".sendMessageAll", userId);
	}//end select()

	
	@Override
	public int insert(Message message) {
		//TODO: 이거 멤퍼에 정의하고 해야함!!!
		
		return sqlSession.insert(NAMESPACE+ ".messageSend" , message);
	}// end insert()

}//end class MessegeDaoImple
