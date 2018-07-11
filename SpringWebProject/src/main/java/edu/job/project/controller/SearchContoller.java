package edu.job.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.OffLec;
import edu.job.project.domain.OnLec;
import edu.job.project.service.OffLecService;
import edu.job.project.service.OnLecService;

@Controller
public class SearchContoller {
	
	@Autowired
	private OnLecService service;
	
	@Autowired
	private OffLecService offService;
		
	
	@RequestMapping(value="/searchClick", method=RequestMethod.GET)
	public String searchClick(Integer start, Integer end, String category, String lecType, Model model) {
		System.out.println(category);
		System.out.println(lecType);
		if(start == null) {
			start = 1;
			end = 12;
			}
		if(lecType.equals("Online")) {
			if(category.equals("All Category")) {
				
				List<OnLec> list = service.readByCategoryAll(start, end);
				model.addAttribute("online",list);
			}else {
				
				List<OnLec> list = service.readByCategory(category, start, end);
				model.addAttribute("online",list);				
			}
		}else {
				if(category.equals("All Category")) {
				
				List<OffLec> list = offService.read();
				model.addAttribute("offline",list);
			}else {
				
				List<OffLec> list = offService.readByCategory(category);
				model.addAttribute("offline",list);				
			}
		}
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		return "search";
	}
	
	@RequestMapping(value="searchText", method=RequestMethod.GET)
	public String searchText(String category, String lecType, String searchText, Model model) {
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		List<OnLec> list = service.readByKeyword(searchText);
		model.addAttribute("online",list);
		model.addAttribute("keyword",searchText);
		return "search";	
	}
	
	
	
	@RequestMapping(value="searchBtn", method=RequestMethod.GET)
	public String searchButton(String category, String lecType, String searchText, Model model) {
		if(lecType.equals("Online")) {
			if(category.equals("All Category")) {
				model.addAttribute("category",category);
				model.addAttribute("lecType",lecType);	
				List<OnLec> list = service.readByKeyword(searchText);
				model.addAttribute("online",list);
				model.addAttribute("keyword",searchText);
			}else {
				model.addAttribute("category",category);
				model.addAttribute("lecType",lecType);	
				List<OnLec> list = service.readByCateKey(category, searchText);
				model.addAttribute("online",list);
				model.addAttribute("keyword",searchText);
			}
			
		}else {
			if(category.equals("All Category")) {
				model.addAttribute("category",category);
				model.addAttribute("lecType",lecType);	
				List<OffLec> list = offService.readByKeyword(searchText);
				model.addAttribute("offline",list);
				model.addAttribute("keyword",searchText);
			}else {
				model.addAttribute("category",category);
				model.addAttribute("lecType",lecType);	
				List<OffLec> list = offService.readByCategoryKey(category, searchText);
				model.addAttribute("offline",list);
				model.addAttribute("keyword",searchText);
			}
			System.out.println("OffLec 리턴");
			
		}
		
		return "search";	
	}
	
	@RequestMapping(value="/searchScroll", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<OnLec>> searchScroll(Integer start, Integer end, String category, String lecType, Model model) {
		System.out.println(category);
		System.out.println(lecType);
		List<OnLec> list1 = null;
		if(lecType.equals("Online")) {
			if(category.equals("All Category")) {
				list1 = service.readByCategoryAll(start, end);
				model.addAttribute("online",list1);
			}else {
				list1 = service.readByCategory(category, start, end);
				model.addAttribute("online",list1);				
			}
		}
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		return new ResponseEntity<>(list1, HttpStatus.OK);
	}
	
	@RequestMapping(value="/offSearchScroll", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<OffLec>> offSearchScroll(Integer start, Integer end, String category, String lecType, Model model) {
		System.out.println(category);
		System.out.println(lecType);
		List<OffLec> list2 = null;
		if(lecType.equals("Online")) {
		
		}else {
			if(category.equals("All Category")) {
			list2 = offService.read();
				model.addAttribute("offline",list2);
			}else {
			list2 = offService.readByCategory(category);
				model.addAttribute("offline",list2);
				
			}
		}
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		return new ResponseEntity<>(list2, HttpStatus.OK);
	}
	
	
}
