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
		return "main";
	}
	
	// 회원등록
	@PostMapping(value = "/join.do")
	public ModelAndView goJoin(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("join");
		
		if(!Utlz.isBlank(map.get("USER_KEY"))){
			logger.info("join: " + map.toString());
			mv.addObject("user", map.getMap());
		}
		
		return mv;
	}
	
	// 회원목록
	@RequestMapping(value = "/userList.do")
	public String goUserList() throws Exception {
		return "userList";
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
		ModelAndView mv = new ModelAndView("userDetail");
		logger.info("userDetail: " + map.toString());
		mv.addObject("user", myService.srchUserDetail((String) map.get("USER_KEY")));
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
	
	// 공지사항
	@PostMapping(value = "/notice.do")
	public ModelAndView openNoticePage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("board");
		List<Map<String, Object>> list = myService.srchNoticeList(map);
		mv.addObject("list", list);
		mv.addObject("command", "notice");
		return mv;
	}
	
	// 글쓰기
	@PostMapping(value = "/write.do")
	public ModelAndView openWritePage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("write");
		String sCommand = (String) map.get("command");
		if(!Utlz.isBlank(map.get("IDX"))){
			logger.info("write: " + map.toString());
			mv.addObject("board", map.getMap());
		}
		
		mv.addObject("command", sCommand);
		return mv;
	}
	
	// 글쓰기(공지사항)
	@PostMapping("/insNotice.do")
	public String insNotice(CommandMap map) throws Exception {
		logger.info("insNotice: " + map.toString());
		int nCnt = (int) myService.insNotice(map.getMap());
		return (nCnt > 0 ? "redirect:/write.do" : "error");
	}
	
	// 글읽기
	@PostMapping("/post.do")
	public ModelAndView openBoardDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetail");
		String sCommand = (String) map.get("command");
		logger.info("post: " + map.toString());
		
		if("notice".equals(sCommand)){
			myService.updNoticeHit((String) map.get("IDX"));
			mv.addObject("board", myService.srchBoardDetail((String) map.get("IDX")));
		}else{
			// TODO 고객 게시판
		}
		
		mv.addObject("command", sCommand);
		return mv;
	}
	
	// 글삭제(공지사항)
	@PostMapping("/delNotice.do")
	public String delNotice(CommandMap map) throws Exception {
		logger.info("delNotice: " + map.toString());
		int nCnt = (int) myService.delNotice((String) map.get("IDX"));
		return (nCnt > 0 ? "redirect:/post.do" : "error");
	}
	
	// 글쓰기(수정)
	@PostMapping("/updNotice.do")
	public String updNotice(CommandMap map) throws Exception {
		logger.info("updNotice: " + map.toString());
		int nCnt = (int) myService.updNotice(map.getMap());
		return (nCnt > 0 ? "redirect:/write.do" : "error");
	}
}