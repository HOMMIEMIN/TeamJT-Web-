package edu.job.project.prisitence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String getPwd(String userId) {
		
		return session.selectOne(NAMESPACE + ".getPwd", userId);
	}
	
	@Override
	public int updateUserName(String userName, String userId) {
		Map<String, String> userInfo = new HashMap<String, String>();
		System.out.println("이름 : " + userName);
		System.out.println("아이디 : " + userId);
		userInfo.put("userName", userName);
		userInfo.put("userId", userId);
		return session.update(NAMESPACE +".updateUserName", userInfo);
	}
	
	@Override
	public int updatePhone(String phone, String userId) {
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("phone", phone);
		userInfo.put("userId", userId);
		return session.update(NAMESPACE +".updatePhone", userInfo);
	}
	
	@Override
	public int updatePwd(String password, String userId) {
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("password", password);
		userInfo.put("userId", userId);
		return session.update(NAMESPACE + ".updatePwd", userInfo);
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
	
}
