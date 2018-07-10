package edu.job.project.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.GroupOn;
import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.domain.WaitingOff;
import edu.job.project.prisitence.MemberDao;
import edu.job.project.prisitence.OffLecDao;

@Service
public class OffLecServiceImple implements OffLecService {

	public static final Logger logger = LoggerFactory.getLogger(OffLecService.class);
	
	@Autowired
	private OffLecDao dao;
	@Autowired private MemberDao mDao;
	
	@Override
	public List<OffLec> read() {
		// 게시글 전체 보기 
		return dao.select();
	}

	@Override
	public int create(OffLec offLecture) {
		// 글 작성하기 
		return dao.insert(offLecture);
	}

	@Override
	public int update(OffLec offLecture) {
		// 강의 신청
		return dao.update(offLecture);
	}
	
	// 폴더 만들기 
	@Override
	public int create(GroupOff groupOff) {
		
		return dao.insertGroup(groupOff);
	}

	// 폴더 전체 검색 
	@Override
	public List<GroupOff> readGroup(String userId) {
	
		return dao.selectAllGroup(userId);
	}
	
	@Override
	public GroupOff readGroup(GroupOff off) {
	
		return dao.selectGroup(off);
	}
	
	// 디테일들어가기 
	@Override
	public List<OffLec> read(int bno) {
		
		return dao.selectBno(bno);
	}
	
	@Override
	public int updateFolderImage(OffLec off) {
	
		return dao.updateFolderImage(off);
	}
	
	@Override
	public OffLec readByBno(int bno) {
	
		return dao.selectBnoByOffLec(bno);
	}
	
	@Override
	public List<OffLec> readByGroupBno(int groupBno) {
	
		return dao.selectGroupBnoByOffLec(groupBno);
	}
	
	
	@Override
	public int updateWaiting(OffLec offLec) {

		return dao.update(offLec); 
	}
	
	// 해당 글번호(강의)에 대기자가 있는지 찾기위함
	@Override
	public OffLec readForWaiting(int bno) {
		return dao.select(bno);
	}
	
	@Override
	public int updateWaitingMember(OffLec offLec) {
	
		return mDao.updateOfflec(offLec);
	}
	
	@Override
	public int updateWaitingMember(WaitingOff waitingOff) {
	
		return mDao.updateOfflec(waitingOff);
	}
	
	@Override
	public Member readWaitingMember(String userid) {
	
		return mDao.select(userid);
	}
	
	@Override
	public int updateConfirm(OffLec offLec) {
	
		return dao.updateApply(offLec);
	}
	
	@Override
	public int updateApply(Member member) {
	
		return mDao.updateApplyId(member);
	}
	
	@Override
	public List<OffLec> readByMyLec(Member m) {
	
		List<String> items = new ArrayList<>(Arrays.asList(m.getOffLec().split(",")));		
		List<OffLec> list= new ArrayList<>();
		
		
		if(items.size() != 0) {
		      for(int a=0; a < items.size() ; a++) {
		         OffLec off = dao.selectByMyOffLec(Integer.parseInt(items.get(a)));
		          Member mm = mDao.getId(off.getUserid());
		          logger.info("off.getUserId : {}",off.getUserid());
		          off.setUserid(mm.getUserName());
		          list.add(off);
		       }
		   }
		
		return list;
	}

	@Override
	public List<OffLec> readByCategory(String category) {
		
		return dao.selectByCategory(category);
	}
	
	@Override
	   public int updateCnt(int bno) {

	      return dao.cntUpdate(bno);
	   }
	
	@Override
	public int deleteOffLec(int bno) {
	
		return dao.deleteOffLec(bno);
	}
	
	
	 @Override
	   public String readByLecName(int groupBno) {

	      return dao.selectGroupBnoByLecName(groupBno);
	   }
	
}// end OffLecServiceImple



















