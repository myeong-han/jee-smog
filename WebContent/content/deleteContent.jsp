<%@page import="com.exam.dao.AttachDao"%>
<%@page import="com.exam.Tools"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDao boardDao = BoardDao.getInstance();
	
	String boardnum = ""+boardDao.getBoardnum(num);
	String boardName = Tools.getBoardName(boardnum);
	
	boardDao.deleteBoard(num);
	
	AttachDao attachDao = AttachDao.getInstance();
	attachDao.deleteAttach(num);
	// 파일삭제메소드
%>
<script>
	alert('Posting has been deleted');
	location.href = '<%=Tools.getBoardLocation(boardName, null)%>';
</script>