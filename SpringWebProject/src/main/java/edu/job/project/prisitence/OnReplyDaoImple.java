package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.job.project.domain.OnReply;
import edu.job.project.mappers.OnReplyMapper;
import edu.job.project.util.PaginationCriteria;

@Repository
public class OnReplyDaoImple implements OnReplyDao {
	
//	@Autowired SqlSession sqlSession;
	@Autowired OnReplyMapper onReplyMapper;
	

	@Override
	public List<OnReply> select() {
				
		return onReplyMapper.selectAll();
	}

	@Override
	public List<OnReply> select(int bno) {
		
		return onReplyMapper.selectByBno(bno);
	}

	@Override
	public int insert(OnReply reply) {
		
		return onReplyMapper.insert(reply);
	}

	@Override
	public int update(OnReply reply) {
		
		return onReplyMapper.update(reply);
	}

	@Override
	public int delete(int rno) {
		
		return onReplyMapper.delete(rno);
	}

	@Override
	public int getNumOfRecords(int bno) {
		
		return onReplyMapper.totalCount(bno);
	}

	@Override
	public List<OnReply> select(int bno, PaginationCriteria criteria) {
		Map<String, Object> list = new HashMap<>();
		list.put("bno", bno);
		list.put("start", criteria.getStart());
		list.put("end", criteria.getEnd());
		return onReplyMapper.listPage(list);
	}


} // OnReplyDaoImple{}
