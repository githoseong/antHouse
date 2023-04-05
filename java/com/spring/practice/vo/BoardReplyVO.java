package com.spring.practice.vo;

import lombok.Data;

public @Data class BoardReplyVO {

	private int idx;
	private int boardIdx;
	private String mid;
	private String name;
	private String wDate;
	private String content;
	private String good;
	
	private int cnt;
}
