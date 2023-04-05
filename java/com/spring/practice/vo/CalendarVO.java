package com.spring.practice.vo;

import lombok.Data;

public @Data class CalendarVO {
	private int idx;
	private String mid;
	private String name;
	private String wDate;
	private String content;
	private String title;
	private String myDate;
	
	
	
	private int year;
	private int	month;
	private int	week;
	private int	day;
	private int	monthNum;
}
