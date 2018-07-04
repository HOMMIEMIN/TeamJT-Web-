package edu.job.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		logger.info(" bno :{} ,groupBno :{}, lecName:{} ",bno,groupBno,lecName);
		OffLec offLec = service.readByBno(bno);
		List<OffLec> groupBnoList = service.readByGroupBno(groupBno);
		Member m = mService.readId(offLec.getUserid());
		model.addAttribute("bnoList", offLec);
		String location=offLec.getLocation();
		logger.info("location : {}" , location);
		String[] array=location.split(",");
		String lat=array[0];
		String long1=array[1];
		logger.info("lat: {} long:{}" , lat , long1);
		model.addAttribute("lat",lat);
		model.addAttribute("long1",long1);
		
		model.addAttribute("groupBnoList",groupBnoList);
//		model.addAttribute("username" , m.getUserName());
		model.addAttribute("lecName",lecName);
//		logger.info("{},{}",offLec.getUserid(),m.getUserName());
		logger.info("lecName:{}",lecName);
		if(lecName.equals("")) {
			
		}
		model.addAttribute("groupBno",groupBno);
		logger.info("    -리턴-     ");
		
		
		
		
		
	}
	
}// end OffLecDetailController
