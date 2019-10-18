<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	response.sendRedirect("../index.jsp");
%>