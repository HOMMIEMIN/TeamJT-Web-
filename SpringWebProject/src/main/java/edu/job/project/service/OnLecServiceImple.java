package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;
import edu.job.project.prisitence.OnLecDao;


@Service
public class OnLecServiceImple implements OnLecService {
	
	@Autowired
	private OnLecDao dao;
	
	@Override
	public List<OnLec> read(String userId) {
		
		return dao.selectAll(userId);
	}

	@Override
	public List<GroupOn> readGroup(String userId) {

		return dao.selectAllGroup(userId);
	}

	@Override
	public int createGroup(GroupOn on) {
		
		return dao.insertGorup(on);
	}
	
	@Override
	public GroupOn readGroup(GroupOn on) {
		return dao.selectGroup(on);
	}

	@Override
	public List<OnLec> read(int bno) {
		
		return dao.selectBno(bno);
	}

	@Override
	public int create(OnLec on) {
		
		return dao.insertOnLec(on);
	}

	@Override
	public int updateGroupImage(OnLec on) {
		
		return dao.updateGroupImage(on);
	}

	@Override
	public List<OnLec> readByGroupBno(int groupBno) {
		
		return dao.selectGroupBnoByOnLec(groupBno);
	}

	@Override
	public OnLec readByBno(int bno) {
		// 
		return dao.selectBnoByOnLec(bno);
	}

	

}
