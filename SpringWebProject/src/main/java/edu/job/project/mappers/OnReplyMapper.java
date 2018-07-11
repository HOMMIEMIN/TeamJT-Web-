package edu.job.project.mappers;

import java.util.List;
import java.util.Map;

import edu.job.project.domain.OnReply;
import edu.job.project.util.PaginationCriteria;

public interface OnReplyMapper {

	List<OnReply> selectAll();
	List<OnReply> selectByBno(int bno);
	int insert(OnReply reply);
	int update(OnReply reply);
	int delete(int rno);

	int totalCount(int bno); 
	List<OnReply> listPage(Map<String, Object> list);

	
} // OnReplyMapper{}
