package com.spring.practice.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.practice.vo.SignupVO;

public interface MemberService {

	public int signupOk(SignupVO vo, MultipartFile file1);

	public SignupVO idCheck(String mid);

	public SignupVO loginCheck(SignupVO vo);

	public SignupVO signupIdCheck(String mid);

	public ArrayList<SignupVO> adMain();

	public void loginUpdate(SignupVO vo);

	public ArrayList<SignupVO> adMain8();

	public ArrayList<SignupVO> adMain9();

	public ArrayList<SignupVO> adMember(int startIndexNum, int listNum);

	public int myPageUpdatePost(SignupVO vo, MultipartFile file1);

	public int levelUp(String mid, int level);

	public int levelDown(String mid, int level);


	
}
