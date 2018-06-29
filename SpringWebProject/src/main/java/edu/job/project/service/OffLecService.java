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
	
}
