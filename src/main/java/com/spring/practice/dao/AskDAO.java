package com.spring.practice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.practice.vo.AskAnswerVO;
import com.spring.practice.vo.AskVO;

public interface AskDAO {

	public void askPost(@Param("vo") AskVO vo);

	public ArrayList<AskVO> adAskList(@Param("part") String part,@Param("startIndexNum") int startIndexNum,@Param("listNum") int listNum);

	public int totRecCnt(@Param("part") String part);

	public AskVO adAskContent(@Param("idx") int idx);

	public void adAskReply(@Param("answerIdx") int answerIdx,@Param("content") String content);

	public ArrayList<AskAnswerVO> adAskConReply(@Param("idx") int idx);

	public void adAskUpdate(@Param("answerIdx") int answerIdx);

	public ArrayList<AskVO> myAsk(@Param("mid") String mid,@Param("startIndexNum") int startIndexNum,@Param("listNum") int listNum);

	public int totRecCnt2(@Param("mid") String part);

	public void myAskDel(@Param("idx") int idx);

	public void adAskDel(@Param("idx") int idx);

}
