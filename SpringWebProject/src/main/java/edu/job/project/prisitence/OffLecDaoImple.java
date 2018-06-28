package edu.job.project.prisitence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.OffLec;

import edu.job.project.mappers.UploadMapper;

@Repository
public class OffLecDaoImple implements OffLecDao {

	private static final Logger logger = LoggerFactory.getLogger(OffLecDaoImple.class);
	
	@Autowired
	private UploadMapper uploadMapper;
	
	@Override
	public int insert(OffLec o) {
		
		logger.info("insert( {},{},{},{},{},{},{} )",o.getUserid(),o.getCategory(),o.getTitle(),o.getContent(),o.getMeetingday(),o.getMaxmember(),o.getImgPath());
		
		return uploadMapper.insert(o);
	}
	
	// 대기자 넣기 
	@Override
	public int update(OffLec offLecture) {
	
		logger.info("update ( 오프라인 강의 신청대기자 넣기) {},{}",offLecture.getBno(),offLecture.getWaitingId());
		
		return uploadMapper.updateWaitingId(offLecture);
	}
	
	@Override
	public OffLec select(int bno) {
	
		logger.info("select( 해당 게시글의 번호: {} )" , bno);
		
		return uploadMapper.selectWaitingList(bno);
	}
	
	@Override
	public List<OffLec> select() {
		
		return uploadMapper.selectAll();
	}

}
