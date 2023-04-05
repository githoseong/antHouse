package com.spring.practice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.practice.page.PageProcess;
import com.spring.practice.page.PageVO;
import com.spring.practice.service.BoardService;
import com.spring.practice.service.MemberService;
import com.spring.practice.vo.BoardReplyVO;
import com.spring.practice.vo.BoardVO;
import com.spring.practice.vo.SignupVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService; 
	@Autowired
	MemberService MemberService;
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="board",method=RequestMethod.GET)
	public String boardList(Model model,PageVO pVo,
			@RequestParam(name="curPage", defaultValue = "1", required = false) int curPage,
			@RequestParam(name="listNum", defaultValue = "10", required = false) int listNum,
			String search,String boardSearch
			) {
		String flag = "0";
		if(boardSearch == null || boardSearch == "") {
			flag = "0";
		}
		else {
			flag = "1";
		}
		pVo = pageProcess.totRecCnt(curPage, listNum, "board", search, boardSearch,flag);
		ArrayList<BoardVO> vos = boardService.boardList(pVo.getStartIndexNum(),listNum,search,boardSearch,flag);
		
		model.addAttribute("search",search);
		model.addAttribute("boardSearch",boardSearch);
		model.addAttribute("curPage",curPage);
		model.addAttribute("vos", vos);
		model.addAttribute("pVo",pVo);
		return "board/board";
	}
	
	@RequestMapping(value="boardInput",method=RequestMethod.GET)
	public String bardInput(Model model,HttpSession session,int curPage, int listNum,String search,String boardSearch) {
		String mid = (String) session.getAttribute("sMid");
		SignupVO vo = MemberService.signupIdCheck(mid);

		model.addAttribute("search",search);
		model.addAttribute("boardSearch",boardSearch);
		model.addAttribute("curPage",curPage);
		model.addAttribute("listNum",listNum);
		model.addAttribute("name", vo.getName());
		return "board/input";
	}
	@RequestMapping(value="boardInput",method=RequestMethod.POST)
	public String bardInputSet(Model model,BoardVO vo,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		vo.setMid(mid);
		
		boardService.boardInput(vo);
		
		
		
		return "redirect:/msg/boInputOk";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(MultipartHttpServletRequest request,HttpServletResponse response,MultipartFile upload
			) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		// ckeditor에서 올린(전송한) 파일을, 서버 파일시스템에 실제로 파일을 저장시킨다.
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		
		// 서버 파일시스템에 저장된 파일을 화면에 보여주기위한 작업.
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + originalFilename;
		/* {"atom":"12.jpg","변수":1,~~~~} */
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		outStr.close();
	}
	
	@RequestMapping(value="content",method=RequestMethod.GET)
	public String boardList(Model model,int idx,int curPage, int listNum,String search,String boardSearch,HttpSession session) {
		BoardVO vo = boardService.boardContent(idx);
		ArrayList<BoardReplyVO> vos = boardService.boardReplyArr(idx);
		
		// 조회수 증가(조회수 중복방지처리)
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) contentIdx = new ArrayList<String>();
		
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			boardService.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		model.addAttribute("search",search);
		model.addAttribute("boardSearch",boardSearch);
		model.addAttribute("curPage",curPage);
		model.addAttribute("listNum",listNum);
		model.addAttribute("vo", vo);
		model.addAttribute("vos", vos);
		return "board/content";
	}
	
	@ResponseBody
	@RequestMapping(value="boardReply",method=RequestMethod.POST)
	public String boardReply(BoardReplyVO vo,Model model) {
		boardService.boardReply(vo);
		
		return "1";
	}
	@RequestMapping(value="update",method=RequestMethod.GET)
	public String boardUpdate(Model model,int idx,int curPage, int listNum,String search,String boardSearch) {
		BoardVO vo = boardService.boardContent(idx);
		
		model.addAttribute("search",search);
		model.addAttribute("boardSearch",boardSearch);
		model.addAttribute("curPage",curPage);
		model.addAttribute("listNum",listNum);
		model.addAttribute("vo", vo);
		return "board/update";
	}
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String boardUpdateSet(int idx, BoardVO vo) {
		BoardVO vo2 = boardService.boardContent(idx);
		if(!vo2.getContent().equals(vo.getContent()) ) {        
			if(vo.getContent().indexOf("src=\"/") != -1) {        //ckEditor 내용에서 그림파일이 있으면 이미지 체크 실행
				boardService.imgCheck(vo.getContent(),vo2.getContent());  //원래 게시물의 내용과 새로운 내용을 같이 보내준다.
			}
		}
		
		boardService.boardUpdateSet(idx,vo);
	
		
		return "redirect:/msg/boardUpdateOk";
	}
	
	@RequestMapping(value="boardDel",method=RequestMethod.GET)
	public String boardDel(int idx) {
		BoardVO vo = boardService.boardContent(idx);
		
		boardService.boardDel(idx,vo);
		
		
		return "redirect:/msg/boardDel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardGood", method = RequestMethod.POST)
	public String boardGoodPost(HttpSession session,int idx) {
	// 좋아요수 증가처리하기
		String sw = "1"; // 이미 '좋아요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {	
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "good" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			boardService.boardGood(idx);
			goodIdx.add(imsiGoodIdx);
			sw = "0";	// 좋아요 버튼을 클릭했을경우는 '0'을 반환
		}
		session.setAttribute("sGoodIdx", goodIdx);
	return sw;
	}
	@ResponseBody
	@RequestMapping(value = "/boardBad", method = RequestMethod.POST)
	public String boarBadPost(HttpSession session,int idx) {
		// 싫어요수 증가처리하기
		String sw = "1"; // 이미 '싫어요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
		ArrayList<String> badIdx = (ArrayList) session.getAttribute("sBadIdx");
		if(badIdx == null) {	
			badIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "bad" + idx;
		if(!badIdx.contains(imsiGoodIdx)) {
			boardService.boardBad(idx);
			badIdx.add(imsiGoodIdx);
			sw = "0";	// 싫어요 버튼을 클릭했을경우는 '0'을 반환
		}
		session.setAttribute("sBadIdx", badIdx);
		return sw;
	}
	@ResponseBody
	@RequestMapping(value = "/reGood", method = RequestMethod.POST)
	public String reGood(HttpSession session,int idx) {
		// 댓글 좋아요수 증가처리하기
		String sw = "1"; // 이미 '댓글 좋아요'를 한번 눌렀으면 '0'으로 처음이면 '1'로 sw값을 보내준다.
		ArrayList<String> badIdx = (ArrayList) session.getAttribute("sBadIdx");
		if(badIdx == null) {	
			badIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "good" + idx;
		if(!badIdx.contains(imsiGoodIdx)) {
			boardService.boardReGood(idx);
			badIdx.add(imsiGoodIdx);
			sw = "0";	// 댓글 좋아요 버튼을 클릭했을경우는 '0'을 반환
		}
		session.setAttribute("sBadIdx", badIdx);
		return sw;
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyUpdate", method = RequestMethod.POST)
	public String boardReplyUpdate(BoardReplyVO vo) {
		boardService.boardReplyUpdate(vo);
		
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyDel", method = RequestMethod.POST)
	public String boardReplyDel(int idx) {
		boardService.boardReplyDel(idx);
		
		return "1";
	}
	
	
}
