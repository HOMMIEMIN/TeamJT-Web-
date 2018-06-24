package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.job.project.domain.Member;

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

}
