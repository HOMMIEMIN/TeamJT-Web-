package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.BlackBoard;

public interface BlackBoardService {
	List<BlackBoard> selectById(String userId);
	int insertById(BlackBoard blackboard);
	int update(BlackBoard blackboard);
	int delete(BlackBoard blackboard);
}
