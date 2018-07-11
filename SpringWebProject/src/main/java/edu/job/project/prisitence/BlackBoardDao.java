package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.BlackBoard;

public interface BlackBoardDao {
	List<BlackBoard> select(String userid);
	int insert(BlackBoard blackboard);
	int update(BlackBoard blackboard);
	int delete(BlackBoard blackboard);
}
