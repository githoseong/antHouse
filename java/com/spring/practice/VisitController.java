package com.spring.practice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/visit")
public class VisitController {
	
	
	@RequestMapping(value="visit",method=RequestMethod.GET)
	public String adMain() {
		
		
		return "visit/visit";
	}
	
}
