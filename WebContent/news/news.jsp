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
	
	String id = (String)session.getAttribute("id");
	
	String boardnum = "1";
	session.setAttribute("boardnum", boardnum);
	
	String search = request.getParameter("search");
	String whatS = request.getParameter("what_s");
	// search가 null이거나 ""이면 whatS도 ""로 만듦
	if (search == null || search.equals("")) {
		search = "";
		whatS = "";
	}
	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null || strPageNum.equals("")) {
		strPageNum = "1";
	}
	int pageNum = Integer.parseInt(strPageNum);
	
	BoardDao boardDao = BoardDao.getInstance();
	
	int pageSize = 20;
	int startRow = (pageNum-1) * pageSize + 1;
	int intBoardnum = Integer.parseInt(boardnum);
	
	int count = boardDao.getBoardCount(intBoardnum, whatS, search);
	MemberDao memberDao = MemberDao.getInstance();
	List<BoardVO> boardList = boardDao.getBoards(intBoardnum, startRow, pageSize, whatS, search);
	
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1><%=search.equals("")?"News":"News: "+count+"Results"%></h1></legend>
		<table id="m_information" border="1">
			<tr class="board-th">
				<th>No</th><th class="subject">Title</th><th>Writer</th><th>Date</th><th>Reads</th>
			</tr>
<%
	if (count > 0) {
		for (BoardVO boardVO : boardList) {
			MemberVO memberVO = memberDao.getMember(boardVO.getUsername());
%>
			<tr class="content-tr" onclick="location.href='../content/content.jsp?boardnum=<%=boardnum%>&num=<%=boardVO.getNum()%>&pageNum=<%=pageNum%>'">
				<td><%=boardVO.getNum() %></td>
				<td class="subject">
<%
				if (boardVO.getReLev() > 0) {
%>
					<img src="../images/content/gap.png" width="<%=(boardVO.getReLev()-1)*10%>" />
					<img src="../images/content/re3.png"/>
<%
				}
%>
					<%=boardVO.getSubject() %>
				</td>
				<td><%=memberVO.getName() %></td>
				<td><%=boardVO.getRegDate().toString().split(" ")[0] %></td>
				<td><%=boardVO.getReadcount()%></td>
			</tr>
<%
		}
	} else {
%>
			<tr>
				<td colspan="5">No Articles</td>
			</tr>
<%
	}
%>
		</table>
			
		<div id="page_control">
<%
	if (count > 0) {
		int pageCount = count/pageSize + (count%pageSize==0 ? 0:1);
		
		// 페이지블록 크기 설정
		int pageBlock = 5;
		
		int startPage = (pageNum-1)/pageBlock * pageBlock + 1;
		
		// 끝페이지 번호 구하기
		int endPage = startPage + pageBlock-1;
		endPage = endPage > pageCount ? pageCount : endPage;
		
		// 이전은 스타트페이지가 다음 화면일 때 부터 나타남
		if (startPage != 1){
%>
			<a href="news.jsp?pageNum=1&what_s=<%=whatS%>&search=<%=search%>">[First]</a>
			<a href="news.jsp?pageNum=<%=startPage-pageBlock %>&what_s=<%=whatS%>&search=<%=search%>">[Back]</a>
<%
		}
		
		// 블록의 크기만큼 계산된 스타트페이지와 엔드페이지만큼 반복됨
		for (int i = startPage; i<=endPage; i++){
			if (i == pageNum) {
%>
			<b>
				<a href="news.jsp?pageNum=<%=i%>&what_s=<%=whatS%>&search=<%=search%>">[<%=i %>]</a>
			</b>
<%
			} else {
%>
			<a href="news.jsp?pageNum=<%=i%>&what_s=<%=whatS%>&search=<%=search%>"><%=i %></a>
<%
			}
		}
		
		// 다음은 엔드페이지가 페이지카운트와 같을때 나타나지 않음
		if (endPage != pageCount){
%>
			<a href="news.jsp?pageNum=<%=endPage+1 %>&what_s=<%=whatS%>&search=<%=search%>">[Next]</a>
			<a href="news.jsp?pageNum=<%=pageCount %>&what_s=<%=whatS%>&search=<%=search%>">[Last]</a>
<%
		}
	}
%>
		</div>
		<form name="sfrm" id="search-form" action="news.jsp" method="get" onsubmit="return checkSearch()">
			<select name="what_s" id="input-what">
<%
			if (whatS == null || whatS.equals("")) {
%>
				<option value="un" disabled selected>Search to</option>
				<option value="subject">Title</option>
				<option value="username">Writer</option>
<%
			} else {
%>
				<option value="un" disabled>Search to</option>
				<option value="subject" <%=whatS.equals("subject")?"selected":"" %>>Title</option>
				<option value="username" <%=whatS.equals("username")?"selected":"" %>>Writer</option>
<%
			}
%>
			</select>
			<input type="text" name="search" value="<%=search==null?"":search %>" class="input_box" />
			<button type="submit">Search</button>
<%
		if (id != null && id.equals("admin")) { 
%>
			<div>
				<button type="button" onclick="location.href='../content/write.jsp?boardnum='+<%=boardnum%>">Write</button>
			</div>
<%
		}
%>
		</form>
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