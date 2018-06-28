package edu.job.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
