package edu.job.project.service;

import org.springframework.stereotype.Service;

import edu.job.project.domain.Member;

@Service
public interface MemberService {

	int create(Member member);
	
	Member read(Member member);
	
	int read(String userId);
	
	int readName(String userName);
	
	String readPwd(String userId);
	
	int updatePwd(String password, String userId);
	
	int updateUserName(String userName, String userId);
	
	int updatePhone(String phone, String userId);
	
	Member readId(String userId);
	
}
