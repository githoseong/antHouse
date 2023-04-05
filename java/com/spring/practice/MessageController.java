package com.spring.practice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value="/msg/{msgFlag}",method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag,Model model,
			@RequestParam(value="mid", defaultValue = "", required=false) String mid
			) {
		if(msgFlag.equals("signupOk")) {
			model.addAttribute("msg","회원가입이 완료 되었습니다.");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("signupNO")) {
			model.addAttribute("msg","중복된 아이디가 있습니다.");
			model.addAttribute("url","member/signup");
		}
		else if(msgFlag.equals("signupNO2")) {
			model.addAttribute("msg","회원가입 실패. 시스템 오류");
			model.addAttribute("url","member/signup");
		}
		else if(msgFlag.equals("loginNO")) {
			model.addAttribute("msg","아이디 또는 비밀번호가 틀립니다.");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("loginOK")) {
			model.addAttribute("msg",mid+"님 개미굴 입장");
			model.addAttribute("url","member/main2");
		}
		else if(msgFlag.equals("boInputOk")) {
			model.addAttribute("msg","글이 게시 되었습니다.");
			model.addAttribute("url","board/board");
		}
		else if(msgFlag.equals("boardUpdateOk")) {
			model.addAttribute("msg","수정이 완료 되었습니다.");
			model.addAttribute("url","board/board");
		}
		else if(msgFlag.equals("boardDel")) {
			model.addAttribute("msg","삭제가 완료 되었습니다.");
			model.addAttribute("url","board/board");
		}
		else if(msgFlag.equals("boardNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요.");
			model.addAttribute("url","board/board");
		}
		else if(msgFlag.equals("myPageUpdateOk")) {
			model.addAttribute("msg","회원 정보가 수정 되었습니다.");
			model.addAttribute("url","member/myPage");
		}
		else if(msgFlag.equals("myPageUpdateNo")) {
			model.addAttribute("msg","회원 정보 수정 오류.<br/> 문의 바랍니다.");
			model.addAttribute("url","member/myPage");
		}
		else if(msgFlag.equals("calendarInputOk")) {
			model.addAttribute("msg","일정을 등록 하였습니다.");
			model.addAttribute("url","calendar/calendar");
		}
		else if(msgFlag.equals("calendarInputNo")) {
			model.addAttribute("msg","일정 등록 오류.<br/>문의 바랍니다.");
			model.addAttribute("url","calendar/calendar");
		}
		else if(msgFlag.equals("calendarUpdateOk")) {
			model.addAttribute("msg","일정 내용이 수정 되었습니다.");
			model.addAttribute("url","calendar/calendar");
		}
		else if(msgFlag.equals("calendarDelOk")) {
			model.addAttribute("msg","일정이 삭제 되었습니다..");
			model.addAttribute("url","calendar/calendar");
		}
		else if(msgFlag.equals("askNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요.");
			model.addAttribute("url","member/main2");
		}
		else if(msgFlag.equals("askSendOk")) {
			model.addAttribute("msg","문의 및 신고 완료");
			model.addAttribute("url","member/main2");
		}
		else if(msgFlag.equals("askSendNo")) {
			model.addAttribute("msg","전송 에러.<br/>관리자에게 연락 바람");
			model.addAttribute("url","member/main2");
		}
		else if(msgFlag.equals("myAskDel")) {
			model.addAttribute("msg","문의를 삭제 하였습니다.");
			model.addAttribute("url","member/myAsk");
		}
		
		
		return "include/message";
	}
}
