package com.spring.practice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.practice.vo.SignupVO;


public interface MemberDAO {

	public void signupOk(@Param("vo") SignupVO vo);

	public SignupVO idCheck(@Param("mid") String mid);

	public SignupVO loginCheck(@Param("vo") SignupVO vo);

	public SignupVO signupIdCheck(@Param("mid") String mid);

	public ArrayList<SignupVO> adMain();

	public void loginUpdate(@Param("vo") SignupVO vo);

	public ArrayList<SignupVO> adMain8();

	public ArrayList<SignupVO> adMain9();

	public ArrayList<SignupVO> adMember(@Param("startIndexNum") int startIndexNum,@Param("listNum") int listNum);

	public int totRecCnt();

	public void myPageUpdatePost(@Param("vo") SignupVO vo);

	public int levelUp(@Param("mid") String mid, @Param("level") int level);

	public void levelDown(@Param("mid") String mid, @Param("level") int level);


}
