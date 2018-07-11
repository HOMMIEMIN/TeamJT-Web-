package edu.job.project.prisitence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.BlackBoard;

@Repository
public class BlackBoardDaoImple implements BlackBoardDao {

	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "edu.job.project.mappers.BlackBoardMapper";
	@Override
	public List<BlackBoard> select(String userid) {
		
		return session.selectList(NAMESPACE+ ".selectById", userid);
	}
	@Override
	public int insert(BlackBoard blackboard) {
		
		return session.insert(NAMESPACE+".insertById", blackboard);
	}
	@Override
	public int update(BlackBoard blackboard) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE+".updateByBNO", blackboard);
	}
	@Override
	public int delete(BlackBoard blackboard) {
		// TODO Auto-generated method stub
		return session.delete(NAMESPACE+".deleteByBNO", blackboard);
	}
	
	
}
