package edu.job.project.prisitence;

import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.domain.OnLec;
import edu.job.project.domain.WaitingOff;


public interface MemberDao {
	
	int insert(Member member);
	
	Member checkId(Member member);

	int checkId(String userId);
	
	int checkName(String userName);
	
	Member getId(String userId);
	
	int updateOnlec(Member m);
	
	int updateOfflec(OffLec offLec);
	
	int updateOfflec(WaitingOff waitingOff);

	// 로그인한 회원이 신청한 오프라인강의가 있는지 찾기 
	Member select(String userid);
	
	int updateApplyId(Member member);
}
