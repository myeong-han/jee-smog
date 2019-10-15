<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	session.setMaxInactiveInterval(0);
	response.sendRedirect("../index.jsp");
%>