package com.ch.web;

import java.io.IOException;
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
	public String openMainPage() throws Exception {
		return "main";
	}
	
	// 회원등록
	@PostMapping(value = "/join.do")
	public ModelAndView openJoinPage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("join");
		if(map != null){
			logger.info("join: " + map.toString());
			
			if(!Utlz.isBlank((String) map.get("USER_KEY"))){
				mv.addObject("user", map.getMap());
			}
		}
		
		return mv;
	}
	
	// 회원목록
	@RequestMapping(value = "/list.do")
	public ModelAndView openListPage(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("memberList");
		
		List<Map<String, Object>> list = myService.srchMemberList(map);
		mv.addObject("list", list);
		return mv;
	}
	
	// 회원등록(입력)
	@PostMapping("/insUser.do")
	public String insUser(CommandMap map) throws Exception {
		
		// MySql을 입력할 때 int, date 컬럼에 빈 값('')이 입력되면 에러가 발생한다.
		if(Utlz.isBlank((String) map.get("USER_AGE"))){
			map.remove("USER_AGE");
		}
		if(Utlz.isBlank((String) map.get("BIRTH"))){
			map.remove("BIRTH");
		}
		if(Utlz.isBlank((String) map.get("REGISTRATION_DATE"))){
			map.remove("REGISTRATION_DATE");
		}
		if(Utlz.isBlank((String) map.get("COUNTING"))){
			map.remove("COUNTING");
		}
		
		// 랜덤 키 값을 생성하여 쿼리 조회 시 복합키를 사용한다.
		map.put("USER_KEY", Utlz.getSurrogateKey(11));
		
		logger.info("insUser: " + map.toString());
		int nCnt = (int) myService.insUser(map.getMap());
		return (nCnt > 0 ? "redirect:/join.do" : "error");
	}
	
	// 회원등록(수정)
	@PostMapping("/updUser.do")
	public String updUser(CommandMap map) throws Exception {
		
		// MySql을 입력할 때 int, date 컬럼에 빈 값('')이 입력되면 에러가 발생한다.
		if(Utlz.isBlank((String) map.get("USER_AGE"))){
			map.remove("USER_AGE");
		}
		if(Utlz.isBlank((String) map.get("BIRTH"))){
			map.remove("BIRTH");
		}
		if(Utlz.isBlank((String) map.get("REGISTRATION_DATE"))){
			map.remove("REGISTRATION_DATE");
		}
		if(Utlz.isBlank((String) map.get("COUNTING"))){
			map.remove("COUNTING");
		}
		
		logger.info("updUser: " + map.toString());
		int nCnt = (int) myService.updUser(map.getMap());
		return (nCnt > 0 ? "redirect:/join.do" : "error");
	}
	
	// 회원상세정보
	@PostMapping("/detail.do")
	public ModelAndView openMemberDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("memberDetail");
		
		logger.info("detail: " + (String) map.get("USER_KEY"));
		mv.addObject("user", myService.srchMemberDetail((String) map.get("USER_KEY")));
		return mv;
	}
	
	// 회원삭제
	@PostMapping("/delUser.do")
	public String delUser(CommandMap map) throws Exception {
		logger.info("delUser: " + map.toString());
		
		int nCnt = (int) myService.delUser((String) map.get("USER_KEY"));
		return (nCnt > 0 ? "memberDetail" : "error");
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
		logger.info("write: " + map.toString());
		
		mv.addObject("command", (String) map.get("command"));
		return mv;
	}
	
	// 글쓰기(공지사항)
	@PostMapping("/insNotice.do")
	public String insNotice(CommandMap map) throws Exception {
		logger.info("insNotice: " + map.toString());
		int nCnt = (int) myService.insNotice(map.getMap());
		return (nCnt > 0 ? "redirect:/write.do" : "error");
	}
	
	// 글 읽기
	@PostMapping("/post.do")
	public ModelAndView openBoardDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetail");
		
		logger.info("view: " + map.toString());
		if("notice".equals((String) map.get("command"))){
			myService.updNoticeHit((String) map.get("IDX"));
			mv.addObject("board", myService.srchBoardDetail((String) map.get("IDX")));
		}else{
			
		}
		
		return mv;
	}
}