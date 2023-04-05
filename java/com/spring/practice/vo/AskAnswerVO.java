package com.spring.practice.vo;

import lombok.Data;

public @Data class AskAnswerVO {

	private int idx;
	private int answerIdx;
	private String mid;
	private String content;
	private String answerDate;
}
