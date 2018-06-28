package edu.job.project.prisitence;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.OnLec;


public interface OnLecDao {

	List<OnLec> selectAll(String userId);
	
	List<OnLec> selectBno(int bno);
	
	List<GroupOn> selectAllGroup(String userId);
	
	int insertGorup(GroupOn on);
	
	GroupOn selectGroup(GroupOn on);
	
	int insertOnLec(OnLec on);
	
	int updateGroupImage(OnLec on);
}
