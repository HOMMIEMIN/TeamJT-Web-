package edu.job.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.domain.OnLec;
import edu.job.project.domain.WaitingOff;
import edu.job.project.service.MemberService;
import edu.job.project.service.OffLecService;


@Controller

public class OffLecDetailController {

	public static final Logger logger=LoggerFactory.getLogger(OffLecDetailController.class);
	
	@Autowired
	private OffLecService service;
	@Autowired
	private MemberService mService;
		
	
	// 한개의 특정강좌 보여주기 
	@RequestMapping(value="/offDetail" , method=RequestMethod.GET)
	public void detailLecture(int bno, int groupBno , String lecName , Model model , HttpSession session) {
		logger.info(" bno(한 강의의 글번호) :{} ,groupBno :{}, lecName:{} ",bno,groupBno,lecName);
		OffLec offLec = service.readByBno(bno);
		List<OffLec> groupBnoList = service.readByGroupBno(groupBno);
		
			
		model.addAttribute("bnoList", offLec);
		logger.info("bnoList 의 신청자 목록 : {} ",offLec.getWaitingId());
		String waitingId=offLec.getWaitingId();
		if(waitingId != null) {
		String[] waitingList=waitingId.split(",");
		
		List<String> waitList=new ArrayList<>();	
		
		for(int i=0; i<waitingList.length;i++) {
			logger.info("신청자 목록: {} ", waitingList[i]);
			logger.info("---------------------");
			waitList.add(waitingList[i]);
		}
		logger.info("waitList: {}",waitList);
		model.addAttribute("waitList",waitList);
		model.addAttribute("waitListCount", waitingList.length);
		}
		
			
		String location=offLec.getLocation();
		
		String[] array=location.split(",");
		String lat=array[0];
		String long1=array[1];
		model.addAttribute("lat",lat);
		model.addAttribute("long1",long1);
		String meet = offLec.getMeetingday();
		String[] array2=meet.split(",");
		String mday=array2[0];
		String mtime=array2[1];
		model.addAttribute("mday",mday);
		model.addAttribute("mtime",mtime);
		model.addAttribute("groupBnoList",groupBnoList);	
		model.addAttribute("lecName",lecName);
		logger.info("lecName:{}",lecName);
		if(lecName.equals("")) {
			model.addAttribute("lecName", service.readByLecName(groupBno));
		}
		model.addAttribute("groupBno",groupBno);
		
		String userId=(String) session.getAttribute("userId");
		String userName=(String) session.getAttribute("userName");
		logger.info("[ 현재 로그인 상태 ]userId : {} userName: {} ", userId,userName);
		
		// findWaiter
		String userid=offLec.getUserid();
		Member member = service.readWaitingMember(userid);
		model.addAttribute("memberId",member.getUserId());
		model.addAttribute("memberName",member.getUserName());
		logger.info("[멤버테이블에서 검색한 선생님정보 ] 선생님 이름: {} 아이디: {}",member.getUserId(),member.getUserName());
			
		String name = (String)session.getAttribute("userId");
		logger.info("로그인한  회원  : {}",name);
		// 신청자 찾아서 model 에 넣고 신청버튼 안보이게 할거다~
		if(offLec.getWaitingId() != null) {
			String[] list=offLec.getWaitingId().split(",");
			List<String> list2 = new ArrayList<>(Arrays.asList(list));
			
			if(list2.contains(name)) {
				logger.info("1 대기자 목록에 회원이 있음.");
				model.addAttribute("waitOK",1);	// 대기자 목록에 있을경우  1
			}else {
				logger.info("2 :  목록은 있으나, 대기자 명단에 없음.");
				model.addAttribute("waitOK",2); // 대기자 명단에 회원이 없을경우 2 
			}
		}else {
			logger.info("2 : 대기자 목록이 아예 없음.");
			model.addAttribute("waitOK",2);
		}
		if(offLec.getApplyId() != null) {
			String[] list=offLec.getApplyId().split(",");
			List<String> list2=new ArrayList<>(Arrays.asList(list));
			if(list2.contains(name)) {
				logger.info("3 :  수강회원목록에 있음.");
				model.addAttribute("applyOK",3);	// 수강완료자  목록에 회원이 있을경우  3
			}else {
				logger.info("4 : 신청자 목록은 있으나 로그인한 회원은 없음. ");
				model.addAttribute("applyOK",4); // 없을경우 4
			}
		}else {
			logger.info("4 : 신청자 목록이 아예 없음.");
			model.addAttribute("applyOK",4);
		}
		
		session.setAttribute("uId", offLec.getUserid());
		
		logger.info("  ---  - 리턴(세부페이지 보기 완료) -   ---  ");
		System.out.println("");
	}
	
	
	// 신청버튼
	@ResponseBody
	@RequestMapping(value="/apply" , method=RequestMethod.PUT)
	public ResponseEntity<List<String>> updateWaiting(@RequestBody OffLec offLec1,Model model){
		ResponseEntity<List<String>> entity = null;
		logger.info("해당강의 글번호 :{} , 신청자 아이디:{}",offLec1.getBno(),offLec1.getUserid());
		
		OffLec offLec = service.readForWaiting(offLec1.getBno());	
		String addWaitingId = offLec1.getUserid();
		String list = offLec.getWaitingId();		
		if(list == null) {
			list = offLec1.getUserid();
			offLec.setWaitingId(list);
			service.updateWaiting(offLec);
			List<String> result = new ArrayList<>();
			result.add(list);
			model.addAttribute("waitList",result);
			entity = new ResponseEntity<List<String>>(result, HttpStatus.OK);
			logger.info("entity:{}",entity);
		}else {
			String waitingList = new StringBuffer().append(offLec.getWaitingId()).append(",").append(addWaitingId).toString();
			offLec.setWaitingId(waitingList);
			
			
			service.updateWaiting(offLec);
			
			String[] waitListUpdate=waitingList.split(",");
			List<String> listUpdate=new ArrayList<>();
			for(int i=0; i<waitListUpdate.length;i++) {
				listUpdate.add(waitListUpdate[i]);
			}
			List<String> result=listUpdate;
			model.addAttribute("waitList",result);
			entity = new ResponseEntity<List<String>>(result, HttpStatus.OK);
			logger.info("entity : {}" , entity);
		}
		
		logger.info("---------------------------------------------------------------------------------------------------");
		
		// 멤버 테이블에 신청한 글번호 넣기 
		Member member = service.readWaitingMember(offLec1.getUserid());
		logger.info("{}회원님의 수강신청한 강의목록은 {} 입니다." , member.getUserId(),member.getOffLecWaiting());
		
		// 현재 신청한 강의목록 = offWaiting
		String offWaiting=member.getOffLecWaiting();
		if(offWaiting == null) {
			// 수강신청한 목록이 없을경우 ( OFFLECWAITING 컬럼 ) 
			int resultMember = service.updateWaitingMember(offLec1);
			logger.info(" 업데이트 결과 : {}" , resultMember);
			logger.info("resultMember: {}번의 강의를  {}님이 신청했습니다. ", offLec1.getBno(),offLec1.getUserid());
		}else {
			// 있을 경우 
			// 수강신청하고자 하는 글번호 ( int -> String )
			String addOffWaiting = Integer.toString(offLec1.getBno());
			// 기존의 신청 목록 + 내가 수강신청할 글번호 
			String offWaitingList = new StringBuffer().append(offWaiting).append(",").append(addOffWaiting).toString();
			WaitingOff waitingOff=new WaitingOff(offWaitingList, member.getUserId());
			int resultMember = service.updateWaitingMember(waitingOff);
			logger.info(" 업데이트 결과 : {}" , resultMember);
			logger.info("resultMember: {}님이 신청한 강의들은 {}입니다. ", waitingOff.getUserid(),waitingOff.getBno());
		}
		// 해당 강의(글)의  신청한 대기자 목록 
		OffLec offLecResult=service.readForWaiting(offLec1.getBno());
		logger.info(" {} 글의 대기자 목록은 {} 입니다." , offLecResult.getBno(),offLecResult.getWaitingId());
				
		return entity;
	}
	
	
	
	
	
	
	// 대기자 수락 확정
	@ResponseBody
	@RequestMapping(value="/confirm", method=RequestMethod.POST)
	public ResponseEntity<Integer> confirm(Model model, @RequestBody OffLec offLec) { // 이곳엔 신청자 아이디가 들어옴.
		logger.info("[confirm 메소드 들어옴 offlec테이블 입장]");
		// 해당강의 컬럼 들어가기. 
		OffLec Lec=service.readForWaiting(offLec.getBno());// 글작성한 선생님 의 행
		offLec.setCurmember(Lec.getCurmember());
		// 신청자가 로그인사람  = 즉 선생님이 로그인했으니 선생님아이디가 들어감
		logger.info("신청한 강의: {} 번 ,신청자: {} ,  최대수강인원 : {} , 현재 수강인원 :{}",offLec.getBno(),offLec.getUserid(),offLec.getMaxmember(),offLec.getCurmember()); 
		int max = Lec.getMaxmember();
		int cur = Lec.getCurmember();
		OffLec updateConfirm = new OffLec();
		updateConfirm.setBno(offLec.getBno());
		updateConfirm.setCurmember(offLec.getCurmember());
		if(Lec.getApplyId() == null) { // 현재 신청자가 없을 경우  
			// 듣고 잇는 사람이 없을 경우 
			updateConfirm.setUserid(offLec.getUserid());
		}else {
			// 수강하는 사람이 있을 경우  뒤에 , 붙여서 신청자이름 넣어서 보내기.
			String applyId =new StringBuffer().append(Lec.getApplyId()).append(",").append(offLec.getUserid()).toString();
//			offLec.setUserid(applyId);
//			Lec.setUserid(applyId);
			updateConfirm.setUserid(applyId);
		}		
		
		logger.info("[{}번 강의 ] 현재 수강인원: {} , 현재 수락을 해야 할 학생 :{}",updateConfirm.getBno(),updateConfirm.getCurmember(),updateConfirm.getUserid());
		System.out.println();
		
		int result=0;
		if(max > cur) {
			result=service.updateConfirm(updateConfirm);
				if(result ==1) {
					//  수락시 대기자 명단에서 빼기 
					OffLec Lec2=service.readForWaiting(offLec.getBno());//
					String[] list=Lec2.getWaitingId().split(",");
					List<String> list2=new ArrayList<>(Arrays.asList(list));
					logger.info("size before {}",list2.size());
					list2.remove(offLec.getUserid());
					logger.info("size after {}",list2.size());
	
					StringBuffer sb = new StringBuffer();
					for(int i=0; i<list2.size();i++) {
						if(i == (list2.size() -1 )) {
							sb.append(list2.get(i));
						}else {
							sb.append(list2.get(i)).append(",");
						}
					}
					logger.info("수락한사람 뺀 후 명단:{}",sb.toString());
					Lec.setWaitingId(sb.toString());
					service.updateWaiting(Lec);
				}
		}else if(max == cur) {
			logger.info("신청인원이 꽉 찼습니다. 모집마감을 해주세요 .");
		}
		logger.info("result = {} ",result);
		ResponseEntity<Integer> entity=new ResponseEntity<Integer>(result,HttpStatus.OK);
			
		// 신청자 찾기 ( 멤버테이블 )
		logger.info("offLec.getUserid : {}" , offLec.getUserid());
		Member member = service.readWaitingMember(offLec.getUserid());
		logger.info("member.getOffLec : {}",member.getOffLec());
		String a=member.getOffLec();	// 현재 수강하는 목록
		String addCurList=Integer.toString(offLec.getBno());
		
		
		logger.info("---------------------------------------------------------------------");
		logger.info("[ 멤버테이블에서 수락대기사람삭제 > 확정컬럼으로 이동 ] ");
		if(a == null) {
			member.setOffLec(addCurList);
			member.setUserId(offLec.getUserid());
			service.updateApply(member);
			logger.info("[ {}님의 멤버테이블] 수강하고 있는 오프라인 강의 목록은 {} 입니다.",member.getUserId(),member.getOffLec());
			WaitingOff off=new WaitingOff("",offLec.getUserid());
			service.updateWaitingMember(off);
		}else {
			String curList =new StringBuffer().append(member.getOffLec()).append(",").append(addCurList).toString();
			member.setOffLec(curList);
			service.updateApply(member);
			logger.info("현재 {}님이 수강하고 있는 오프라인 강의 목록은 {} 입니다.",member.getUserId(),member.getOffLec());
			String[] list=member.getOffLecWaiting().split(",");
			List<String> list2=new ArrayList<>(Arrays.asList(list));
			list2.remove(addCurList);
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<list2.size();i++) {
				if(i == (list2.size() -1 )) {
					sb.append(list2.get(i));
				}else {
					sb.append(list2.get(i)).append(",");
				}
			}
			
			WaitingOff off=new WaitingOff(sb.toString(),offLec.getUserid());
			service.updateWaitingMember(off);
			   
		}	
		
		return entity;
		
	}
	
	@RequestMapping(value="/myOffLecView",method=RequestMethod.GET)
	public String myLecView(int bno, String lecName, String userName,int groupBno, Model model, HttpSession session) {
		
		System.out.println("학생페이지에서 특정강의 클릭해서 들어옴");

		
		logger.info(" bno(한 강의의 글번호) :{} ,groupBno :{}, lecName:{} ",bno,groupBno,lecName);
		OffLec offLec = service.readByBno(bno);
		List<OffLec> groupBnoList = service.readByGroupBno(groupBno);
		
			
		model.addAttribute("bnoList", offLec);
		logger.info("bnoList 의 신청자 목록 : {} ",offLec.getWaitingId());
		String waitingId=offLec.getWaitingId();
		if(waitingId != null) {
		String[] waitingList=waitingId.split(",");
		
		List<String> waitList=new ArrayList<>();	
		
		for(int i=0; i<waitingList.length;i++) {
			logger.info("신청자 목록: {} ", waitingList[i]);
			logger.info("---------------------");
			waitList.add(waitingList[i]);
		}
		logger.info("waitList: {}",waitList);
		model.addAttribute("waitList",waitList);
		model.addAttribute("waitListCount", waitingList.length);
		}
		
			
		String location=offLec.getLocation();
		
		String[] array=location.split(",");
		String lat=array[0];
		String long1=array[1];
		model.addAttribute("lat",lat);
		model.addAttribute("long1",long1);
		String meet = offLec.getMeetingday();
		String[] array2=meet.split(",");
		String mday=array2[0];
		String mtime=array2[1];
		model.addAttribute("mday",mday);
		model.addAttribute("mtime",mtime);
		model.addAttribute("groupBnoList",groupBnoList);
		
		model.addAttribute("lecName",service.readByLecName(groupBno));
		logger.info("lecName:{}",lecName);
		if(lecName.equals("")) {
			//TODO:
			model.addAttribute("lecName", service.readByLecName(groupBno));
		}
		model.addAttribute("groupBno",groupBno);
		
		String userId=(String) session.getAttribute("userId");
		String userName1=(String) session.getAttribute("userName");
		logger.info("[ 현재 로그인 상태 ]userId : {} userName: {} ", userId,userName1);
		
		// findWaiter
		String userid=offLec.getUserid();
		Member member = service.readWaitingMember(userid);
		model.addAttribute("memberId",member.getUserId());
		model.addAttribute("memberName",member.getUserName());
		logger.info("[멤버테이블에서 검색한 선생님정보 ] 선생님 이름: {} 아이디: {}",member.getUserId(),member.getUserName());
			
		String name = (String)session.getAttribute("userId");
		logger.info("로그인한  회원  : {}",name);
		// 신청자 찾아서 model 에 넣고 신청버튼 안보이게 할거다~
		if(offLec.getWaitingId() != null) {
			String[] list=offLec.getWaitingId().split(",");
			List<String> list2 = new ArrayList<>(Arrays.asList(list));
			
			if(list2.contains(name)) {
				logger.info("1 대기자 목록에 회원이 있음.");
				model.addAttribute("waitOK",1);	// 대기자 목록에 있을경우  1
			}else {
				logger.info("2 :  목록은 있으나, 대기자 명단에 없음.");
				model.addAttribute("waitOK",2); // 대기자 명단에 회원이 없을경우 2 
			}
		}else {
			logger.info("2 : 대기자 목록이 아예 없음.");
			model.addAttribute("waitOK",2);
		}
		if(offLec.getApplyId() != null) {
			String[] list=offLec.getApplyId().split(",");
			List<String> list2=new ArrayList<>(Arrays.asList(list));
			if(list2.contains(name)) {
				logger.info("3 :  수강회원목록에 있음.");
				model.addAttribute("applyOK",3);	// 수강완료자  목록에 회원이 있을경우  3
			}else {
				logger.info("4 : 신청자 목록은 있으나 로그인한 회원은 없음. ");
				model.addAttribute("applyOK",4); // 없을경우 4
			}
		}else {
			logger.info("4 : 신청자 목록이 아예 없음.");
			model.addAttribute("applyOK",4);
		}
		
		
		logger.info("  ---  - 리턴(나는 학생페이지에서 타고 들어옴 ) -   ---  ");
		System.out.println("");
		
		
		return "offDetail";
	}
	
	

	
	// 모집 취소 하기 
	@RequestMapping(value="offLecDelete", method=RequestMethod.POST)
	public String offLecDelete(Model model,@RequestParam("deletebno")int bno){
		logger.info("삭제할 글번호: {} ",bno );
		int result=service.deleteOffLec(bno);
		logger.info(" 삭제결과 : {}",result);
		
		return "redirect:/mypage";
	}
	
	
	
	
	
	
	
	
	
	
	
}// end OffLecDetailController
