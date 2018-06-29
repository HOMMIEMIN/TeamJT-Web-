package edu.job.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		OnLec bnoList = service.readByBno(bno);
		List<OnLec> GroupbnoList = service.readByGroupBno(groupBno);
		Member m = mService.readId(bnoList.getUserId());
		model.addAttribute("bnoList", bnoList);
		model.addAttribute("GroupbnoList", GroupbnoList);
		model.addAttribute("userName", m.getUserName());
		model.addAttribute("lecName", lecName);
		return "video";
	}

}
