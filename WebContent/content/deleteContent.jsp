<%@page import="java.io.File"%>
<%@page import="com.exam.vo.AttachVO"%>
<%@page import="java.util.List"%>
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
	
	AttachDao attachDao = AttachDao.getInstance();
	
	// 첨부파일 정보 가져오기
	List<AttachVO> attachList = attachDao.getAttachsByBno(num);
	
	Tools.delFilesForBoard(application, attachList, boardName);
	
	attachDao.deleteAttach(num);
	
	boardDao.deleteBoard(num);
%>
<script>
	alert('Posting has been deleted');
	location.href = '<%=Tools.getBoardLocation(boardName, null)%>';
</script>