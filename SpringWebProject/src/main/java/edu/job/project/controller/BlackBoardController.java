package edu.job.project.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import edu.job.project.domain.BlackBoard;
import edu.job.project.service.BlackBoardService;


@Controller
public class BlackBoardController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BlackBoardService service;
	
	@RequestMapping(value = "/editPage", method = RequestMethod.POST)
	public String done(Locale locale, Model model, BlackBoard blackboard) {
		logger.info(blackboard.getBno() + "김성준!");
		model.addAttribute("board", blackboard);
		
		return "blackboard";
				
	}
	
	
	
	@RequestMapping(value = "/blackboard", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "blackboard";
	}
	
	
	@RequestMapping(value = "/saveBlackBoard", method = RequestMethod.POST)
	public String save(Locale locale, Model model, String title, String json, HttpSession session) {
		String id = (String)session.getAttribute("userId");
		BlackBoard blackboard = new BlackBoard(id,title,json,0);
		int result = service.insertById(blackboard);
		logger.info("result: " + result);
		
		return "redirect:mypage?type=c";
	}
	
	@RequestMapping(value = "/toBlackBoard", method = RequestMethod.GET)
	public String move(Locale locale, Model model, String title, String json, HttpSession session) {
		String id = (String)session.getAttribute("userId");
		BlackBoard blackboard = new BlackBoard(id,title,json,0);
		
		
		return "redirect:mypage?type=c";
	}
	
	@RequestMapping(value = "/loadBlackBoard", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<BlackBoard>> load(HttpSession session) {
		List<BlackBoard> list = service.selectById((String)(session.getAttribute("userId")));
		ResponseEntity<List<BlackBoard>> entity = new ResponseEntity<List<BlackBoard>>(list, HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping(value = "/loadBlackBoardurs", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<BlackBoard>> loadurs(HttpSession session) {
		List<BlackBoard> list = service.selectById((String)(session.getAttribute("uId")));
		logger.info("uid:{}",(String)(session.getAttribute("uId")));
		ResponseEntity<List<BlackBoard>> entity = new ResponseEntity<List<BlackBoard>>(list, HttpStatus.OK);
		return entity;
	}

	
	
	@RequestMapping(value = "/updateBlackBoard", method = RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<Integer> update(HttpSession session,@RequestBody BlackBoard blackboard) {
		int result = service.update(blackboard);
		logger.info("bno : {}",blackboard.getBno());
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	}	
	
	@RequestMapping(value = "/deleteBlackBoard", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<Integer> delete(HttpSession session,@RequestBody BlackBoard blackboard) {
		
		int result = service.delete(blackboard);
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	}	

}
