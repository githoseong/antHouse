package com.spring.practice.page;

import lombok.Data;

public @Data class PageVO {
	private int listNum; //한 페이지 당 데이터
	private int totalNum; //총 데이터
	private int blockPage;  //1블럭당 페이지 수
	private int totalPage;  //전체 페이지 수
	private int totalBlock;  //전체 블럭 수
	private int curPage;//현재 페이지
	private int blockNum;  //현재 블럭 번호
	private int startPageNum; //블럭당 시작 페이지 번호
	private int lastPageNum; //블럭당 마지막 페이지 번호
	private int startIndexNum; //페이지 첫 글 인덱스 번호 
	private int startNum; //페이지 첫 글 시작 번호
	
	private String part;
} 
