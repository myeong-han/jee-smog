<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	MemberDao memberDao = MemberDao.getInstance();
%>
<%= memberDao.isIdDuplicated(id)%>