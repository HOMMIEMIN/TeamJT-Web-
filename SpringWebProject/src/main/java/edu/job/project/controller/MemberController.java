package edu.job.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.job.project.domain.Member;
import edu.job.project.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String create(Member member, RedirectAttributes att) {
		int result = service.create(member);
		if(result == 1) {
		att.addFlashAttribute("registerResult","OK");
		}else {
			att.addFlashAttribute("registerResult","fail");	
		}
		return "redirect:/";
	}
	

	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestBody Member member, HttpSession session) {
		
		System.out.println(member.getUserId());
		Member member1 = service.read(member);
		String result = null;
		if(member1 != null) {
			session.setAttribute("userId", member.getUserId());
			session.setAttribute("userName", member1.getUserName());
			result = "ok";
		}
		System.out.println(result);
		return new ResponseEntity<String>(result,HttpStatus.OK);
	
	}
	
	@RequestMapping(value="/checkid", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestBody Member member){
		
		String result = null;
		
		int result1 = service.read(member.getUserId());
		if(result1 == 1) {
			result = "ok";
		}
	
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> checkName(@RequestBody Member member){
		
		String result = null;
		
		int result1 = service.readName(member.getUserName());
		if(result1 == 1) {
			result = "ok";
		}
		System.out.println("result : " + result);
		System.out.println("result1 : " + result1);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

}
