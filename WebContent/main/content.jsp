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
			case "0" : boardAddr = "news"; break;
			case "1" : boardAddr = "community"; break;
			case "2" : boardAddr = "gallery"; break;
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
		<table border="1" id="m_information">
			<tr class="board-th">
				<th class="small-size"><%=boardVO.getNum() %></th><th><h1><%=boardVO.getSubject() %></h1></th><th class="middle-size"><%=sdf.format(boardVO.getRegDate())%></th>
			</tr>
			<tr id="content-page">
				<td colspan="3"><pre id="pre-content" ><%=boardVO.getContent() %></pre></td>
			</tr>
		</table><table border="1" id="m_information">
			<tr class="board-th">
				<th>aaaa</th><th><img src="../upload/profile/<%=memberVO.getfName()!=null?memberVO.getfName():"default.jpg" %>" alt="profileImage" height="100"/></th><th><%=boardVO.getUsername() %></th>
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