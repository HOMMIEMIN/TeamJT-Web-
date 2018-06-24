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
}