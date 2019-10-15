<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String rememberMe = request.getParameter("rememberMe");
	
	MemberDao memberDao = MemberDao.getInstance();
	
	int userCheck = memberDao.userCheck(id, passwd);
	
	if (userCheck == 1) {
		session.setAttribute("id", id);
		
		if (rememberMe != null && rememberMe.equals("true")) {
			
		}
	}
// 	if (id == null || id.equals("")) {
// 		response.sendRedirect("../index.jsp");
// 		return;
// 	}
	
%>
<%= id%>