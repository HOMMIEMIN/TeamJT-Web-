package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.OffReply;
import edu.job.project.prisitence.OffReplyDao;
import edu.job.project.util.PaginationCriteria;

@Service
public class OffReplyServiceImple implements OffReplyService {
	
	@Autowired OffReplyDao OffReplyDao;

	@Override
	public List<OffReply> read(int bno) {
		
		return OffReplyDao.select(bno);
	}

	@Override
	public int create(OffReply reply) {
		
		return OffReplyDao.insert(reply);
	}

	@Override
	public int update(OffReply reply) {
		
		return OffReplyDao.update(reply);
	}

	@Override
	public int delete(int rno) {
		
		return OffReplyDao.delete(rno);
	}

	@Override
	public int getNumOfRecords(int bno) {
		
		return OffReplyDao.getNumOfRecords(bno);
	}

	@Override
	public List<OffReply> read(int bno, PaginationCriteria criteria) {
		

		
		return OffReplyDao.select(bno, criteria);
	}
	



} // OffReplyServiceImple{}
