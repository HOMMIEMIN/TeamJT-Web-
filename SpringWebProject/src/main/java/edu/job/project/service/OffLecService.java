package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.OffLec;


public interface OffLecService {

	// CRUD( Create , Read , Update , Delete )
	
	List<OffLec> read();
	
	int create(OffLec offLecture);
	
	// 대기자 신청
	int update(OffLec offLecture);
	
}
