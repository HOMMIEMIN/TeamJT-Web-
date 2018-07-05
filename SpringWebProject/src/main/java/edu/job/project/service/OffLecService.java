package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.OffLec;


public interface OffLecService {

	// CRUD( Create , Read , Update , Delete )
	
	List<OffLec> read();
	
	int create(OffLec offLecture);
	
	// 대기자 신청
	int update(OffLec offLecture);
	
	// 폴더 만들기 
	int create(GroupOff groupOff);
	
	List<GroupOff> readGroup(String userId);
	
	GroupOff readGroup(GroupOff off);
	
	List<OffLec> read(int bno);
	
	int updateFolderImage(OffLec off);
	
	//하나의 강의 보이게 하는 detail 강의
	OffLec readByBno(int bno);
	
	// 하나의 강의에서 그 강의의 강좌 ( 폴더 ) 리스트를 읽는것. 
	List<OffLec> readByGroupBno(int groupBno);
	
	int updateWaiting(OffLec offLec);
	
	OffLec readForWaiting(int bno);
	
	
}
