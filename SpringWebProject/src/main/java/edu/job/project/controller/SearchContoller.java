package edu.job.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.job.project.domain.OnLec;
import edu.job.project.service.OnLecService;

@Controller
public class SearchContoller {
	
	@Autowired
	private OnLecService service;
		
	
	@RequestMapping(value="/searchClick", method=RequestMethod.GET)
	public String searchClick(String category, String lecType, Model model) {
		System.out.println(category);
		System.out.println(lecType);
		if(category.equals("All Category")) {
			List<OnLec> list = service.readByCategoryAll();
			model.addAttribute("list",list);
		}else {
			List<OnLec> list = service.readByCategory(category);
			model.addAttribute("list",list);
			
		}
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		return "search";
	}
	
	@RequestMapping(value="searchBtn", method=RequestMethod.GET)
	public String searchButton(String category, String lecType, String searchText, Model model) {
		model.addAttribute("category",category);
		model.addAttribute("lecType",lecType);	
		List<OnLec> list = service.readByKeyword(searchText);
		model.addAttribute("list",list);
		model.addAttribute("searchText",searchText);
		return "search";	
	}
	
	
	
}
