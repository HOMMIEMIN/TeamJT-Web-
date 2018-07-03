package edu.job.project.prisitence;

import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;


public interface MemberDao {
	
	int insert(Member member);
	
	Member checkId(Member member);
	
	int checkId(String userId);
	
	int checkName(String userName);
	
	Member getId(String userId);
	
	int updateOnlec(Member m);

	
}
