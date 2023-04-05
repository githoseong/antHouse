package com.spring.practice.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.practice.dao.BoardDAO;
import com.spring.practice.vo.BoardReplyVO;
import com.spring.practice.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public void boardInput(BoardVO vo) {
		boardDAO.boardInput(vo);
	}

	@Override
	public ArrayList<BoardVO> boardList(int startIndexNum, int listNum,String search, String boardSearch,String flag) {
		return boardDAO.boardList(startIndexNum,listNum,search,boardSearch,flag);
	}

	@Override
	public BoardVO boardContent(int idx) {
		return boardDAO.boardContent(idx);
	}

	@Override
	public void boardUpdateSet(int idx,BoardVO vo) {
		
		boardDAO.boardUpdateSet(idx,vo);
	}
	
	@Override
	public void imgCheck(String content,String content2) {
				          //  1         2         3         4         5         6
		//      012345678901234567890123456789012345678901234567890123456789012345678901234567890
		// <img src="/practice/data/ckeditor/220622152246_map.jpg" style="height:838px; width:1489px" /></p>
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		
		int position = 29;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);  //220622152246_map.jpg" 이 부분부터 나오도록 추출
		String nextImg2 = content2.substring(content2.indexOf("src=\"/") + position);
		boolean sw = true;
		
		ArrayList<String> arrfile = new ArrayList<>();    
		ArrayList<String> arrfile2 = new ArrayList<>();
		
		while(sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));   //220622152246_map.jpg 이 부분만 나오도록 추출
			String imgFile2 = nextImg2.substring(0, nextImg2.indexOf("\""));
			
			arrfile.add(imgFile);			//수정 게시물 이미지 파일명 추출물을 배열에 넣어줌
			arrfile2.add(imgFile2);   //기존 게시물 이미지 파일명 추출물을 배열에 넣어줌
			arrfile2.removeAll(arrfile); // 배열 차집합. arrfile2에서 arrfile에 포함 되지 않는 것을 추출
			
			if(nextImg2.indexOf("src=\"/") == -1) {  //원래 있던 이미지파일이 없을때 까지 반복문을 돌려줌  
				sw = false;
			}
			else {  
				if(nextImg.indexOf("src=\"/") != -1) {   //원래 있던 이미지파일의 수만큼 돌아가도록
					nextImg =nextImg.substring(nextImg.indexOf("src=\"/") + position); //그 다음 이미지파일(220622152246_map.jpg")이 부분부터 다시 쭉나옴 마지막 이미지파일까지 반복
				}	
				nextImg2 =nextImg2.substring(nextImg2.indexOf("src=\"/") + position); 
			}
		}
		for(int i=0; i<arrfile2.size(); i++) { //원래 게시물에서 수정한 이미지파일을 비교하여 없는 수 만큼 반복문을 돌려줌
			String oriFileP = uploadPath + arrfile2.get(i);  //업로드패스 + 차집합으로 추출한 배열을 차례대로 꺼낸 것을 더해서 변수에 넣어 줌.
			String reOriFileP = oriFileP.replace("[", "");  //배열로 되어있어 [ ] 를 없애버리고
			String reOriFileP2 = reOriFileP.replace("]", "");
			fileDelete(reOriFileP2);  //삭제 하는 곳으로 보내 줌  *원래 게시물의 이미지 파일 수 만큼 반복문을 돌려 수정해서 이미지 파일을 없애면 차집합을 통해 없어진 이미지 파일을 확인하여 경로에서 파일을 삭제시킴*
		}
	}

	private void fileDelete(String reOriFileP2) {
		File delFile = new File(reOriFileP2);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public void boardDel(int idx, BoardVO vo) {
		if(vo.getContent().indexOf("src=\"/") != -1) {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
			
			int position = 29;
			String nextImg = vo.getContent().substring(vo.getContent().indexOf("src=\"/") + position);
			boolean sw = true;
			
			while(sw) {
				String imgFile = nextImg.substring(0, nextImg.indexOf("\""));   //220622152246_map.jpg 이 부분만 나오도록 추출
				
				String oriFile = uploadPath + imgFile;
				
				fileDelete(oriFile);
				
				if(nextImg.indexOf("src=\"/") == -1) {  //원래 있던 이미지파일이 없을때 까지 반복문을 돌려줌  
					sw = false;
				}
				else {  
						nextImg =nextImg.substring(nextImg.indexOf("src=\"/") + position); //그 다음 이미지파일(220622152246_map.jpg")이 부분부터 다시 쭉나옴 마지막 이미지파일까지 반복
					}	
				}
			}
			
			boardDAO.boardDel(idx);
		}

	@Override
	public void boardGood(int idx) {
		boardDAO.boardGood(idx);
	}

	@Override
	public void boardBad(int idx) {
		boardDAO.boardBad(idx);
	}

	@Override
	public void boardReply(BoardReplyVO vo) {
		boardDAO.boardReply(vo);
	}

	@Override
	public ArrayList<BoardReplyVO> boardReplyArr(int idx) {
		return boardDAO.boardReplyArr(idx);
	}

	@Override
	public void boardReplyUpdate(BoardReplyVO vo) {
		boardDAO.boardReplyUpdate(vo);
	}

	@Override
	public void boardReplyDel(int idx) {
		boardDAO.boardReplyDel(idx);
	}

	@Override
	public void setReadNum(int idx) {
		boardDAO.setReadNum(idx);
	}

	@Override
	public void boardReGood(int idx) {
		boardDAO.boardReGood(idx);
	}

	@Override
	public ArrayList<BoardVO> homeBoardList() {
		return boardDAO.homeBoardList();
	}

	@Override
	public BoardVO adMainBoard(String mid) {
		return boardDAO.adMainBoard(mid);
	}


		
	


}
