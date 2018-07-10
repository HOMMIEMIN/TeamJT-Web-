package edu.job.project.prisitence;

import java.util.List;


import edu.job.project.domain.OnReply;
import edu.job.project.util.PaginationCriteria;

public interface OnReplyDao {

	List<OnReply> select();
	List<OnReply> select(int bno);
	int insert(OnReply reply);
	int update(OnReply reply);
	int delete(int rno);
	
	int getNumOfRecords(int bno); 
	List<OnReply> select(int bno, PaginationCriteria criteria);

	
} // OnReplyDao{}
