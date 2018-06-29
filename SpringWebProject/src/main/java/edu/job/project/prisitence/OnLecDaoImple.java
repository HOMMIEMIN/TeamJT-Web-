package edu.job.project.prisitence;

import java.util.List;

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

}
