package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.OffLec;

public interface OffLecDao {

	
	int insert(OffLec offLecture);
	
	int update(OffLec offLecture);
	
	OffLec select(int bno);
	
	List<OffLec> select();
	
	int insertGroup(GroupOff off);
	
	// 폴더 전체 읽기 
	List<GroupOff> selectAllGroup(String userId);
		
	GroupOff selectGroup(GroupOff off);
	
	List<OffLec> selectBno(int bno);
	
	int updateFolderImage(OffLec off);
	
	// 하나의 강의 검색
	OffLec selectBnoByOffLec(int bno);
	
	List<OffLec> selectGroupBnoByOffLec(int groupBno);
}
