package edu.job.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
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
	
	
	@RequestMapping(value= "/login", method = RequestMethod.GET)
	public void login(String target, Model model) {
		System.out.println("타켓 !!!들어와라!"+target);
		logger.info("login(target: {}) 호출", target);
		model.addAttribute("targetUrl", target);
	}// end login()

	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestBody Member member, Model model, HttpSession session) {
		
		System.out.println(member.getUserId());
		Member member1 = service.read(member);
		// loginResult가 null인지 아닌지를 체크해서 
		// null이 아니면 session에 로그인 정보를 저장하고 target으로 redirect를 해주면 되는데 이것을 여기서 사용하지 않고 interceptor을 사용 하겠다 !
		// interceptor을 사용하기 위해서 여기 loginResult를 모델에다가 넣어 버리겠습니다.
		// -> 콘트롤러에서 직접 당당하지 않고, loginInterceptor에서 담당하도록
		model.addAttribute("loginResult", member1);
		System.out.println("들어옴 로그인");
		
		
		// 여기는 home.jsp에서 A.jax에게 ok를 넘겨 주기 위함
		String result = null;
		if(member1 != null) {
			session.setAttribute("userId", member.getUserId());
			session.setAttribute("userName", member1.getUserName());
			result = "ok";
		}
		System.out.println(result);
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value="/checkid", method=RequestMethod.POST)  //
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestBody Member member){
		
		String result = null;
		
		int result1 = service.read(member.getUserId());
		if(result1 == 1) {
			result = "ok";
		}
	
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST) // 아이디 중복체크
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
	
	
	@RequestMapping(value= "logout", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> logout(@RequestBody Member member, HttpSession session) {
		session.removeAttribute("userId");
		session.invalidate();
		String result = "ok";
		
		return new ResponseEntity<>(result, HttpStatus.OK);

	}// end logout()
	

}
