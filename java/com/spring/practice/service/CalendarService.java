package com.spring.practice.service;

import java.util.ArrayList;

import com.spring.practice.vo.CalendarVO;

public interface CalendarService {

	public int calendarInputPost(CalendarVO vo, String mid, String name);

	public ArrayList<CalendarVO> calender(CalendarVO vo);

	public CalendarVO calenderCon(int idx);

	public void calenderConPost(CalendarVO vo);

	public void calDelete(int idx);

	public ArrayList<CalendarVO> myCalendar(String mid, int startIndexNum, int listNum);

}
