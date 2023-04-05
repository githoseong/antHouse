package com.spring.practice.service;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.practice.dao.MemberDAO;
import com.spring.practice.vo.SignupVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int signupOk(SignupVO vo,MultipartFile file1) {
		int res = 0;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String uploadPath = "";
		try {
			byte[] data = file1.getBytes();
			String oFName= file1.getOriginalFilename();
			if(oFName.equals("")) {
				vo.setPhoto("사진없음");
				res = 1;
			}
			else {
				UUID uid = UUID.randomUUID();
				String saveFileName =uid + oFName;
				uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/member/");
				FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
				fos.write(data);
				fos.close();
				vo.setPhoto(saveFileName);
				res = 1;
				
			}
			memberDAO.signupOk(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
		
		
	}

	@Override
	public SignupVO idCheck(String mid) {
		return memberDAO.idCheck(mid);
	}

	@Override
	public SignupVO loginCheck(SignupVO vo) {
		return memberDAO.loginCheck(vo);
	}

	@Override
	public SignupVO signupIdCheck(String mid) {
		return memberDAO.signupIdCheck(mid);
	}

	@Override
	public ArrayList<SignupVO> adMain() {
		return memberDAO.adMain();
	}

	@Override
	public void loginUpdate(SignupVO vo) {
		String date1 = vo.getLastDate().substring(0,10);
		String date4 = vo.getStartDate().substring(0,10);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date2 = new java.util.Date ();
		String date3 = dateFormat.format(date2);
		if(date1.equals(date4)) {
			vo.setTotalCnt(1);
		}
		else if(!date1.equals(date3)) {
			vo.setTodayCnt(0);
			vo.setTotalCnt(1);
		}
		else {
			vo.setTotalCnt(0);
		}
		
		
		
		memberDAO.loginUpdate(vo);
	}

	@Override
	public ArrayList<SignupVO> adMain8() {
		return memberDAO.adMain8();
	}
	@Override
	public ArrayList<SignupVO> adMain9() {
		return memberDAO.adMain9();
	}

	@Override
	public ArrayList<SignupVO> adMember(int startIndexNum, int listNum) {
		return memberDAO.adMember(startIndexNum,listNum);
	}

	@Override
	public int myPageUpdatePost(SignupVO vo,MultipartFile file1) {
		int res = 0;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = "";
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/member/");
		try {
			byte[] data = file1.getBytes();
			String oFName= file1.getOriginalFilename();
			if(!oFName.equals("")) {
				UUID uid = UUID.randomUUID();
				String saveFileName =uid + oFName;
				FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
				fos.write(data);
				fos.close();
				
				if(!vo.getPhoto().equals("사진없음")) {
					File file = new File(uploadPath + vo.getPhoto());
					file.delete();
				}
				vo.setPhoto(saveFileName);
			}
			res = 1;
			memberDAO.myPageUpdatePost(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int levelUp(String mid,int level) {
		int data = 0;
		if(level == 1 || level == 2) {
			memberDAO.levelUp(mid,level);
			data = 1;
		}
		else {
			data = 2;
		}
		return data;
	}

	@Override
	public int levelDown(String mid, int level) {
		int data = 0;
		if(level == 2 || level == 3) {
			memberDAO.levelDown(mid,level);
			data = 1;
		}
		else {
			data = 2;
		}
		return data;
	}
	
}
