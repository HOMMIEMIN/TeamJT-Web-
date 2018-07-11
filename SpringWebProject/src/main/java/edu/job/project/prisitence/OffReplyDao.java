package edu.job.project.prisitence;

import java.util.List;


import edu.job.project.domain.OffReply;
import edu.job.project.util.PaginationCriteria;

public interface OffReplyDao {

	List<OffReply> select();
	List<OffReply> select(int bno);
	int insert(OffReply reply);
	int update(OffReply reply);
	int delete(int rno);
	
	int getNumOfRecords(int bno); 
	List<OffReply> select(int bno, PaginationCriteria criteria);

	
} // OffReplyDao{}
