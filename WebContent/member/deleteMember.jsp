<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDao memberDao = MemberDao.getInstance();
	memberDao.deleteMember(id);
	// 파일삭제 메소드 필요
	session.invalidate();
%>
<script>
	alert('Drop out success.\nGo to main page.');
	location.href = '../index.jsp';
</script>