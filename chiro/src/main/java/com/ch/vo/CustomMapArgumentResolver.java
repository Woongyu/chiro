package com.ch.vo;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.ch.util.Utlz;
import com.ch.vo.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		CommandMap commandMap = new CommandMap();
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		String key = null;
		String[] values = null;
		while (enumeration.hasMoreElements()){
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			// MySql을 입력할 때 int, date 컬럼에 빈 값('')이 입력되면 에러가 발생한다.
			if(values != null){
				if(values.length > 1){
					commandMap.put(key, values);
				}else if(!Utlz.isBlank(values[0])){
					commandMap.put(key, values[0]);
				}
			}
			
			/*
			if (values != null) {
				commandMap.put(key, (values.length > 1) ? values : values[0]);
			}
			*/
		}
		
		return commandMap;
	}
}
