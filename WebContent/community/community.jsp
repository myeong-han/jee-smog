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
	String id = (String)session.getAttribute("id");
	
	BoardDao boardDao = BoardDao.getInstance();
	List<BoardVO> boardList = boardDao.getBoards(1);
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1>Community</h1></legend>
			<table id="m_information" border="1">
			<tr class="board-th">
				<th>Num</th><th id="subject">Subject</th><th>Name</th><th>Date</th><th>Reads</th>
			</tr>
<%
		for (BoardVO boardVO : boardList) {
%>
			<tr>
				<th><%=boardVO.getNum() %></th>
				<th><%=boardVO.getSubject() %></th>
				<th><%=boardVO.getUsername() %></th>
				<th><%=boardVO.getRegDate().toString().split(" ")[0] %></th>
				<th><%=boardVO.getReadcount() %></th>
			</tr>
<%
		}
%>
			</table>
			<button type="button" onclick="popupLogin('reLogin.jsp?where=delete',350,165)">Drop out</button>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>