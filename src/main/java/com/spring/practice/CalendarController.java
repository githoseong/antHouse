package com.spring.practice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.practice.service.CalendarService;
import com.spring.practice.vo.CalendarVO;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	CalendarService calendarService;
	
	
	@RequestMapping(value="calendar",method=RequestMethod.GET)
	public String calender(Model model,CalendarVO vo) throws JsonProcessingException {
		ArrayList<CalendarVO> vos = calendarService.calender(vo);
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("vos", mapper.writeValueAsString(vos));
		return "calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping(value="calendar",method=RequestMethod.POST , produces="application/json;charset=UTF-8")
	public String calenderPost(Model model,String year,String month,CalendarVO vo,HttpServletResponse response ) throws JsonProcessingException {
		ArrayList<CalendarVO> vos2 = calendarService.calender(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		String[] spYear = new String[vos2.size()];
		String[] spMonth = new String[vos2.size()];
		String[] spDay = new String[vos2.size()];
		for(int i=0; i<vos2.size(); i++) {
			vos2.get(i).getMyDate().substring(8,9);
			spYear[i] = vos2.get(i).getMyDate().substring(0,4);
			spMonth[i] = (vos2.get(i).getMyDate().substring(5,7));
			spDay[i] =  (vos2.get(i).getMyDate().substring(8,10));
			if(spMonth[i].substring(0,1).indexOf("0") != -1 ) {
				spMonth[i] = (vos2.get(i).getMyDate().substring(6,7));
			}
			if(spDay[i].substring(0,1).indexOf("0") != -1 ) {
				spDay[i] =  (vos2.get(i).getMyDate().substring(9,10));
			}
		}
		map.put("spYear", spYear);
		map.put("spMonth", spMonth);
		map.put("spDay", spDay);
		int year2 = year == null ? 0 : Integer.parseInt(year);
		int month2 = year == null ? 0 : Integer.parseInt(month);
		int day = 0, week = 0; 
		int[] monthNum = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		ArrayList<CalendarVO> vos = new ArrayList<CalendarVO>();
		
		if(year2%4 == 0 && year2%100 != 0 || year2%400 == 0) { //윤년
			monthNum[1] = 29; } 
    else {
    	monthNum[1] = 28;
    }	
		 // 01년 1월 1일부터
    day = (year2-1)*365 + (year2-1)/4 - (year2-1)/100 + (year2-1)/400;
    for(int i=0;i<month2-1;i++) {
     day += monthNum[i];  
    }
    week = (day%7) + 1; // 구하고자 하는 달의 시작일(1일)의 요일
    vo.setWeek(week);
    vo.setYear(year2);
    vo.setMonth(month2);
    for(int i=1;i<=monthNum[month2-1];i++) {
      week++;  
      vos.add(vo);
    }
    map.put("vos", vos);
    map.put("vos2", vos2);
    
    
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(map);
	}
	@RequestMapping(value="calendarInput",method=RequestMethod.GET)
	public String calendarInput() {
		
		return "calendar/calendarInput";
	}
	@RequestMapping(value="calendarInput",method=RequestMethod.POST)
	public String calendarInputPost(CalendarVO vo,HttpSession session) {
		String mid = session.getAttribute("sMid") == null? "" : (String)session.getAttribute("sMid");
		String name = session.getAttribute("sName") == null? "" : (String)session.getAttribute("sName");
		
		int res = 0;
		res = calendarService.calendarInputPost(vo,mid,name);
		
		if(res == 1) {
			return "redirect:/msg/calendarInputOk";
		}
		else {
			return "redirect:/msg/calendarInputNo";
		}
	}
	
	@RequestMapping(value="calendarCon",method=RequestMethod.GET)
	public String calenderCon(Model model,CalendarVO vo,int idx,int flag) {
		vo = calendarService.calenderCon(idx);
		
		model.addAttribute("flag",flag);
		model.addAttribute("vo",vo);
		return "calendar/calendarCon";
	}
	@RequestMapping(value="calUpdate",method=RequestMethod.GET)
	public String calUpdate(Model model,CalendarVO vo,int idx,int flag) {
		vo = calendarService.calenderCon(idx);
		
		
		model.addAttribute("flag",flag);
		model.addAttribute("vo",vo);
		return "calendar/calUpdate";
	}
	
	@RequestMapping(value="calUpdate", method=RequestMethod.POST)
	public String calUpdatePost(CalendarVO vo) {
		calendarService.calenderConPost(vo);
		
 		return "redirect:/msg/calendarUpdateOk";
	}
	@RequestMapping(value="calDelete",method=RequestMethod.GET)
	public String calDelete(int idx) {
		calendarService.calDelete(idx);
		
		return "redirect:/msg/calendarDelOk";
	}
}
