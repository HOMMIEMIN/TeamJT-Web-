package edu.job.project.controller;

import java.util.List;

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

import edu.job.project.domain.Message;
import edu.job.project.messagepageutil.MessagePageLinkMaker;
import edu.job.project.messagepageutil.NowPageAndShowOnepageMessageNo;
import edu.job.project.service.MessageService;






@Controller
@RequestMapping(value = "/message" )
public class MessageController {	
	
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired private MessageService messageService;
	
	class MessageDto { //entity를 쓰기위한 전용 클래스
		private List<Message> list;
		private MessagePageLinkMaker maker;
		
		public MessageDto(List<Message> list, MessagePageLinkMaker maker) {
			this.list = list;
			this.maker = maker;
		}

		public List<Message> getList() {
			return list;
		}

		public void setList(List<Message> list) {
			this.list = list;
		}

		public MessagePageLinkMaker getMaker() {
			return maker;
		}

		public void setMaker(MessagePageLinkMaker maker) {
			this.maker = maker;
		}
		
	}// end EntityPrivate 내무 클래스 (entity)에 두개의 클래스를 담기위한 클래스!
	
	
 // 내가 받은 모든 쪽지 검색 
	   @RequestMapping(value = "/getmessege" , method = RequestMethod.GET)
	   public ResponseEntity<MessageDto> readGetMessegebyId(String userId, Integer nowShowPage, Integer onePageMessageNo) {
	      System.out.println("메세지컨트롤러에서 all get의 userId ="+userId);
	      logger.info("readMessegebyId(userId: {})", userId);
	      
	      NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo =new NowPageAndShowOnepageMessageNo();
	      
			if( nowShowPage != null) {
				//criteria.setPage(page);
				nowPageAndShowOnepageMessageNo.setNowShowPage(nowShowPage);
			}
			if(onePageMessageNo != null) {
				nowPageAndShowOnepageMessageNo.setOnePageMessageNo(onePageMessageNo);
			}
	      List<Message> list = messageService.getRead(userId, nowPageAndShowOnepageMessageNo);
	      // 페이지 링크를 보기위한 클래스  (ex: < 1 2 3 4 5 6 7 >)
	      MessagePageLinkMaker maker = new MessagePageLinkMaker();
	      maker.setNowpageandshowonepagemessageno(nowPageAndShowOnepageMessageNo); // 현재 몇번째 페이지 보고있느냐
	      maker.setTotalPageConut(messageService.getNumOfRecords(userId));
	      maker.setPageLinkData();
	      System.out.println("시작 : " + messageService.getNumOfRecords(userId));
	      System.out.println("끝 : " + maker.getTotalPageConut());
	      MessageDto dto = new MessageDto(list, maker);
	      ResponseEntity<MessageDto> entity =  new ResponseEntity<MessageDto>(dto,HttpStatus.OK);
	      return entity;
	   }// end readMessegebyId()

	   
	   
	   // 내가 보낸 모든 쪽지 검색 
	   @RequestMapping(value = "/sendmessage" , method = RequestMethod.GET)
	   public ResponseEntity<MessageDto> readSendMessegebyId(String userId, Integer nowShowPage, Integer onePageMessageNo) {

		      NowPageAndShowOnepageMessageNo nowPageAndShowOnepageMessageNo =new NowPageAndShowOnepageMessageNo();
		      
				if( nowShowPage != null) {
					//criteria.setPage(page);
					nowPageAndShowOnepageMessageNo.setNowShowPage(nowShowPage);
				}
				if(onePageMessageNo != null) {
					nowPageAndShowOnepageMessageNo.setOnePageMessageNo(onePageMessageNo);
				}
				List<Message> list = messageService.sendRead(userId, nowPageAndShowOnepageMessageNo);
		      // 페이지 링크를 보기위한 클래스  (ex: < 1 2 3 4 5 6 7 >)
		      MessagePageLinkMaker maker = new MessagePageLinkMaker();
		      maker.setNowpageandshowonepagemessageno(nowPageAndShowOnepageMessageNo); // 현재 몇번째 페이지 보고있느냐
		      maker.setTotalPageConut(messageService.getSendNumOfRecords(userId));
		      maker.setPageLinkData();
		      System.out.println("시작 : " + messageService.getSendNumOfRecords(userId));
		      System.out.println("끝 : " + maker.getTotalPageConut());
		      MessageDto dto = new MessageDto(list, maker);
		      ResponseEntity<MessageDto> entity =  new ResponseEntity<MessageDto>(dto,HttpStatus.OK);
		      return entity;

		      
		 /*		      
		   System.out.println("메세지컨트롤러에서 all get의 userId ="+userId);
		   logger.info("readMessegebyId(userId: {})", userId);
		   List<Message> list = messageService.sendRead(userId);
		   ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list,HttpStatus.OK);
		   
		   return entity;*/
		      
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
	   
	   
	   
	   //@@@@@@@@@ 호민이형꺼 살리기!!
	    @RequestMapping(value="/count", method=RequestMethod.POST)
	      public ResponseEntity<Integer> readCount(@RequestBody Message message){
	         System.out.println("메시지 소켓: " + message.getYourId());
	         int result = messageService.readCount(message);
	         
	         return new ResponseEntity<Integer>(result, HttpStatus.OK);
	    }
	   
	   
	   
	   
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
	   
	   
	   
	
}// end class MessegeController
