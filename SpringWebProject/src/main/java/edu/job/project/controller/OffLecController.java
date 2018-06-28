package edu.job.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import edu.job.project.domain.OffLec;
import edu.job.project.service.FileUploadService;
import edu.job.project.service.OffLecService;

import edu.job.project.util.MapUtil;

@Controller
@RequestMapping(value = "/offline")
public class OffLecController {

	public static final Logger logger = LoggerFactory.getLogger(OffLecController.class);

	@Autowired
	private OffLecService offlecService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private MapUtil maputil;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {

		logger.info(" [list] 호출 ");

		List<OffLec> list = offlecService.read();

		model.addAttribute("offlecList", list);

	}

	// 글작성 페이지로 이동

	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public void register() {
		logger.info("register 글등록 호출");
		
	}
	
	@RequestMapping(value = "/registertest" , method = RequestMethod.GET)
	public void registertest() {
		logger.info("registertest 글등록 호출");
		
	}

	@RequestMapping(value = "/register1", method=RequestMethod.POST)
	public String upload(Model model, 
			
			@RequestParam("title")String title,
			@RequestParam("content")String content,
			@RequestParam("meetingday")String meetingday,
			@RequestParam("maxmember")int maxmember,
			@RequestParam("imgPath") MultipartFile file,
			@RequestParam("lat") String lat,
			@RequestParam("long1") String long1,
			@RequestParam("meetingtime")String meetingtime
			 ){

		
		logger.info("upload 호출:  {}",  file);
		System.out.println("위치 : " + lat + " " + long1);
		
		String url = fileUploadService.restore(file);
		model.addAttribute("url", url);

		logger.info("이미지 url : {} ", url);
		
		String location= lat+","+long1;
		
		String meeting = meetingday+""+meetingtime;
		OffLec offLecture = new OffLec(0,"","",title,content,meeting ,maxmember, null, url , location);
		offlecService.create(offLecture);
		
		
		return "redirect:/offline/list";
	}
	
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
	

}// end Controller
