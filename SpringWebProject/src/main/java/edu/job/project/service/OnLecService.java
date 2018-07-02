package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.OnLec;

public interface OnLecService {

	
	List<OnLec> read(String userId);
	
	List<OnLec> read(int bno);
	
	List<GroupOn> readGroup(String userId);
	
	int createGroup(GroupOn on);
	
	GroupOn readGroup(GroupOn on);
	
	int create(OnLec on);
	
	int updateGroupImage(OnLec on);
	
	List<OnLec> readByGroupBno(int groupBno);
	
	OnLec readByBno(int bno);
	
	String like(OnLec on);
	
	int likeUp(int Bno);
	
	List<OnLec> readByCategory(String category);
	
	String readByLecName(int groupBno);
	
	List<OnLec> readByCategoryAll();
}
