package com.ch.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.service.MyService;
import com.ch.util.Utlz;
import com.ch.vo.CommandMap;

@Controller
public class MyController {
	Logger logger = Logger.getLogger(this.getClass());

	@Resource(name = "myService")
	private MyService myService;
	
	// 메인
	@GetMapping
	@RequestMapping(value = "/main.do")
	public String goMain() throws Exception {
		return "frame/main";
	}
	
	// 회원등록
	@RequestMapping(value = "/join.do")
	public String goJoin(CommandMap map) throws Exception {
		return "member/join";
	}
	
	// 회원목록
	@RequestMapping(value = "/userList.do")
	public String goUserList() throws Exception {
		return "member/userList";
	}
	
	// 회원목록(페이징)
	@PostMapping(value = "/userListPage.do")
	public ModelAndView goUserListPage(CommandMap map) throws Exception {
		logger.info("userListPage: " + map.toString());
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = myService.srchUserList(map.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0){
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			mv.addObject("RNUM", list.get(list.size() -1).get("RNUM"));
		}else{
			mv.addObject("TOTAL", 0);
			mv.addObject("RNUM", 0);
		}
		
		return mv;
	}
	
	// 회원등록(입력)
	@PostMapping("/insUser.do")
	public ModelAndView insUser(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		// 랜덤 키 값을 생성하여 쿼리 조회 시 복합키를 사용한다.
		map.put("USER_KEY", Utlz.getSurrogateKey(11));
		logger.info("insUser: " + map.toString());
		
		int nCnt = (int) myService.insUser(map.getMap());
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 회원등록(수정)
	@PostMapping("/updUser.do")
	public ModelAndView updUser(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("updUser: " + map.toString());
		
		int nCnt = (int) myService.updUser(map.getMap());
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 회원상세정보
	@PostMapping("/userDetail.do")
	public ModelAndView goUserDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("userDetail: " + map.toString());
		
		List<Map<String, Object>> list = myService.srchUserDetail((String) map.get("USER_KEY"));
		mv.addObject("list", list);
		return mv;
	}
	
	// 회원삭제
	@PostMapping("/delUser.do")
	public ModelAndView delUser(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("delUser: " + map.toString());
		
		int nCnt = (int) myService.delUser((String) map.get("USER_KEY"));
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 게시판
	@PostMapping(value = "/board.do")
	public ModelAndView goBoardPage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("board/board");
		logger.info("board: " + map.toString());
		mv.addObject("COMMAND", (String) map.get("COMMAND"));
		return mv;
	}
	
	// 게시판(페이징)
	@PostMapping(value = "/boardListPage.do")
	public ModelAndView goBoardListPage(CommandMap map) throws Exception {
		logger.info("boardListPage: " + map.toString());
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = myService.srchBoardList(map.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0){
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			mv.addObject("RNUM", list.get(list.size() -1).get("RNUM"));
		}else{
			mv.addObject("TOTAL", 0);
			mv.addObject("RNUM", 0);
		}
		
		String sBoardLike = (String) map.get("BOARD_LIKE");
		if(!Utlz.isBlank(sBoardLike)){
			mv.addObject("BOARD_LIKE", sBoardLike);
		}
		
		return mv;
	}
	
	// 글쓰기
	@PostMapping(value = "/write.do")
	public ModelAndView goWritePage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("board/write");
		String sCommand = (String) map.get("COMMAND");
		logger.info("write: " + map.toString());
		
		if(!Utlz.isBlank(map.get("BOARD_KEY"))){
			mv.addObject("board", map.getMap());
		}
		
		mv.addObject("COMMAND", sCommand);
		return mv;
	}
	
	// 글쓰기(입력)
	@PostMapping("/insBoard.do")
	public ModelAndView insBoard(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		// 랜덤 키 값을 생성하여 쿼리 조회 시 복합키를 사용한다.
		map.put("BOARD_KEY", Utlz.getSurrogateKey(11));
		logger.info("insBoard: " + map.toString());
		
		int nCnt = (int) myService.insBoard(map.getMap());
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 글쓰기(수정)
	@PostMapping("/updBoard.do")
	public ModelAndView updBoard(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("updBoard: " + map.toString());
		
		int nCnt = (int) myService.updBoard(map.getMap());
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 글읽기
	@PostMapping("/post.do")
	public ModelAndView goBoardDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("board/boardDetail");
		String sBoardKey = (String) map.get("BOARD_KEY");
		logger.info("post: " + map.toString());
		
		myService.updBoardHit(sBoardKey);
		mv.addObject("board", myService.srchBoardDetail(sBoardKey));
		
		// 댓글 리스트
		List<Map<String, Object>> list = myService.srchCommentList(sBoardKey);
		mv.addObject("comment", list);
		mv.addObject("COMMAND", (String) map.get("COMMAND"));
		return mv;
	}
	
	// 글삭제
	@PostMapping("/delBoard.do")
	public ModelAndView delBoard(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("delBoard: " + map.toString());
		
		int nCnt = (int) myService.delBoard((String) map.get("BOARD_KEY"));
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 댓글등록(입력)
	@PostMapping("/insComment.do")
	public ModelAndView insComment(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("insComment: " + map.toString());
		
		int nCnt = (int) myService.insComment(map.getMap());
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 냉온찜질의 올바른 사용법
	@RequestMapping(value = "/useOfPack.do")
	public String goUseOfPack(CommandMap map) throws Exception {
		return "health/useOfPack";
	}
	
	// 기초반 연수생 모집안내
	@RequestMapping(value = "/shoulderPain.do")
	public String goShoulderPain(CommandMap map) throws Exception {
		return "health/shoulderPain";
	}
	
	// 장요근과 허리통증
	@RequestMapping(value = "/backache.do")
	public String goBackache(CommandMap map) throws Exception {
		return "health/backache";
	}
	
	// 장요근과 허리통증
	@RequestMapping(value = "/recruitment.do")
	public String goRecruitment(CommandMap map) throws Exception {
		return "recruit/recruitment";
	}
	
	// 교육 및 과정
	@RequestMapping(value = "/program.do")
	public String goProgram(CommandMap map) throws Exception {
		return "recruit/program";
	}
	
	// 이벤트
	@RequestMapping(value = "/event.do")
	public String goEvent(CommandMap map) throws Exception {
		return "event/event";
	}
}