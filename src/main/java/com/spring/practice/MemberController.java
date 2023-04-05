package com.spring.practice;

import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.practice.page.PageProcess;
import com.spring.practice.page.PageVO;
import com.spring.practice.service.AskService;
import com.spring.practice.service.BoardService;
import com.spring.practice.service.CalendarService;
import com.spring.practice.service.MemberService;
import com.spring.practice.vo.AskAnswerVO;
import com.spring.practice.vo.AskVO;
import com.spring.practice.vo.BoardVO;
import com.spring.practice.vo.CalendarVO;
import com.spring.practice.vo.SignupVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	@Autowired
	CalendarService calendarService;
	@Autowired
	PageProcess pageProcess;
	@Autowired
	AskService askService; 	
	@RequestMapping(value="/login",method=RequestMethod.GET ) 
	public String loginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		
		return "member/login"; 
	}
	@RequestMapping(value="/login",method=RequestMethod.POST ) 
	public String loginPost(SignupVO vo,HttpSession session,Model model,
			HttpServletResponse response,HttpServletRequest request,
			@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck
			) throws UnknownHostException {
		
		vo = memberService.loginCheck(vo);
		
		if(vo == null) {
			return "redirect:/msg/loginNO";
		}
		else {
			if(idCheck.equals("on")) {
				Cookie cookie = new Cookie("cMid", vo.getMid());
				cookie.setMaxAge(60*60*24*7);		// 쿠키의 만료시간을 7일로 정함(단위:초)
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);		// 기존에 저장된 현재 mid값을 삭제한다.
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			memberService.loginUpdate(vo);
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLevel", vo.getLevel());
			model.addAttribute("mid",vo.getMid());
			session.setAttribute("sPhoto",vo.getPhoto());
			return "redirect:/msg/loginOK";
		}
			
	
		
	}
	@RequestMapping(value="/signup",method=RequestMethod.GET ) 
	public String signupGet() {
		
		return "member/signup"; 
		
	}
	@RequestMapping(value="/signup",method=RequestMethod.POST ) 
	public String signupPost(SignupVO vo,String mail3, String tel4,MultipartFile file1) {
		int res = 0;
		if(memberService.idCheck(vo.getMid()) != null) {
			return "redirect:/msg/signupNO";
		}
		else {
			res = memberService.signupOk(vo,file1);
			if(res == 1) {
				return "redirect:/msg/signupOk";
			}
			else {
				return "redirect:/msg/signupNO2";
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/signupIdCheck",method=RequestMethod.POST ) 
	public String signupIdCheckPost(String mid) {
		String res  = "0";
		SignupVO vo = memberService.signupIdCheck(mid);
		if(vo != null) {
			res = "1";
		}	
			return res;
	}
	
	@RequestMapping(value="/main2",method=RequestMethod.GET ) 
	public String main2Get(Model model) {
		ArrayList<BoardVO> vos = boardService.homeBoardList();
		model.addAttribute("vos", vos);
		return "main/main2"; 
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET ) 
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "main/main2"; 
	}
	
	@RequestMapping(value="/myPage",method=RequestMethod.GET ) 
	public String myPage(Model model,HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		SignupVO vo = memberService.idCheck(mid);
		
		
		model.addAttribute("vo",vo);
		return "member/myPage"; 
		
	}
	@RequestMapping(value="/myPageUpdate",method=RequestMethod.GET ) 
	public String myPageUpdate(Model model,HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		SignupVO vo = memberService.idCheck(mid);
		
		model.addAttribute("vo",vo);
		return "member/myPageUpdate"; 
		
	}
	
	@RequestMapping(value="/myPageUpdate",method=RequestMethod.POST) 
	public String myPageUpdatePost(SignupVO vo,MultipartFile file1,HttpSession session) {
		int res = memberService.myPageUpdatePost(vo,file1);
		
		if(res == 1) {
			session.setAttribute("sPhoto", vo.getPhoto());
			return "redirect:/msg/myPageUpdateOk";
		}
		else {
			return "redirect:/msg/myPageUpdateNo";
		}
	}
	
	@RequestMapping(value="/myCalendar",method=RequestMethod.GET ) 
	public String myCalendar(Model model,HttpSession session,PageVO pVo,
			@RequestParam(name="curPage", defaultValue = "1", required = false) int curPage,
			@RequestParam(name="listNum", defaultValue = "12", required = false) int listNum) {
		String mid = (String)session.getAttribute("sMid");
		pVo = pageProcess.totRecCnt(curPage, listNum, "member", mid, "", "");
		
		ArrayList<CalendarVO> vos = calendarService.myCalendar(mid,pVo.getStartIndexNum(),listNum);
		
		model.addAttribute("vos",vos);
		model.addAttribute("curPage",curPage);
		model.addAttribute("pVo",pVo);
		return "member/myCalendar"; 
		
	}
	
	@RequestMapping(value="/myAsk", method=RequestMethod.GET)
	public String myAsk(HttpSession session,Model model,PageVO pVo,
			@RequestParam(name="curPage", defaultValue = "1", required = false) int curPage,
			@RequestParam(name="listNum", defaultValue = "10", required = false) int listNum) {
		String mid = session.getAttribute("sMid") == null? "" : (String)session.getAttribute("sMid");
		pVo = pageProcess.totRecCnt(curPage, listNum, "memberAsk", mid, null, null);
		ArrayList<AskVO> vos = askService.myAsk(mid,pVo.getStartIndexNum(),listNum);
		
		model.addAttribute("curPage",curPage);
		model.addAttribute("pVo",pVo);
		model.addAttribute("vos",vos);
		return "member/myAsk";
	}
	
	@RequestMapping(value="/myAskContent", method=RequestMethod.GET)
	public String myAsk(int idx,AskVO vo,Model model) {
		vo = askService.adAskContent(idx);
		ArrayList<AskAnswerVO> vos = new ArrayList<AskAnswerVO>(); 
		vos = askService.adAskConReply(idx);
		
		model.addAttribute("vos",vos);
		model.addAttribute("vo",vo);
		return "member/myAskContent";
	}
	@RequestMapping(value="/myAskDel",method=RequestMethod.GET ) 
	public String myAskDel(int idx) {
		askService.myAskDel(idx);
		
		return "redirect:/msg/myAskDel"; 
		
	}
}
