<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
// 	if (id == null || id.equals("")) {
// 		response.sendRedirect("../index.jsp");
// 		return;
// 	}
	session.setAttribute("id", id);
	session.setMaxInactiveInterval(60*60*3);
%>
<%= id%>