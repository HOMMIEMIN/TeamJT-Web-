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
	public List<Message> select(String userId) {
		
		return sqlSession.selectList(NAMESPACE + ".messageAll", userId);
	}//end select()

}//end class MessegeDaoImple
