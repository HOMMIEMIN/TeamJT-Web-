package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.domain.OnLec;
import edu.job.project.domain.WaitingOff;

@Repository
public class MemberDaoImple implements MemberDao {
	
	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "edu.job.project.mappers.MemberMapper";
	
	@Override
	public int insert(Member member) {
	
		return session.insert(NAMESPACE + ".insertMember", member);
	}

	@Override
	public Member checkId(Member member) {
		Map<String, String> check = new HashMap<String, String>();
		System.out.println(member.getUserId());
		check.put("userId", member.getUserId());
		check.put("password", member.getPassword());
		return session.selectOne(NAMESPACE + ".login", check);
	}

	@Override
	public int checkId(String userId) {
		
		return session.selectOne(NAMESPACE + ".checkid", userId);
	}

	@Override
	public int checkName(String userName) {
		
		return session.selectOne(NAMESPACE + ".namecheck", userName);
	}

	@Override
	public Member getId(String userId) {
		
		return session.selectOne(NAMESPACE + ".getId", userId);
	}

	@Override
	public int updateOnlec(Member m) {
		
		return session.update(NAMESPACE +".updateOnlec", m);
	}

	@Override
	public int updateOfflec(OffLec offLec) {
	
		return session.update(NAMESPACE+".updateOffLec",offLec);
	}
	
	@Override
	public int updateOfflec(WaitingOff waitingOff) {
	
		return session.update(NAMESPACE+".updateOffLec",waitingOff);
	}
	
	@Override
	public Member select(String userid) {
		
		return session.selectOne(NAMESPACE+".findWaiter" ,userid );
	}

	@Override
	public int updateApplyId(Member member) {
	
		return session.update(NAMESPACE+".updateApplyId", member);
	}

	@Override
	public int updateImage(Member m) {

		return session.update(NAMESPACE + ".updateImage",m);
	}
	
}
