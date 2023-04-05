package com.spring.practice.service;

import java.util.ArrayList;

import com.spring.practice.vo.AskAnswerVO;
import com.spring.practice.vo.AskVO;

public interface AskService {

	public int askPost(AskVO vo);

	public ArrayList<AskVO> adAskList(String part, int startIndexNum, int listNum);

	public AskVO adAskContent(int idx);

	public void adAskReply(int answerIdx, String content);

	public ArrayList<AskAnswerVO> adAskConReply(int idx);

	public void adAskUpdate(int answerIdx);

	public ArrayList<AskVO> myAsk(String mid,int startIndexNum, int listNum);

	public void myAskDel(int idx);

	public void adAskDel(int idx);

	
}
