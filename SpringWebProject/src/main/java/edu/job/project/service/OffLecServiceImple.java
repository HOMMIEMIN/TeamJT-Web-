package edu.job.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.OffLec;


import edu.job.project.prisitence.OffLecDao;

@Service
public class OffLecServiceImple implements OffLecService {

	public static final Logger logger = LoggerFactory.getLogger(OffLecService.class);
	
	@Autowired
	private OffLecDao dao;
	
	@Override
	public List<OffLec> read() {
		// 게시글 전체 보기 
		return dao.select();
	}

	@Override
	public int create(OffLec offLecture) {
		// 글 작성하기 
		return dao.insert(offLecture);
	}

	@Override
	public int update(OffLec offLecture) {
		// 강의 신청
		return dao.update(offLecture);
	}
	
	// 폴더 만들기 
	@Override
	public int create(GroupOff groupOff) {
		
		return dao.insertGroup(groupOff);
	}

	// 폴더 전체 검색 
	@Override
	public List<GroupOff> readGroup(String userId) {
	
		return dao.selectAllGroup(userId);
	}
	
	@Override
	public GroupOff readGroup(GroupOff off) {
	
		return dao.selectGroup(off);
	}
	
	// 디테일들어가기 
	@Override
	public List<OffLec> read(int bno) {
		
		return dao.selectBno(bno);
	}
	
	@Override
	public int updateFolderImage(OffLec off) {
	
		return dao.updateFolderImage(off);
	}
	
	@Override
	public OffLec readByBno(int bno) {
	
		return dao.selectBnoByOffLec(bno);
	}
	
	@Override
	public List<OffLec> readByGroupBno(int groupBno) {
	
		return dao.selectGroupBnoByOffLec(groupBno);
	}
	
	
	@Override
	public int updateWaiting(OffLec offLec) {

		return dao.update(offLec); 
	}
	
	// 대기자 넣을 글번호 찾기 
	@Override
	public OffLec readForWaiting(int bno) {
		return dao.select(bno);
	}
	
	
	
}
