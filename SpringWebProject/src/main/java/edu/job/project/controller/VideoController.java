package edu.job.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;
import edu.job.project.service.MemberService;
import edu.job.project.service.OnLecService;

@Controller
public class VideoController {
	
	@Autowired
	private OnLecService service;
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping(value="/video",method=RequestMethod.GET)
	public void video() {
		
	}
	
	@RequestMapping(value="/videoview", method=RequestMethod.GET)
	public String videoview(int bno, int groupBno, String lecName, Model model) {
		System.out.println("들어옴");
		System.out.println(groupBno);
		OnLec bnoList = service.readByBno(bno);
		List<OnLec> GroupbnoList = service.readByGroupBno(groupBno);
		Member m = mService.readId(bnoList.getUserId());
		model.addAttribute("bnoList", bnoList);
		model.addAttribute("GroupbnoList", GroupbnoList);
		model.addAttribute("userName", m.getUserName());
		model.addAttribute("lecName", lecName);
		System.out.println(lecName);
		if(lecName.equals("")) {
			model.addAttribute("lecName", service.readByLecName(groupBno));
		}
		model.addAttribute("groupBno", groupBno);
		System.out.println("리턴");
		return "video";
	}
	
	@ResponseBody
	@RequestMapping(value="/like", method=RequestMethod.POST)
	public ResponseEntity<String> like(@RequestBody OnLec on){
		System.out.println(on.getGroupBno());
		System.out.println(on.getUserId());
		String result = service.like(on);
		if(result.equals("ok")) {
		int result2 = service.likeUp(on.getGroupBno());
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

}
