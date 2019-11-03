<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.Tools"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Special People's Place</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	BoardDao boardDao = BoardDao.getInstance();
	
	MemberDao memberDao = MemberDao.getInstance();
	List<BoardVO> boardList = boardDao.getAllBoards();
	List<BoardVO> newsList = new ArrayList<>();
	List<BoardVO> commList = new ArrayList<>();
	List<BoardVO> gallList = new ArrayList<>();
	
	for (BoardVO boardVO : boardList) {
		if (boardVO.getBoardnum() == 1) {
			newsList.add(boardVO);
		} else if (boardVO.getBoardnum() == 2) {
			commList.add(boardVO);
		} else if (boardVO.getBoardnum() == 3) {
			gallList.add(boardVO);
		}
	}
	
	AttachDao attachDao = AttachDao.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1" style="width: 534px; float: left; margin-left: 54px; margin-right: 20px; margin-bottom: 0px;">
		<legend><h1>News</h1></legend>
		<table id="m_information" border="1" style="width: 500px;">
			<tr class="board-th">
				<th class="subject">Title</th><th>Writer</th><th>Reads</th>
			</tr>
<%
	if (newsList.size() > 0) {
		int i = 0;
		for (BoardVO boardVO : newsList) {
			i++;
			MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
%>
			<tr class="content-tr" onclick="location.href='../content/content.jsp?boardnum=<%=boardVO.getBoardnum()%>&num=<%=boardVO.getNum()%>&pageNum=1'">
				<td class="subject"><%=boardVO.getSubject() %></td>
				<td style="width: 110px;"><%=memberVO.getName() %></td>
				<td><%=boardVO.getReadcount()%></td>
			</tr>
<%
			if (i==5) {
				break;
			}
		}
	} else {
%>
			<tr>
				<td colspan="3">No Articles</td>
			</tr>
<%
	}
%>
		</table>
		</fieldset>
		
		<fieldset class="f1" style="width: 534px; float: left; margin-left: 20px; margin-right: 54px; margin-bottom: 0px;">
		<legend><h1>Community</h1></legend>
		<table id="m_information" border="1" style="width: 500px;">
			<tr class="board-th">
				<th class="subject">Title</th><th>Writer</th><th>Reads</th>
			</tr>
<%
	if (commList.size() > 0) {
		int i = 0;
		for (BoardVO boardVO : commList) {
			i++;
			MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
%>
			<tr class="content-tr" onclick="location.href='../content/content.jsp?boardnum=<%=boardVO.getBoardnum()%>&num=<%=boardVO.getNum()%>&pageNum=1'">
				<td class="subject"><%=boardVO.getSubject() %></td>
				<td style="width: 110px;"><%=memberVO.getName() %></td>
				<td><%=boardVO.getReadcount()%></td>
			</tr>
<%
			if (i == 5) {
				break;
			}
		}
	} else {
%>
			<tr>
				<td colspan="3">No Articles</td>
			</tr>
<%
	}
%>
		</table>
		</fieldset>
		
		<fieldset class="f1" style="width: 1136px;">
		<legend><h1>Gallery</h1></legend>
<%
	if (gallList.size() > 0) {
		int i = 0;
		for (BoardVO boardVO : gallList) {
			i++;
			MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
%>
			<table border="1" id="table-gall">
			<caption id="cap-gall" onclick="location.href='../content/content.jsp?boardnum=<%=boardVO.getBoardnum()%>&num=<%=boardVO.getNum()%>&pageNum=1'">
			<div id="crop-gall" style="width: 348px; height: 220px;">
			<img src="../upload/gallery/<%=attachDao.getFirstImageByBno(boardVO.getNum())%>"/>
			</div>
			</caption>
			<tr id="tr-gall">
				<td><%=boardVO.getNum() %></td>
				<td colspan="2"><%=boardVO.getSubject() %></td>
			</tr>
			<tr id="tr-gall">
				<td width="35"><%=boardVO.getReadcount()%></td>
				<td><%=memberVO.getName() %></td>
				<td width="3"><%=sdf.format(boardVO.getRegDate())%></td>
			</tr>
			</table>
<%
			if (i == 6) {
				break;
			}
		}
	} else {
%>
			<div style="text-align: center; margin-bottom: 20px">No Articles</div>
<%
	}
%>
		</fieldset>
		
		</article>
	</fieldset>
	<jsp:include page="../include/topbar.jsp" />
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>