package com.spring.practice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.practice.vo.CalendarVO;

public interface CalendarDAO {

	public void calendarInputPost(@Param("vo") CalendarVO vo,@Param("mid") String mid,@Param("name") String name);

	public ArrayList<CalendarVO> calender(@Param("vo") CalendarVO vo);

	public ArrayList<CalendarVO> calenderCon(@Param("vo") CalendarVO vo,@Param("idx") int idx);

	public CalendarVO calenderCon(@Param("idx") int idx);

	public void calenderConPost(@Param("vo") CalendarVO vo);

	public void calDelete(@Param("idx") int idx);

	public ArrayList<CalendarVO> myCalendar(@Param("mid") String mid,@Param("startIndexNum") int startIndexNum,@Param("listNum") int listNum);

	public int totRecCnt(@Param("mid") String part);

}
