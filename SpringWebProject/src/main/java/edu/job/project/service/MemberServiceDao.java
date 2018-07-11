package edu.job.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.Member;
import edu.job.project.prisitence.MemberDao;

@Service
public class MemberServiceDao implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public int create(Member member) {

		return dao.insert(member);
	}

	@Override
	public Member read(Member member) {

		return dao.checkId(member);
	}

	@Override
	public int read(String userId) {
	
		return dao.checkId(userId);
	}
	
	@Override
	public int readName(String userName) {

		return dao.checkName(userName);
	}
	
	@Override
	public int updateUserName(String userName, String userId) {
		
		return dao.updateUserName(userName, userId);
	}
	
	@Override
	public int updatePhone(String phone, String userId) {
		return dao.updatePhone(phone, userId);
	}
	
	@Override
	public int updatePwd(String password, String userId) {
		return dao.updatePwd(password, userId);
	}

	@Override
	public Member readId(String userId) {
		
		return dao.getId(userId);
	}
	
	@Override
	public String readPwd(String userId) {
		return dao.getPwd(userId);
	}

	@Override
	public int updateImage(Member m) {
		
		return dao.updateImage(m);
	}

}
