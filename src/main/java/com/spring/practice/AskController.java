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
import com.spring.practice.service.AskService;
import com.spring.practice.vo.AskAnswerVO;
import com.spring.practice.vo.AskVO;

@Controller
@RequestMapping("/ask")
public class AskController {

	@Autowired
	AskService askService;
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="ask",method=RequestMethod.GET)
	public String ask() {
		
		return "ask/ask";
	}
	@RequestMapping(value="ask",method=RequestMethod.POST)
	public String askPost(AskVO vo) {
		int res = 0;
		res = askService.askPost(vo);
		
		if(res == 1) {
			return "redirect:/msg/askSendOk";
		}
		else {
			return "redirect:/msg/askSendNo";
		}
	}
	
	@RequestMapping(value="adAskList",method=RequestMethod.GET)
	public String adAskList(Model model,String part,PageVO pVo,
			@RequestParam(name="curPage", defaultValue = "1", required = false) int curPage,
			@RequestParam(name="listNum", defaultValue = "10", required = false) int listNum) {
		pVo = pageProcess.totRecCnt(curPage, listNum, "ask", part, null, null);
		
		ArrayList<AskVO> vos = askService.adAskList(part,pVo.getStartIndexNum(),listNum);
		
		model.addAttribute("curPage",curPage);
		model.addAttribute("pVo",pVo);
		model.addAttribute("part",part);
		model.addAttribute("vos",vos);
		return "admin/adAskList";
	}
	
	@RequestMapping(value="adAskContent",method=RequestMethod.GET)
	public String adAskContent(int idx,AskVO vo,Model model) {
		vo = askService.adAskContent(idx);
		ArrayList<AskAnswerVO> vos = new ArrayList<AskAnswerVO>(); 
		vos = askService.adAskConReply(idx);
		
		model.addAttribute("vos",vos);
		model.addAttribute("vo",vo);
		return "admin/adAskContent";
	}
	
	@ResponseBody
	@RequestMapping(value="adAskReply",method=RequestMethod.POST)
	public String adAskReply(int answerIdx,String content) {
		askService.adAskReply(answerIdx,content);
		askService.adAskUpdate(answerIdx);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="adAskDel",method=RequestMethod.POST)
	public String adAskDel(int idx) {
		askService.adAskDel(idx);
		return "";
	}
}
