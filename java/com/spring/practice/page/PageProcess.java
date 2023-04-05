package com.spring.practice.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.practice.dao.AskDAO;
import com.spring.practice.dao.BoardDAO;
import com.spring.practice.dao.CalendarDAO;
import com.spring.practice.dao.MemberDAO;

@Service
public class PageProcess {
	
	@Autowired
	BoardDAO boardDAO; 
	@Autowired
	MemberDAO memberDAO; 
	@Autowired
	CalendarDAO calendarDAO;
	@Autowired
	AskDAO askDAO;

	// 1.page번호, 2.page크기, 3.소속(예:게시판(board),회원(member),방명록(guest)..), 4.분류(part), 5.검색어(searchString)
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString,String flag) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		
		// section에 따른 레코드 갯수를 구해오기
		if(section.equals("board")) {
			String search = part;
			totRecCnt = boardDAO.totRecCnt(search,searchString,flag);
		}
		else if(section.equals("admin")) {
			totRecCnt = memberDAO.totRecCnt();
		}
		else if(section.equals("member")) {
			totRecCnt = calendarDAO.totRecCnt(part);
		}
		else if(section.equals("ask")) {
			totRecCnt = askDAO.totRecCnt(part);
		}
		else if(section.equals("memberAsk")) {
			totRecCnt = askDAO.totRecCnt2(part);
		}
		
		int totalNum = totRecCnt; //총 데이터
		int blockPage = 3; //1블럭당 페이지 수
		int totalPage = (int)Math.ceil(((double)totalNum / (double)pageSize));  //전체 페이지 수
		int totalBlock = (int)Math.ceil((double)totalPage / (double)blockPage); //전체 블럭 수
		int blockNum = (int)Math.ceil((double)pag / (double)blockPage); //현재 블럭 번호
		int startPageNum = (int) (((blockNum - 1) * blockPage) + 1); //블럭당 시작 페이지 번호
		int lastPageNum = (int) (blockNum * blockPage); //블럭당 마지막 페이지 번호
		int startIndexNum = (pag - 1) * pageSize; //페이지 첫 글 인덱스 번호 
		int startNum =totalNum - startIndexNum; //페이지 첫 글 시작 번호

		pageVO.setListNum(pageSize);
		pageVO.setTotalNum(totalNum);
		pageVO.setBlockPage(blockPage);
		pageVO.setTotalPage(totalPage);
		pageVO.setTotalBlock(totalBlock);
		pageVO.setCurPage(pag);
		pageVO.setBlockNum(blockNum);
		pageVO.setStartPageNum(startPageNum);
		pageVO.setLastPageNum(lastPageNum);
		pageVO.setStartIndexNum(startIndexNum);
		pageVO.setStartNum(startNum);
		
			
		return pageVO;
	}



	
	
}
