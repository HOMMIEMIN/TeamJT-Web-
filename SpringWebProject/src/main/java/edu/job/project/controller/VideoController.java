package edu.job.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.job.project.domain.OnLec;

@Controller
public class VideoController {
	
	
	@RequestMapping(value="/video",method=RequestMethod.GET)
	public void video() {
		
	}
	
	@RequestMapping(value="/videoview", method=RequestMethod.GET)
	public String videoview(OnLec on, Model model) {
		model.addAttribute("onLec", on);
		System.out.println("카테고리 비디오 : " + on.getVideoPath());
		return "video";
	}

}
