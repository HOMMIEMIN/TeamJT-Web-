package edu.job.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.job.project.domain.GroupOff;
import edu.job.project.domain.GroupOn;
import edu.job.project.domain.Member;
import edu.job.project.domain.OffLec;
import edu.job.project.service.FileUploadService;
import edu.job.project.service.MemberService;
import edu.job.project.service.OffLecService;

import edu.job.project.util.MapUtil;

@Controller
@RequestMapping(value = "/offline")
public class OffLecController {

   public static final Logger logger = LoggerFactory.getLogger(OffLecController.class);

   @Autowired
   private OffLecService offlecService;
   @Autowired
   private MemberService mService;
   @Autowired
   private FileUploadService fileUploadService;
   @Autowired
   private MapUtil maputil;

   // 글목록 
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void list(Model model) {
      logger.info(" [list] 호출 ");
      List<OffLec> list = offlecService.read();
      model.addAttribute("offlecList", list);
   }

   // 글작성 페이지로 이동
   @RequestMapping(value = "/register" , method = RequestMethod.GET)
   public void register(Model model , int bno, String lecCategory, String lecName) {
      logger.info("register 글등록 호출");
      Date date = new Date();

      SimpleDateFormat sdf1=new SimpleDateFormat("yyyy년 MM월 dd일 ");
      SimpleDateFormat sdf2=new SimpleDateFormat("HH시mm분");
      String formattedDate1 = sdf1.format(date);
      String formattedDate2 = sdf2.format(date);
      model.addAttribute("serverTime1", formattedDate1 );
      model.addAttribute("serverTime2", formattedDate2 );
      System.out.println("upLoad groupBno : " + bno);
      model.addAttribute("bno",bno);
      model.addAttribute("lecCategory",lecCategory);
      model.addAttribute("lecName",lecName);
      System.out.println("lecName 폴더이름 : "+lecName);
      System.out.println("cateGory 카테고리 : "+lecCategory);
      
   }
   
   // 글등록 ( oncreate )
   @RequestMapping(value = "/register1", method=RequestMethod.POST)
   public String upload(Model model,
         @RequestParam("title")String title,
         @RequestParam("content")String content,
         @RequestParam("meetingday")String meetingday,
         @RequestParam("maxmember")int maxmember,
         @RequestParam("imgPath") MultipartFile file,
         @RequestParam("lat") String lat,
         @RequestParam("long1") String long1,
         @RequestParam("meetingtime")String meetingtime,
         @RequestParam("groupBno")int groupBno,
         @RequestParam("userId")String userid,
         @RequestParam("lecCategory")String category 
          ){

      logger.info("upload 호출:  {}",  file);
      System.out.println("위치 : " + lat + " " + long1);
      
      String url = fileUploadService.restore(file);
      model.addAttribute("url", url);

      logger.info("이미지 url : {} ", url);
      
      String location= lat+","+long1;
      
      String meeting = meetingday+","+meetingtime;
      
      OffLec offLecture = new OffLec(0,userid,category,title,content,meeting ,maxmember,0, null, url , location , groupBno);
      int result = offlecService.create(offLecture);
      
//      if(result ==1 ) {
//         offlecService.updateFolderImage(offLecture);
//      }
      return "redirect:/mypage";
      
   }
   
   
   // 지도 위치 받기 
   @RequestMapping(value="/register" , method = RequestMethod.POST , produces= {"application/json"})
   public @ResponseBody Map<String, Object> GeocoderService(@RequestBody final OffLec offLecture){
      Map<String , Object> retVal = new HashMap<String , Object>();
      
      logger.info("offLecture.getLocation : {} " , offLecture.getLocation());
      
      // 지오코딩을 하는 서비스 호출
      Float[] coords = maputil.geoCoding(offLecture);
      
      logger.info("coords[0] : {} , coords[1]: {} ", coords[0],coords[1]);
      // 반환된 좌표값 채우는거
      retVal.put("id", "success");
      retVal.put("latitude", ""+coords[0]);
      retVal.put("longitude",coords[1]);
      
      logger.info("retVal : {}" , retVal);
      return retVal;
   }
   
   // 마이페이지의 오프라인 수강관리 볼더 보이기. 
   @RequestMapping(value="/offFolder", method=RequestMethod.GET)
   public String folder(HttpSession session, Model model) {
      logger.info("컨트롤러 오프라인 수강관리");
      String userId = (String) session.getAttribute("userId");
      List<GroupOff> list = offlecService.readGroup(userId);
      model.addAttribute("groupList",list);
      return "/offline/offFolder";
   }
   
   //TODO: 폴더 만들기 완료 
   @RequestMapping(value="createOffFolder", method = RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<Integer> createOffFolder(@RequestBody GroupOff groupOff){
      
      int createResult = offlecService.create(groupOff);
      GroupOff offBno=null;
      if(createResult == 1) {
         offBno = offlecService.readGroup(groupOff);
      }
      
      return new ResponseEntity<Integer>(offBno.getBno(), HttpStatus.OK);
   }
   
   
   // 한개의 강좌 들어갔을때 그 강좌의 강의목록 보이기 
   @RequestMapping(value="/offFolderDetail",method=RequestMethod.GET)
   public String offFolderDetail(int bno , String lecCategory, String lecName, Model model) {
      logger.info("bno : {}" , bno);
      logger.info(lecCategory);
      List<OffLec> list = offlecService.read(bno);
      model.addAttribute("offLecList",list);
      model.addAttribute("bno",bno);
      model.addAttribute("lecCategory",lecCategory);
      model.addAttribute("lecName",lecName);
            
      return "/offline/offFolderDetail";
   }
   
   // 마이페이지 (mypage) 에서 학생탭의 오프라인강좌 보여주기.
   @RequestMapping(value="/myOffLec", method=RequestMethod.GET)
   public String myOffLec(HttpSession session,Model model) {
	   String myId=(String)session.getAttribute("userId");
	   logger.info("로그인한 아이디 :{}" , myId);
	   Member m =mService.readId(myId);
	   logger.info("m.getOffLec: {}" , m.getOffLec());
	   if(m.getOffLec() != null) {
		   List<OffLec> list = offlecService.readByMyLec(m);
		   if(list.size() != 0 || list != null) {
		         model.addAttribute("list", list);
		      }
	   }else {
		   logger.info("듣고 있는 오프라인강의가 없습니다.");
	   }
	   
	   
	   
	   
	   return "/offline/myOffLec";
   }
   
   @RequestMapping(value="/yourOffLec", method=RequestMethod.GET)
   public String yourOffLec(String userId, String userName, Model model) {
      List<GroupOff> list = offlecService.readGroup(userId);
      if(list.size() != 0 || list != null) {
         model.addAttribute("list", list);
         model.addAttribute("userName", userName);
      }
      return "/offline/myOffLec";
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}// end Controller