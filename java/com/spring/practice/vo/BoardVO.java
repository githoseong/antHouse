package com.spring.practice.vo;

import lombok.Data;

public @Data class BoardVO {

	private int idx;
	private String title;
	private String content;
	private String writeDate;
	private String readNum;
	private String good;
	private String bad;
	private String mid;
	private String name;
	
	private int boardCnt;
	private int boardreplyCnt;
}
