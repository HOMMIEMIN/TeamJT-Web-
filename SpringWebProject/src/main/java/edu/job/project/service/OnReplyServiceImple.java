package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.OnReply;
import edu.job.project.prisitence.OnReplyDao;
import edu.job.project.util.PaginationCriteria;

@Service
public class OnReplyServiceImple implements OnReplyService {
	
	@Autowired OnReplyDao onReplyDao;

	@Override
	public List<OnReply> read(int bno) {
		
		return onReplyDao.select(bno);
	}

	@Override
	public int create(OnReply reply) {
		
		return onReplyDao.insert(reply);
	}

	@Override
	public int update(OnReply reply) {
		
		return onReplyDao.update(reply);
	}

	@Override
	public int delete(int rno) {
		
		return onReplyDao.delete(rno);
	}

	@Override
	public int getNumOfRecords(int bno) {
		
		return onReplyDao.getNumOfRecords(bno);
	}

	@Override
	public List<OnReply> read(int bno, PaginationCriteria criteria) {
		

		
		return onReplyDao.select(bno, criteria);
	}
	



} // OnReplyServiceImple{}
