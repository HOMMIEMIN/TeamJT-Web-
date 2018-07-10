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
	
	// 신청한 대기자 수락하기
	int updateApply(OffLec offLec);
	
	GroupOff selectByMyLec(int groupBno);
		
	List<OffLec> selectByCategory(String category);	
	
	//??? 뭐하는지 모르겠음.
	int cntUpdate(int bno);
	
	int deleteOffLec(int bno);
	
	OffLec selectByMyOffLec(int bno);
	
	// 그룹찾기 
	String selectGroupBnoByLecName(int groupBno);
	
	
}
