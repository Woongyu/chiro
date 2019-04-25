package com.ch.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ch.service.MyService;
import com.ch.util.Utlz;
import com.ch.vo.CommandMap;

@Controller
@SessionAttributes("loginInfo")
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
	
	// 로그인
	@PostMapping(value = "/login.do")
	public ModelAndView goLogin(CommandMap map, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("login: " + map.toString());
		
		Map<String, Object> loginInfo = myService.srchLogin(map.getMap());
		int nCnt = Integer.parseInt(String.valueOf(loginInfo.get("CNT")));
		if(nCnt > 0){
			model.addAttribute("loginInfo", loginInfo);
		}
		
		mv.addObject("nCnt", nCnt);
		return mv;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String goLogout(SessionStatus status) throws Exception {
		
		// SessionStatus는 @SessionAttributes의 세션을 만료시킨다.
		status.setComplete();
		return (status.isComplete() ? "redirect:/main.do" : "redirect:/error.do");
	}
	
	// 회원등록
	@RequestMapping(value = "/join.do")
	public String goJoin() throws Exception {
		return "member/join";
	}
	
	// 다중파일업로드
	@RequestMapping(value = "/file_uploader_html5.do",
			method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		
		// 파일정보
		StringBuffer sb = new StringBuffer();
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			String defaultPath = request.getSession().getServletContext().getRealPath("/");
			
			// 파일 기본경로 _ 상세경로
			String filePath = defaultPath+"/resources/photoUpload/";
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
					.format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString())
					.append(oldName.substring(oldName.lastIndexOf("."))).toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true")
				.append("&sFileName=").append(oldName)
				.append("&sFileURL=").append("/resources/photoUpload/")
				.append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sb.toString();
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
			mv.addObject("board", myService.srchPost((String) map.get("BOARD_KEY")));
		}
		
		mv.addObject("COMMAND", sCommand);
		return mv;
	}
	
	// 글쓰기(입력)
	@PostMapping("/insBoard.do")
	public ModelAndView insBoard(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("insBoard: " + map.toString());
		
		// 랜덤 키 값을 생성하여 쿼리 조회 시 복합키를 사용한다.
		map.put("BOARD_KEY", Utlz.getSurrogateKey(11));
		String hashedPw = (String) map.get("BOARD_PWD");
		hashedPw = BCrypt.hashpw((!Utlz.isBlank(hashedPw) ? hashedPw : "0000")
			, BCrypt.gensalt());
		map.replace("BOARD_PWD", hashedPw);
        
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
	@RequestMapping(value = "/post/{idx}")
	public ModelAndView goPost(@PathVariable("idx") Long nIdx) throws Exception {
		ModelAndView mv = new ModelAndView("board/post");
		logger.info("post: " + nIdx);
		
		Map<String, Object> srchPost = myService.srchPost(String.valueOf(nIdx));
		if(srchPost != null){
			myService.updBoardHit(String.valueOf(nIdx));
			mv.addObject("board", srchPost);
			
			// 댓글 리스트
			List<Map<String, Object>> list = myService.srchCommentList((String) srchPost.get("BOARD_KEY"));
			mv.addObject("comment", list);
			mv.addObject("COMMAND", (String) srchPost.get("BOARD_DVSN"));
			return mv;
		}else{
			return new ModelAndView("error");
		}
	}
	
	// 글체크
	@PostMapping("/chkBoardPwd.do")
	public ModelAndView chkBoardPwd(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		logger.info("chkBoardPwd: " + map.toString());
		
		String hashedPw = (String) map.get("BOARD_PWD");
		String sBoardKey = (String) map.get("BOARD_KEY");
		boolean bTf = BCrypt.checkpw(hashedPw, (String) myService.chkBoardPwd(sBoardKey));
		mv.addObject("bTf", bTf);
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
	public String goUseOfPack() throws Exception {
		return "health/useOfPack";
	}
	
	// 기초반 연수생 모집안내
	@RequestMapping(value = "/shoulderPain.do")
	public String goShoulderPain() throws Exception {
		return "health/shoulderPain";
	}
	
	// 장요근과 허리통증
	@RequestMapping(value = "/backache.do")
	public String goBackache() throws Exception {
		return "health/backache";
	}
	
	// 장요근과 허리통증
	@RequestMapping(value = "/recruitment.do")
	public String goRecruitment() throws Exception {
		return "recruit/recruitment";
	}
	
	// 교육 및 과정
	@RequestMapping(value = "/program.do")
	public String goProgram() throws Exception {
		return "recruit/program";
	}
	
	// 이벤트
	@RequestMapping(value = "/event.do")
	public String goEvent() throws Exception {
		return "event/event";
	}
}