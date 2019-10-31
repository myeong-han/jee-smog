<%@page import="com.exam.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardnum = (String)session.getAttribute("boardnum");
	
	if (boardnum == null) {
		boardnum = request.getParameter("boardnum");
	}
	String loc = Tools.getBoardLocation(Tools.getBoardName(boardnum), null);
	
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				cookie.setMaxAge(0);	// 쿠키 삭제
				cookie.setPath("/");	// 쿠키의 경로를 동일하게 설정
				response.addCookie(cookie); // 쿠키정보 덮어씌움
			}
		}
	}
	
	session.invalidate();
	response.sendRedirect(loc);
%>