package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		logger.info("insert( {},{},{},{},{},{},{} )", o.getUserid(), o.getCategory(), o.getTitle(), o.getContent(),
				o.getMeetingday(), o.getMaxmember(), o.getImgPath());

		return session.insert(NAMESPACE + ".insert", o);
	}

	// 대기자 넣기
	@Override
	public int update(OffLec offLecture) {

		logger.info("update ( 오프라인 강의 신청대기자 넣기) {},{}", offLecture.getBno(), offLecture.getWaitingId());

		return uploadMapper.updateWaitingId(offLecture);
	}

	// 대기자 넣을 글번호 찾기
	@Override
	public OffLec select(int bno) {

		logger.info("select( 해당 게시글의 번호: {} )", bno);

		return uploadMapper.selectWaitingList(bno);
	}

	@Override
	public List<OffLec> select(int start, int end) {
		Map<String, Integer> list = new HashMap<>();
		list.put("start", start);
		list.put("end", end);
		return session.selectList(NAMESPACE + ".selectAll", list);
	}

	@Override
	public int insertGroup(GroupOff off) {
		logger.info("insert 폴더 :{}", off.getLecName());
		return session.insert(NAMESPACE + ".groupInsert", off);
	}

	@Override
	public List<GroupOff> selectAllGroup(String userId) {

		return session.selectList(NAMESPACE + ".selectAllGroupOff", userId);
	}

	@Override
	public GroupOff selectGroup(GroupOff off) {

		return session.selectOne(NAMESPACE + ".selectOneGroupOff", off);
	}

	@Override
	public List<OffLec> selectBno(int bno) {

		return session.selectList(NAMESPACE + ".selectBnoOffLec", bno);
	}

	@Override
	public int updateFolderImage(OffLec off) {

		return session.update(NAMESPACE + ".updateFolderImage", off);
	}

	@Override
	public OffLec selectBnoByOffLec(int bno) {

		return (OffLec) session.selectOne(NAMESPACE + ".selectBnoByOffLec", bno);
	}

	@Override
	public List<OffLec> selectGroupBnoByOffLec(int groupBno) {

		return session.selectList(NAMESPACE + ".selectGroupBnoByOffLec", groupBno);
	}

	@Override
	public int updateApply(OffLec offLec) {

		return session.update(NAMESPACE + ".updateApply", offLec);
	}

	// 학생페이지에서 오프라인 폴더 목록 보이기
	@Override
	public GroupOff selectByMyLec(int groupBno) {

		return session.selectOne(NAMESPACE + ".selectByMyLec", groupBno);
	}

	@Override
	public List<OffLec> selectByCategory(String category) {

		return session.selectList(NAMESPACE + ".selectByCategory", category);
	}

	@Override
	public List<OffLec> select() {

		return session.selectList(NAMESPACE + ".selectAll2");
	}

	@Override
	public List<OffLec> selectByCategoryText(String category, String keywords) {
		Map<String, String> list = new HashMap<>();
		list.put("category", category);
		list.put("keyword", "%"+keywords+"%");
		return session.selectList(NAMESPACE + ".selectByTextCategory", list);
	}

	@Override
	public List<OffLec> selectByKeyword(String keyword) {
		
		return session.selectList(NAMESPACE + ".selectByText", "%"+keyword+"%");
	}
	public int cntUpdate(int bno) {

		return session.update(NAMESPACE + ".updateCnt", bno);
	}

	// 글삭제
	@Override
	public int deleteOffLec(int bno) {

		return session.delete(NAMESPACE + ".deleteOffLec", bno);

	}
	
	
	@Override
	public OffLec selectByMyOffLec(int bno) {
	
		return session.selectOne(NAMESPACE + ".selectByMyOffLec",bno);
	}
	
	
	@Override
	public String selectGroupBnoByLecName(int groupBno) {

		return session.selectOne(NAMESPACE + ".selectGroupBnoByLecName", groupBno);
	}

}
