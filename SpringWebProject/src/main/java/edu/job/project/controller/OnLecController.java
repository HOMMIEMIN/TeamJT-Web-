package edu.job.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.OnLec;
import edu.job.project.service.OnLecService;

@Controller
@RequestMapping(value="upload")
public class OnLecController {
	
	private static final Logger logger = LoggerFactory.getLogger(OnLecController.class);
	@Autowired
	private OnLecService service;
	
	
	@RequestMapping(value="/addonlec", method=RequestMethod.GET)
	public String upload(int bno, String lecCategory, Model model) {
		System.out.println("업로드 : " + bno);
		model.addAttribute("bno",bno);
		model.addAttribute("lecCategory",lecCategory);
		return "/upload/upload";
	}
	
	@RequestMapping(value="/folder", method=RequestMethod.GET)
	public String folder(HttpSession session, Model model) {
		logger.info("컨트롤러");
		String userId = (String) session.getAttribute("userId");
		List<GroupOn> list = service.readGroup(userId);
		model.addAttribute("groupList",list);
		return "/upload/folder";
	}
	
	@RequestMapping(value="/folderDetail", method=RequestMethod.GET)
	public String folderDetail(int bno, String lecCategory, String lecName, Model model) {
		System.out.println("bnoㅇ : " + bno);
		System.out.println(lecCategory);
		List<OnLec>list = service.read(bno);
		model.addAttribute("onLecList",list);
		model.addAttribute("bno",bno);
		model.addAttribute("lecCategory",lecCategory);
		model.addAttribute("lecName",lecName);
		return "/upload/folderDetail";
	}
	
	@RequestMapping(value="createonlec", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> createOnLec(@RequestBody GroupOn on){
		int result = 0;
		int createResult = service.createGroup(on);
		GroupOn onBno = null;
		if(createResult == 1) {
			onBno = service.readGroup(on);
		}
		
		return new ResponseEntity<Integer>(onBno.getBno(), HttpStatus.OK);
	}
	
	@RequestMapping(value="onLeccreate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> onLeccreate(@RequestBody OnLec on){
		
		int result = service.create(on);
		String re = null;
		if(result == 1) {
			
			int update = service.updateGroupImage(on);
			if(update == 1) {
				re = "ok";
			}
			}
		
		return new ResponseEntity<String>(re, HttpStatus.OK);
	}
	
}
