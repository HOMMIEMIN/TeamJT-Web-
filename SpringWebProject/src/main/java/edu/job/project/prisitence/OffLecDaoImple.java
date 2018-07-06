package edu.job.project.prisitence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.OffLec;

import edu.job.project.mappers.UploadMapper;

@Repository
public class OffLecDaoImple implements OffLecDao {

	private static final Logger logger = LoggerFactory.getLogger(OffLecDaoImple.class);
	private static final String NAMESPACE = "edu.job.project.mappers.UploadMapper";
	@Autowired
	private UploadMapper uploadMapper;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(OffLec o) {
		
		logger.info("insert( {},{},{},{},{},{},{} )",o.getUserid(),o.getCategory(),o.getTitle(),o.getContent(),o.getMeetingday(),o.getMaxmember(),o.getImgPath());
		
		return session.insert(NAMESPACE + ".insert" , o);
	}
	
	// 대기자 넣기 
	@Override
	public int update(OffLec offLecture) {
	
		logger.info("update ( 오프라인 강의 신청대기자 넣기) {},{}",offLecture.getBno(),offLecture.getWaitingId());
		
		return uploadMapper.updateWaitingId(offLecture);
	}
	
	// 대기자 넣을 글번호 찾기 
	@Override
	public OffLec select(int bno) {
	
		logger.info("select( 해당 게시글의 번호: {} )" , bno);
		
		return uploadMapper.selectWaitingList(bno);
	}
	
	@Override
	public List<OffLec> select() {
		
		return uploadMapper.selectAll();
	}
	
	@Override
	public int insertGroup(GroupOff off) {
		 logger.info("insert 폴더 :{}" , off.getLecName());
		return session.insert(NAMESPACE+".groupInsert",off);
	}

	@Override
	public List<GroupOff> selectAllGroup(String userId) {
		
		return session.selectList(NAMESPACE + ".selectAllGroupOff" , userId);
	}
	
	@Override
	public GroupOff selectGroup(GroupOff off) {
	
		return session.selectOne(NAMESPACE + ".selectOneGroupOff",off);
	}
	
	@Override
	public List<OffLec> selectBno(int bno) {
	
		return session.selectList(NAMESPACE + ".selectBnoOffLec",bno);
	}
	
	@Override
	public int updateFolderImage(OffLec off) {
	
		return session.update(NAMESPACE + ".updateFolderImage" , off);
	}
	
	@Override
	public OffLec selectBnoByOffLec(int bno) {
	
		return (OffLec)session.selectOne(NAMESPACE + ".selectBnoByOffLec" , bno);
	}

	@Override
	public List<OffLec> selectGroupBnoByOffLec(int groupBno) {
	
		return session.selectList(NAMESPACE + ".selectGroupBnoByOffLec", groupBno);
	}
	
	@Override
	public int updateApply(OffLec offLec) {
		
		return session.update(NAMESPACE + ".updateApply" , offLec);
	}
	
}
