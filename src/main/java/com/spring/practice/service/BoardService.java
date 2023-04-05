package com.spring.practice.service;

import java.util.ArrayList;

import com.spring.practice.vo.BoardVO;
import com.spring.practice.vo.BoardReplyVO;

public interface BoardService {

	public void boardInput(BoardVO vo);

	public ArrayList<BoardVO> boardList(int startIndexNum, int listNum, String search, String boardSearch, String flag);

	public BoardVO boardContent(int idx);

	public void boardUpdateSet(int idx, BoardVO vo);

	public void imgCheck(String content, String content2);

	public void boardDel(int idx, BoardVO vo);

	public void boardGood(int idx);

	public void boardBad(int idx);

	public void boardReply(BoardReplyVO vo);

	public ArrayList<BoardReplyVO> boardReplyArr(int idx);

	public void boardReplyUpdate(BoardReplyVO vo);

	public void boardReplyDel(int idx);

	public void setReadNum(int idx);

	public void boardReGood(int idx);

	public ArrayList<BoardVO> homeBoardList();

	public BoardVO adMainBoard(String mid);






	
}
