package edu.job.project.prisitence;

import edu.job.project.domain.Member;


public interface MemberDao {
	
	int insert(Member member);
	
	Member checkId(Member member);
	
	int checkId(String userId);
	
	int checkName(String userName);

	
}
