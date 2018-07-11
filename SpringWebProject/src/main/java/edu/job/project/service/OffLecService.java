package edu.job.project.service;

import java.util.List;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.domain.WaitingOff;


public interface OffLecService {

	// CRUD( Create , Read , Update , Delete )
	
	List<OffLec> read();
	
	List<OffLec> read(int start, int end);
	
	int create(OffLec offLecture);
	
	// 대기자 신청
	int update(OffLec offLecture);
	
	// 폴더 만들기 
	int create(GroupOff groupOff);
	
	List<GroupOff> readGroup(String userId);
	
	GroupOff readGroup(GroupOff off);
	
	List<OffLec> read(int bno);
	
	int updateFolderImage(OffLec off);
	
	//하나의 강의 보이게 하는 detail 강의
	OffLec readByBno(int bno);
	
	// 하나의 강의에서 그 강의의 강좌 ( 폴더 ) 리스트를 읽는것. 
	List<OffLec> readByGroupBno(int groupBno);
	
	int updateWaiting(OffLec offLec);
	
	OffLec readForWaiting(int bno);
	
	//멤버테이블 업데이트 
	int updateWaitingMember(OffLec offLec);
	//멤버테이블 업데이트2 ( 추가신청)
	int updateWaitingMember(WaitingOff waitingOff);
	
	Member readWaitingMember(String userid);
	
	// 신청대기자 수락하기.
	int updateConfirm(OffLec offLec);
	
	// 수락완료한 오프라인 강의 목록 넣기  
	int updateApply(Member member);
	
	// 학생페이지 오프라인폴더 보여주기 
	List<OffLec> readByMyLec(Member m);
	
	List<OffLec> readByCategory(String category);
	

	List<OffLec> readByKeyword(String keyword);
	
	List<OffLec> readByCategoryKey(String category, String keyword);

	// ?? 뭐하는지 모르겠음....
	int updateCnt(int bno);
	
	int deleteOffLec(int bno);
	
	String readByLecName(int groupBno);
	
	
}
