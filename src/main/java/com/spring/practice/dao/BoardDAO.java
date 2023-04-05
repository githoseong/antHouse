package com.spring.practice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.practice.vo.BoardVO;
import com.spring.practice.vo.BoardReplyVO;

public interface BoardDAO {


	public void boardInput(@Param("vo") BoardVO vo);
	
	public ArrayList<BoardVO> boardList(@Param("startIndexNum") int startIndexNum,@Param("listNum") int listNum,@Param("search") String search,@Param("boardSearch") String boardSearch,@Param("flag") String flag);

	public BoardVO boardContent(@Param("idx") int idx);

	public void boardUpdateSet(@Param("idx") int idx,@Param("vo") BoardVO vo);

	public void boardDel(int idx);

	public int totRecCnt(@Param("search") String search,@Param("boardSearch") String boardSearch,@Param("flag") String flag);

	public void boardGood(@Param("idx") int idx);

	public void boardBad(@Param("idx") int idx);

	public void boardReply(@Param("vo") BoardReplyVO vo);

	public ArrayList<BoardReplyVO> boardReplyArr(int idx);

	public void boardReplyUpdate(@Param("vo") BoardReplyVO vo);

	public void boardReplyDel(@Param("idx") int idx);

	public void setReadNum(@Param("idx") int idx);

	public void boardReGood(@Param("idx") int idx);

	public ArrayList<BoardVO> homeBoardList();

	public BoardVO adMainBoard(@Param("mid") String mid);







}
