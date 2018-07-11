package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.OffReply;
import edu.job.project.util.PaginationCriteria;

public interface OffReplyService {

	List<OffReply> read(int bno);
	int create(OffReply reply);
	int update(OffReply reply);
	int delete(int rno);
	
	int getNumOfRecords(int bno); 
	List<OffReply> read(int bno, PaginationCriteria criteria);
	

} // OffReplyService {}
