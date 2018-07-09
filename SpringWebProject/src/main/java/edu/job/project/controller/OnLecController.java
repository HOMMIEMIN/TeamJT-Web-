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
import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;
import edu.job.project.prisitence.MemberDao;
import edu.job.project.service.MemberService;
import edu.job.project.service.OnLecService;

@Controller
@RequestMapping(value="upload")
public class OnLecController {
   
   private static final Logger logger = LoggerFactory.getLogger(OnLecController.class);
   @Autowired
   private OnLecService service;
   

   // 글작성 페이지로 이동 

   @Autowired
   private MemberService mService;
   
   

   @RequestMapping(value="/addonlec", method=RequestMethod.GET)
   public String upload(int bno, String lecCategory, String lecName, Model model) {
      System.out.println("업로드 : " + bno);
      model.addAttribute("bno",bno);
      model.addAttribute("lecCategory",lecCategory);
      model.addAttribute("lecName",lecName);
      System.out.println("lecName : "+lecName);
      System.out.println("카테고리 : "+lecCategory);
      return "/upload/upload";
   }
   
   // 마이페이지에서 온라인 수강관리 파트 보이기.  루팡완료
   @RequestMapping(value="/folder", method=RequestMethod.GET)
   public String folder(HttpSession session, Model model) {
      logger.info("컨트롤러 온라인 수강관리");
      String userId = (String) session.getAttribute("userId");
      List<GroupOn> list = service.readGroup(userId);
      model.addAttribute("groupList",list);
      return "/upload/folder";
   }
   
   // 루팡완료 
   @RequestMapping(value="/folderDetail", method=RequestMethod.GET)
   public String folderDetail(int bno, String lecCategory, String lecName, Model model) {
      System.out.println("bno : " + bno);
      System.out.println(lecCategory);
      List<OnLec>list = service.read(bno);
      model.addAttribute("onLecList",list);
      model.addAttribute("bno",bno);
      model.addAttribute("lecCategory",lecCategory);
      model.addAttribute("lecName",lecName);
      return "/upload/folderDetail";
   }
   
   //create Folder 루팡완료  //createOffFolder
   @RequestMapping(value="createonlec", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<Integer> createOnLec(@RequestBody GroupOn on){
      
      int createResult = service.createGroup(on);
      GroupOn onBno = null;
      if(createResult == 1) {
         onBno = service.readGroup(on);
      }
      
      return new ResponseEntity<Integer>(onBno.getBno(), HttpStatus.OK);
   }
   
   // 글등록
   @RequestMapping(value="onLeccreate", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<String> onLeccreate(@RequestBody OnLec on){
      System.out.println("그룹 : " + on.getGroupBno());
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
   
   @RequestMapping(value="/myLec", method=RequestMethod.GET)
   public String myLec(HttpSession session, Model model) {
      String myID = (String)session.getAttribute("userId");
      Member m = mService.readId(myID);
      logger.info("로그인한 아이디:{} ,듣고 있는 강의:{}", myID, m.getOnLec());
      List<GroupOn> list = service.readByMyLec(m);
      if(list.size() != 0 || list != null) {
         model.addAttribute("list", list);
      }
      return "/upload/myLec";
   }
   
   @RequestMapping(value="/yourLec", method=RequestMethod.GET)
   public String yourLec(String userId, String userName, Model model) {
      List<GroupOn> list = service.readGroup(userId);
      if(list.size() != 0 || list != null) {
         model.addAttribute("list", list);
         model.addAttribute("userName", userName);
      }
      return "/upload/myLec";
   }
   
   
   
}