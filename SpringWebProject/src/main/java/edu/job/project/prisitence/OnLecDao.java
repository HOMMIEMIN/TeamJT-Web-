package edu.job.project.prisitence;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.OnLec;


public interface OnLecDao {

	// 소강의 DAO
	
	List<OnLec> selectAll(String userId);
	
	List<OnLec> selectBno(int bno);
	
	OnLec selectBnoByOnLec(int bno);
	
	int insertOnLec(OnLec on);
	
	
	
	// 폴더 DAO
	int insertGorup(GroupOn on);
	
	List<OnLec> selectGroupBnoByOnLec(int groupBno);
	
	List<GroupOn> selectAllGroup(String userId);
	
	GroupOn selectGroup(GroupOn on);
	
	int updateGroupImage(OnLec on);
	
	int updateLike(int bno);
	
	List<OnLec> selectByCategory(String category);
	
	String selectGroupBnoByLecName(int groupBno);
	
	List<OnLec> selectByCategoryAll();
	
	List<OnLec> selectByKeyword(String keyword);
	
}
