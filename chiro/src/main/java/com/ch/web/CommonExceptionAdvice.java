package com.ch.web;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	Logger logger = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e) {
		
		// 모든 Exception을 처리하도록 설정
		logger.info(e.toString());
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("exception", e);
		return mv;
	}
}
