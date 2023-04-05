package com.spring.practice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.practice.page.PageProcess;
import com.spring.practice.page.PageVO;
import com.spring.practice.service.BoardService;
import com.spring.practice.service.MemberService;
import com.spring.practice.vo.BoardReplyVO;
import com.spring.practice.vo.BoardVO;
import com.spring.practice.vo.SignupVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
//	@Autowired
//	AdminService adminService;
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	@Autowired
	PageProcess pageProcess;
	
	
	@RequestMapping(value="adMain",method=RequestMethod.GET)
	public String adMain(Model model) {
		ArrayList<SignupVO> listVO = memberService.adMain();
		BoardVO bVo  = boardService.adMainBoard(listVO.get(0).getMid());
		BoardVO bVo2  = boardService.adMainBoard(listVO.get(1).getMid());
		BoardVO bVo3  = boardService.adMainBoard(listVO.get(2).getMid());
		ArrayList<SignupVO> vos = memberService.adMain8();
		ArrayList<SignupVO> vos2 = memberService.adMain9();
		
		model.addAttribute("listVO",listVO);
		model.addAttribute("bVo",bVo);
		model.addAttribute("bVo2",bVo2);
		model.addAttribute("bVo3",bVo3);
		model.addAttribute("vos",vos);
		model.addAttribute("vos2",vos2);
		
		
		return "admin/adMain";
	}
	
	@RequestMapping(value="adMember",method=RequestMethod.GET)
	public String adMember(Model model,PageVO pVo,
			@RequestParam(name="curPage", defaultValue = "1", required = false) int curPage,
			@RequestParam(name="listNum", defaultValue = "10", required = false) int listNum
			) {
		pVo = pageProcess.totRecCnt(curPage, listNum, "admin", null, null, null);
		
		ArrayList<SignupVO> vos = memberService.adMember(pVo.getStartIndexNum(),listNum);
		
		model.addAttribute("curPage",curPage);
		model.addAttribute("pVo",pVo);
		model.addAttribute("vos",vos);
		return "admin/adMember";
	}
	
	@ResponseBody
	@RequestMapping(value="levelUp",method=RequestMethod.POST)
	public int levelUp(String mid,int level) {
		int data = memberService.levelUp(mid,level);
		return data;
	}
	@ResponseBody
	@RequestMapping(value="levelDown",method=RequestMethod.POST)
	public int levelDown(String mid,int level) {
		int data = memberService.levelDown(mid,level);
		return data;
	}
}
