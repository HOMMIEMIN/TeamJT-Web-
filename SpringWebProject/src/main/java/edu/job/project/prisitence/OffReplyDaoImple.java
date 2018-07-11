package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.job.project.domain.OffReply;
import edu.job.project.mappers.OffReplyMapper;
import edu.job.project.util.PaginationCriteria;

@Repository
public class OffReplyDaoImple implements OffReplyDao {
	
//	@Autowired SqlSession sqlSession;
	@Autowired OffReplyMapper OffReplyMapper;
	

	@Override
	public List<OffReply> select() {
				
		return OffReplyMapper.selectAll();
	}

	@Override
	public List<OffReply> select(int bno) {
		
		return OffReplyMapper.selectByBno(bno);
	}

	@Override
	public int insert(OffReply reply) {
		
		return OffReplyMapper.insert(reply);
	}

	@Override
	public int update(OffReply reply) {
		
		return OffReplyMapper.update(reply);
	}

	@Override
	public int delete(int rno) {
		
		return OffReplyMapper.delete(rno);
	}

	@Override
	public int getNumOfRecords(int bno) {
		
		return OffReplyMapper.totalCount(bno);
	}

	@Override
	public List<OffReply> select(int bno, PaginationCriteria criteria) {
		Map<String, Object> list = new HashMap<>();
		list.put("bno", bno);
		list.put("start", criteria.getStart());
		list.put("end", criteria.getEnd());
		return OffReplyMapper.listPage(list);
	}


} // OffReplyDaoImple{}
