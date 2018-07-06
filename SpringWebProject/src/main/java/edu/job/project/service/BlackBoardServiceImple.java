package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.BlackBoard;
import edu.job.project.prisitence.BlackBoardDao;

@Service
public class BlackBoardServiceImple implements BlackBoardService {

	@Autowired
	private BlackBoardDao dao;
	
	
	@Override
	public List<BlackBoard> selectById(String userId) {
		
		return dao.select(userId);
	}

	@Override
	public int insertById(BlackBoard blackboard) {
		
		return dao.insert(blackboard);
	}

	@Override
	public int update(BlackBoard blackboard) {
		// TODO Auto-generated method stub
		return dao.update(blackboard);
	}

	@Override
	public int delete(BlackBoard blackboard) {
		// TODO Auto-generated method stub
		return dao.delete(blackboard);
	}

}
