<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
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
	String boardnum = request.getParameter("boardnum");
	String boardAddr = "";
	if (boardnum != null) {
		switch (boardnum) {
			case "1" : boardAddr = "news"; break;
			case "2" : boardAddr = "community"; break;
			case "3" : boardAddr = "gallery"; break;
			default : boardAddr = "main";
		}
	} else {
		boardAddr = "main";
	}
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "";
	}
	String strNum = request.getParameter("num");
	if(strNum == null || strNum.equals("")) {
		response.sendRedirect("../"+boardAddr+"/"+boardAddr+".jsp?pageNum="+pageNum);
		return;
	}
	int num = Integer.parseInt(strNum);
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardVO boardVO = boardDao.getBoard(num);
	MemberDao memberDao = MemberDao.getInstance();
	MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1><%=boardAddr.substring(0, 1).toUpperCase()+boardAddr.substring(1) %></h1></legend>
		<table border="1" id="m_content">
			<tr class="board-th">
				<th rowspan="2" width="60"><%=boardVO.getNum() %></th>
				<th rowspan="2" width="110">
					<img src="../upload/profile/<%=memberVO.getfName()!=null?memberVO.getfName():"default.jpg" %>"
					alt="profileImage" height="100" style="padding-top: 5px;"/>
				</th>
				<th id="pfs">
					<h1 style="margin: 0px; font-size: -webkit-xxx-large;"><%=boardVO.getSubject() %></h1>
				</th>
				<th rowspan="2" width="100"><%=sdf.format(boardVO.getRegDate())%></th>
			</tr>
			<tr class="board-th">
			<th id="pfn">
				<a href="#"><%=boardVO.getUsername() %></a>님의 글
			</th>
			</tr>
			<tr id="content-page">
				<td colspan="4" id="pre-content">
					<pre><%=boardVO.getContent() %></pre>
				</td>
			</tr>
		</table><table border="1" id="m_content">
			<tr class="content-tr2">
				<th width="80">이전글</th>
				<th>bbbbbbbbbbbb</th>
				<th width="30">▲</th>
			</tr>
			<tr class="content-tr2">
				<th>다음글</th>
				<th>cccccccccccc</th>
				<th>▼</th>
			</tr>
		</table>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>