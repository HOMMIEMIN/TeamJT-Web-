package edu.job.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.job.project.domain.Message;
import edu.job.project.service.MessageService;





@Controller
@RequestMapping(value = "/message" )
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	
	
	 // 내가 받은 모든 쪽지 검색 
	   @RequestMapping(value = "/all" , method = RequestMethod.GET)
	   public ResponseEntity<List<Message>> readGetMessegebyId(String userId) {
	      System.out.println("메세지컨트롤러에서 all get의 userId ="+userId);
	      logger.info("readMessegebyId(userId: {})", userId);
	      List<Message> list = messageService.getRead(userId);
	      ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list,HttpStatus.OK);
	          
	      
	      return entity;
	   }// end readMessegebyId()

	
	
	   // (받은) 쪽지 자세히 보기.
	   @RequestMapping(value= "/getDetail", method = RequestMethod.POST)
	   public ResponseEntity<Message> getDetailMessage(@RequestBody Message m ) {
	      // @RequestBody: post, put, delete 등의 요청 방식에서
	      // request body에 포함된 json 문자열을 객체로 변환해서
	      // 콘트롤러 메소드의 매개변수로 전달하는 어노테이션
	      System.out.println(m.getMno());
	      int mno = m.getMno();
//	      logger.info("detail 로거");
	      Message result = messageService.getDetail(mno);
//	      Message result = null;
	      ResponseEntity<Message> entity = new ResponseEntity<Message>(result, HttpStatus.OK);
	      
	      return entity;
	   }// end getDetailMessage()

	   
	
	   // (보낸) 쪽지 자세히 보기.
	   @RequestMapping(value= "/sendDetail", method = RequestMethod.POST)
	   public ResponseEntity<Message> sendDetailMessage(@RequestBody Message m) {
	      System.out.println("sendDetail컨트롤러 들어옴");
	      System.out.println(m.getMno());
	      int mno = m.getMno();
	      Message result = messageService.sendDetail(mno);
	      ResponseEntity<Message> entity = new ResponseEntity<Message>(result, HttpStatus.OK);
	      
	      return entity;
	   }// end sendDetailMessage()
	   
	
	   // 내가 받은 모든 쪽지 검색 
	   @RequestMapping(value = "/sendmessage" ,// /all/{bno} {bno}는 주소줄에 있는 PathVariable이라고 부르고 매겨변수로 생각하면 된다
	         method = RequestMethod.GET)
	   public ResponseEntity<List<Message>> readSendMessegebyId(String userId) {
	      // @PathVariable: 요청 주소에 포함된 변수(${userId})를 
	      // 콘트롤러 메소드의 매개변수로 주입하는 어노테이션
	      System.out.println("메세지컨트롤러에서 all get의 userId ="+userId);
	      logger.info("readMessegebyId(userId: {})", userId);
	      List<Message> list = messageService.sendRead(userId);
	      ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list,HttpStatus.OK);
	      
	      return entity;
	   }// end readMessegebyId()
	   
	
	
	   
	   // 쪽지 보내기
	   @RequestMapping(value = "/sendMassage" , method = RequestMethod.POST)
	   public ResponseEntity<Integer> createMessage(@RequestBody Message message) {
	      // @RequestBody: post, put, delete 등의 요청 방식에서
	      // request body에 포함된 json 문자열을 객체로 변환해서
	      // 콘트롤러 메소드의 매개변수로 전달하는 어노테이션
	      logger.info("보내기버튼 클릭시 controller까지post 들어옴");
	      System.out.println("보내기버튼 클릭시 controller까지 들어옴");
	      logger.info("sendMassage Post({}, {}, {}) 호출", 
	            message.getUserId(),message.getYourId(),message.getMcontent());
	      int result = messageService.create(message);
	      ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
	      
	      return entity;
	   }// end createReply()
	   
	   
	   // 쪽지 삭제
	   @RequestMapping(value = "/delete" , method = RequestMethod.POST)
	   public ResponseEntity<Integer> deleteMessage(@RequestBody int mno) {

	      logger.info("삭제버튼 클릭시 controller까지post 들어옴");
	      System.out.println("삭제버튼 클릭시 controller까지 들어옴");
	      logger.info("post mno:({}) 호출", mno);
	      int result = messageService.delete(mno);
	      ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
	      
	      return entity;
	   }// end createReply()
	   
	   @RequestMapping(value="/count", method=RequestMethod.POST)
	   public ResponseEntity<Integer> readCount(@RequestBody Message message){
		   System.out.println("메시지 소켓: " + message.getYourId());
		   int result = messageService.readCount(message);
		   
		   return new ResponseEntity<Integer>(result, HttpStatus.OK);
	   }
	
}// end class MessegeController
