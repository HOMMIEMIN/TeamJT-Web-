package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;

public interface OnLecService {

	
	List<OnLec> readByCateKey(String category, String keyword);
	
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
	
	String likeDelete(OnLec on);
	
	int likeUp(int Bno);
	
	List<OnLec> readByCategory(String category, int start, int end);
	
	String readByLecName(int groupBno);
	
	List<OnLec> readByCategoryAll(int start, int end);
	
	List<OnLec> readByKeyword(String keyword);
	
	List<GroupOn> readByMyLec(Member m);
	
	int updateCnt(int bno);
}
