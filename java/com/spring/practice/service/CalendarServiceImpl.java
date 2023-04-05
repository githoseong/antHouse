package com.spring.practice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.practice.dao.CalendarDAO;
import com.spring.practice.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired 
	CalendarDAO calendarDAO;
	
	
	@Override
	public int calendarInputPost(CalendarVO vo, String mid, String name) {
		int res = 0;
		calendarDAO.calendarInputPost(vo,mid,name);
		res = 1;
		return res;
	}


	@Override
	public ArrayList<CalendarVO> calender(CalendarVO vo) {
		return calendarDAO.calender(vo);
	}


	@Override
	public CalendarVO calenderCon(int idx) {
		return calendarDAO.calenderCon(idx);
	}


	@Override
	public void calenderConPost(CalendarVO vo) {
		calendarDAO.calenderConPost(vo);
	}


	@Override
	public void calDelete(int idx) {
		calendarDAO.calDelete(idx);
	}


	@Override
	public ArrayList<CalendarVO> myCalendar(String mid, int startIndexNum, int listNum) {
		return calendarDAO.myCalendar(mid,startIndexNum,listNum);
	}



}
