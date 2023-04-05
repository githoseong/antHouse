package com.spring.practice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.practice.service.BoardService;
import com.spring.practice.service.HomeService;
import com.spring.practice.vo.BoardVO;


@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	BoardService boardService; 
	
	@RequestMapping(value = {"/","/h"}, method = RequestMethod.GET)
	public String home(Model model ) {
		ArrayList<BoardVO> vos = boardService.homeBoardList();
		model.addAttribute("vos", vos);
		return "main/main2";
	}
	
}
