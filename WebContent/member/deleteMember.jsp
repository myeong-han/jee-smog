<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.Tools"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	MemberDao memberDao = MemberDao.getInstance();
	
	MemberVO memberVO = memberDao.getMember(id);
	Tools.delFileToProfile(application, memberVO);
	
	memberDao.deleteMember(id);
	
	session.invalidate();
%>
<script>
	alert('Drop out success.\nGo to main page.');
	location.href = '../index.jsp';
</script>