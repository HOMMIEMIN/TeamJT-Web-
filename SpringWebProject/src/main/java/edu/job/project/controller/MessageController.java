package edu.job.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.job.project.domain.Message;
import edu.job.project.service.MessageService;




@Controller
@RequestMapping(value = "/message" )
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	
	@RequestMapping(value = "/all" ,// /all/{bno} {bno}는 주소줄에 있는 PathVariable이라고 부르고 매겨변수로 생각하면 된다
			method = RequestMethod.GET)
	public ResponseEntity<List<Message>> readMessegebyId(String userId) {
		// @PathVariable: 요청 주소에 포함된 변수(${userId})를 
		// 콘트롤러 메소드의 매개변수로 주입하는 어노테이션
		System.out.println("메세지컨트롤러에서 all get의 userId ="+userId);
		logger.info("readMessegebyId(userId: {})", userId);
		List<Message> list = messageService.read(userId);
		ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list,HttpStatus.OK);
		
		return entity;
	}// end readRepliesByBno()

}// end class MessegeController
