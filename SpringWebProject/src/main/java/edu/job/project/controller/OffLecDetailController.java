package edu.job.project.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.service.MemberService;
import edu.job.project.service.OffLecService;


@Controller
@RequestMapping(value="/detail")
public class OffLecDetailController {

	public static final Logger logger=LoggerFactory.getLogger(OffLecDetailController.class);
	
	@Autowired
	private OffLecService service;
	@Autowired
	private MemberService mService;
	
	
	
	
	// 한개의 특정강좌 보여주기 
	@RequestMapping(value="/offDetail" , method=RequestMethod.GET)
	public void detailLecture(int bno, int groupBno , String lecName , Model model) {
		logger.info(" bno(한 강의의 글번호) :{} ,groupBno :{}, lecName:{} ",bno,groupBno,lecName);
		OffLec offLec = service.readByBno(bno);
		List<OffLec> groupBnoList = service.readByGroupBno(groupBno);
		
		model.addAttribute("bnoList", offLec);
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
		
		// 로그인 한 사람의 아이디
//		Member m = mService.readId("");
//		model.addAttribute("username" , m.getUserName());
		model.addAttribute("lecName",lecName);
//		logger.info("{},{}",offLec.getUserid(),m.getUserName());
		logger.info("lecName:{}",lecName);
		if(lecName.equals("")) {
			
		}
		model.addAttribute("groupBno",groupBno);
		logger.info("    -리턴-     ");
	}
	
	// 신청버튼
	@ResponseBody
	@RequestMapping(value="/apply" , method=RequestMethod.PUT)
	public ResponseEntity<Integer> updateWaiting(@RequestBody OffLec offLec1){
		
		logger.info("bno 해당게시글 :{} , 신청자 아이디:{}",offLec1.getBno(),offLec1.getUserid());
		
		OffLec offLec = service.readForWaiting(offLec1.getBno());
		ResponseEntity<Integer> entity = null;
		System.out.println(offLec.getBno());
		String addWaitingId = offLec1.getUserid();
		String list = offLec.getWaitingId();
		
		if(list == null) {
			list = offLec1.getUserid();
			offLec.setWaitingId(list);
			int result = service.updateWaiting(offLec);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}else {
			String waitingList = new StringBuffer().append(offLec.getWaitingId()).append(",").append(addWaitingId).toString();
			offLec.setWaitingId(waitingList);
			int result = service.updateWaiting(offLec);			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
			logger.info("entity : {}" , entity);
		}	
		return entity;
	}
	
	
	
}// end OffLecDetailController
