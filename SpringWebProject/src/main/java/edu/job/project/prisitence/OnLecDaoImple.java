package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.OnLec;


@Repository
public class OnLecDaoImple implements OnLecDao{

	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "edu.job.project.mappers.OnLecMapper";
	
	@Override
	public List<OnLec> selectAll(String userId) {
		
		return session.selectList(NAMESPACE + ".selectAllOnLec", userId);
	}

	@Override
	public List<GroupOn> selectAllGroup(String userId) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".selectAllGroupOn", userId);
	}
	
	//폴더 만들기 
	@Override
	public int insertGorup(GroupOn on) {
		System.out.println(on.getLecName());
		return session.insert(NAMESPACE + ".groupInsert",on);
	}

	@Override
	public GroupOn selectGroup(GroupOn on) {
	
		return session.selectOne(NAMESPACE + ".selectOneGroupOn", on);
	}

	@Override
	public List<OnLec> selectBno(int bno) {
		
		return session.selectList(NAMESPACE + ".selectBnoOnLec",bno);
	}

	@Override
	public int insertOnLec(OnLec on) {
	
		return session.insert(NAMESPACE + ".insertOnLec",on);
	}

	@Override
	public int updateGroupImage(OnLec on) {

		return session.update(NAMESPACE + ".gropOnImageUpdate", on);
	}

	@Override
	public OnLec selectBnoByOnLec(int bno) {
		
		return (OnLec)session.selectOne(NAMESPACE+ ".selectBnoByOnLec",bno);
	}

	@Override
	public List<OnLec> selectGroupBnoByOnLec(int groupBno) {
		// 
		return session.selectList(NAMESPACE + ".selectGroupBnoByOnLec", groupBno);
	}

	@Override
	public int updateLike(int bno) {
		
		return session.update(NAMESPACE+".groupOnLike",bno);
	}

	@Override
	public List<OnLec> selectByCategory(String category) {

		return session.selectList(NAMESPACE +".selectByCategory", category);
	}

	@Override
	public String selectGroupBnoByLecName(int groupBno) {

		return session.selectOne(NAMESPACE + ".selectGroupBnoByLecName", groupBno);
	}

	@Override
	public List<OnLec> selectByCategoryAll() {
	
		return session.selectList(NAMESPACE +".selectByCategoryAll");
	}

	@Override
	public List<OnLec> selectByKeyword(String keyword) {
		Map<String, String> m = new HashMap<>();
		String key = "%" + keyword + "%";
		m.put("keyword", key);
		return session.selectList(NAMESPACE + ".selectByText",m);
	}

	@Override
	public int updateLikeDelete(int bno) {
	
		return session.update(NAMESPACE+".groupOnLikeDelete",bno);
	}

	@Override
	public GroupOn selectByMyLec(int groupBno) {
		
		return session.selectOne(NAMESPACE + ".selectByMyLec", groupBno);
	}

	@Override
	public int cntUpdate(int bno) {
		
		return session.update(NAMESPACE + ".updateCnt",bno);
	}
	

}
