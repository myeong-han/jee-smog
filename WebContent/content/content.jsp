<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		pageNum = "1";
	}
	String strNum = request.getParameter("num");
	
	// 보드넘 기준 주소의 페이지넘 화면
	String loc = "../"+boardAddr+"/"+boardAddr+".jsp?pageNum="+pageNum;
	
	if(strNum == null || strNum.equals("")) {
		response.sendRedirect(loc);
		return;
	}
	int num = Integer.parseInt(strNum);
	
	BoardDao boardDao = BoardDao.getInstance();
	
	BoardVO boardVO = boardDao.getBoard(num);
	List<BoardVO> rownumBoards = (ArrayList<BoardVO>)session.getAttribute(boardAddr+"Rownums");
	
	String afSubj = "No article";
	String bfSubj = "No article";
	int afNum = -1;
	int bfNum = -1;
	
	int rownum = 0;
	for (BoardVO vo : rownumBoards) {
		if (vo.getNum() == num) {
			rownum = vo.getRownum();
			break;
		}
	}
	for (BoardVO vo : rownumBoards) {
		if (vo.getRownum() == rownum+1) {
			bfSubj = vo.getSubject();
			bfNum = vo.getNum();
		}
		if (vo.getRownum() == rownum-1) {
			afSubj = vo.getSubject();
			afNum = vo.getNum();
		}
	}
	
	MemberDao memberDao = MemberDao.getInstance();
	MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd\nhh:mm:ss");
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
				<a href="#"><%=boardVO.getUsername() %></a>'s writing
			</th>
			</tr>
			<tr id="content-page">
				<td colspan="4" id="pre-content">
					<pre><%=boardVO.getContent() %></pre>
				</td>
			</tr>
		</table>
		<table border="1" id="m_content" class="ctnt">
			<tr class="content-tr2" onclick="<%=afNum==-1?"alert('No Article')":"location.href='content.jsp?boardnum="+boardnum+"&num="+afNum+"&pageNum="+pageNum+"'"%>">
				<th width="100">After</th>
				<th><%=afSubj%></th>
				<th width="30">▲</th>
			</tr>
			<tr class="content-tr2" onclick="<%=bfNum==-1?"alert('No Article')":"location.href='content.jsp?boardnum="+boardnum+"&num="+bfNum+"&pageNum="+pageNum+"'"%>">
				<th>Before</th>
				<th><%=bfSubj%></th>
				<th>▼</th>
			</tr>
		</table>
		<button type="button" onclick="location.href='#'">Edit</button>
		<button type="button" onclick="popupLogin('reLogin.jsp?where=delBoard&num=<%=num%>',350,165)">Del</button>
		<button type="button" onclick="location.href='#'">Reply</button>
		<button type="button" onclick="location.href='<%=loc%>'">List</button>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>