package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.OnReply;
import edu.job.project.util.PaginationCriteria;

public interface OnReplyService {

	List<OnReply> read(int bno);
	int create(OnReply reply);
	int update(OnReply reply);
	int delete(int rno);
	
	int getNumOfRecords(int bno); 
	List<OnReply> read(int bno, PaginationCriteria criteria);
	

} // OnReplyService {}
