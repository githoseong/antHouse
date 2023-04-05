package com.spring.practice.vo;

import lombok.Data;

public @Data class AskVO {

	private int idx;
	private String mid;
	private String name;
	private String title;
	private String content;
	private String askDate;
	private String answer;
	private String part;
	private String del;
}
