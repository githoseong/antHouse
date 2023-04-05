package com.spring.practice.vo;

import lombok.Data;

public @Data  class SignupVO {

	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String mail;
	private String tel;
	private int level;
	private String del;
	private int todayCnt;
	private int totalCnt;
	private String startDate;
	private String lastDate;
	private String photo;

	private int todaySum;
	private int totalSum;
	private int weekCnt;
	private int todayMax;
	

}
