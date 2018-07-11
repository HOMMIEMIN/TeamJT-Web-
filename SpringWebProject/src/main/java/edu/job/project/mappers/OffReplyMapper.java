package edu.job.project.mappers;

import java.util.List;
import java.util.Map;

import edu.job.project.domain.OffReply;

import edu.job.project.util.PaginationCriteria;

public interface OffReplyMapper {

	List<OffReply> selectAll();
	List<OffReply> selectByBno(int bno);
	int insert(OffReply reply);
	int update(OffReply reply);
	int delete(int rno);

	int totalCount(int bno); 
	List<OffReply> listPage(Map<String, Object> list);

	
} // OnReplyMapper{}
