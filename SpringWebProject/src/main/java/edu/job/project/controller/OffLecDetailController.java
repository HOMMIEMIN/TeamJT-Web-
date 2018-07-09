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
import edu.job.project.domain.WaitingOff;

import edu.job.project.service.OffLecService;


@Controller
@RequestMapping(value="/detail")
public class OffLecDetailController {

	public static final Logger logger=LoggerFactory.getLogger(OffLecDetailController.class);
	
	@Autowired
	private OffLecService service;
		
	
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
		logger.info("location : {}" , location);
		String[] array=location.split(",");
		String lat=array[0];
		String long1=array[1];
		logger.info("lat: {} long:{}" , lat , long1);
		model.addAttribute("lat",lat);
		model.addAttribute("long1",long1);
		
		String meet = offLec.getMeetingday();
		logger.info("meet : {}" , meet);
		String[] array2=meet.split(",");
		String mday=array2[0];
		String mtime=array2[1];
		logger.info("mday:{} mtime:{}",mday,mtime);
		model.addAttribute("mday",mday);
		model.addAttribute("mtime",mtime);
		model.addAttribute("groupBnoList",groupBnoList);	
		model.addAttribute("lecName",lecName);
		logger.info("lecName:{}",lecName);
		if(lecName.equals("")) {
			
		}
		model.addAttribute("groupBno",groupBno);
		
		String userId=(String) session.getAttribute("userId");
		String userName=(String) session.getAttribute("userName");
		logger.info("userId : {} userName: {} ", userId,userName);
		
		Member member = service.readWaitingMember(offLec.getUserid());
		model.addAttribute("memberId",member.getUserId());
		model.addAttribute("memberName",member.getUserName());
		logger.info("선생님 이름: {} 아이디: {}",member.getUserId(),member.getUserName());
				
		
		
		logger.info("    -리턴-     ");
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
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/confirm", method=RequestMethod.POST)
	public ResponseEntity<Integer> confirm(Model model, @RequestBody OffLec offLec) {
		// 업데이트후 다시 한번 읽기 
		OffLec Lec=service.readForWaiting(offLec.getBno());
		offLec.setCurmember(Lec.getCurmember());
		logger.info("신청한 강의: {} 번 ,신청자: {} ,  최대수강인원 : {} , 현재 수강인원 :{}",offLec.getBno(),offLec.getUserid(),offLec.getMaxmember(),offLec.getCurmember());
		int max = Lec.getMaxmember();
		int cur = Lec.getCurmember();
		if(Lec.getApplyId() == null) {
			// 없는거 맞음 
		}else {
			String applyId =new StringBuffer().append(Lec.getApplyId()).append(",").append(offLec.getUserid()).toString();
			offLec.setUserid(applyId);
		}		
		logger.info("현재 수강인원: {} , 현재 수강학생 :{}",offLec.getCurmember(),offLec.getUserid());
		
		
		
		
		
		int result=0;
		if(max > cur) {
			result=service.updateConfirm(offLec);
				if(result ==1) {
					//  수락시 대기자 명단에서 빼기 
					String[] list=Lec.getWaitingId().split(",");
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
					logger.info("x :{}",sb.toString());
					Lec.setWaitingId(sb.toString());
					service.updateWaiting(Lec);
				}
		}else if(max == cur) {
			logger.info("신청인원이 꽉 찼습니다. 모집마감을 해주세요 .");
		}
		logger.info("result = {} ",result);
		ResponseEntity<Integer> entity=new ResponseEntity<Integer>(result,HttpStatus.OK);
			
		// 신청자 찾기
		Member member = service.readWaitingMember(offLec.getUserid());
		
		String a=member.getOffLec();	// 해당 회원의 수강신청대기중인 목록
		String addCurList=Integer.toString(offLec.getBno());
		
		if(a == null) {
			member.setOffLec(addCurList);
			member.setUserId(offLec.getUserid());
			service.updateApply(member);
			logger.info("현재 {}님이 수강하고 있는 오프라인 강의 목록은 {} 입니다.",member.getUserId(),member.getOffLec());
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// end OffLecDetailController
