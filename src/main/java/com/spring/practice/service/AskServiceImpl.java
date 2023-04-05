package com.spring.practice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.practice.dao.AskDAO;
import com.spring.practice.vo.AskAnswerVO;
import com.spring.practice.vo.AskVO;

@Service
public class AskServiceImpl implements AskService {

	@Autowired
	AskDAO askDAO;

	@Override
	public int askPost(AskVO vo) {
		int res = 0;
		askDAO.askPost(vo);
		res = 1;
		return res;
	}

	@Override
	public ArrayList<AskVO> adAskList(String part, int startIndexNum, int listNum) {
		return askDAO.adAskList(part,startIndexNum,listNum);
	}

	@Override
	public AskVO adAskContent(int idx) {
		return askDAO.adAskContent(idx);
	}

	@Override
	public void adAskReply(int answerIdx, String content) {
		askDAO.adAskReply(answerIdx,content);
	}

	@Override
	public ArrayList<AskAnswerVO> adAskConReply(int idx) {
		return askDAO.adAskConReply(idx);
	}

	@Override
	public void adAskUpdate(int answerIdx) {
		askDAO.adAskUpdate(answerIdx);
	}

	@Override
	public ArrayList<AskVO> myAsk(String mid,int startIndexNum, int listNum) {
		return askDAO.myAsk(mid,startIndexNum,listNum);
	}

	@Override
	public void myAskDel(int idx) {
		askDAO.myAskDel(idx);
	}

	@Override
	public void adAskDel(int idx) {
		askDAO.adAskDel(idx);
	}
}
