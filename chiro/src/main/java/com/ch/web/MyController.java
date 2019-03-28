package com.ch.web;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.service.MyService;
import com.ch.util.Utlz;
import com.ch.vo.CommandMap;

@Controller
public class MyController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	BasicDataSource dataSource;

	@Resource(name = "myService")
	private MyService myService;

	@RequestMapping(value = "/openBoardList.do")
	public ModelAndView openSampleBoardList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardList");
		List<Map<String, Object>> list = myService.selectBoardList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/dbTest.do")
	public String dbTest(Model model) {
		Connection conn = null;
		Statement st = null;

		try {
			conn = dataSource.getConnection();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select now() as now;");

			while (rs.next()) {
				System.out.println("나우: " + rs.getString("now"));
				model.addAttribute("serverTime", rs.getString("now"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return "index";
	}

	@RequestMapping(value = "/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardWrite");
		return mv;
	}

	@RequestMapping(value = "/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/openBoardList.do");
		myService.insertBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/boardDetail");
		Map<String, Object> map = myService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/main.do")
	public ModelAndView openMainPage() throws Exception {
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "/join.do")
	public ModelAndView openJoinPage() throws Exception {
		return new ModelAndView("join");
	}
	
	@RequestMapping(value = "/insUser.do")
	public ModelAndView insUser(CommandMap map) throws Exception {
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
		
		map.put("USER_ID", Utlz.getSurrogateKey(11));
		
		Utlz.print("insUser: " + map.toString());
		myService.insUser(map.getMap());
		return new ModelAndView("redirect:/join.do");
	}
}
