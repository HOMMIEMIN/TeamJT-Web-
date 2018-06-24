package edu.job.project.service;

import org.springframework.stereotype.Service;

import edu.job.project.domain.Member;

@Service
public interface MemberService {

	int create(Member member);
	
	Member read(Member member);
	
	int read(String userId);
	
	int readName(String userName);
}
