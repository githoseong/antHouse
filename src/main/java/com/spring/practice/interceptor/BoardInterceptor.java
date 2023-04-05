package com.spring.practice.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterceptor extends HandlerInterceptorAdapter {
	@Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
  	HttpSession session = request.getSession();
  	String mid = session.getAttribute("sMid")==null ? "1" : (String) session.getAttribute("sMid");
  		RequestDispatcher dispatcher;
  		if(mid.equals("1")) {	// 비로그인자 사용불가
  			dispatcher = request.getRequestDispatcher("/msg/boardNo");
  			dispatcher.forward(request, response);
  			return false;
  		}
  	
  	return true;
  }
}
