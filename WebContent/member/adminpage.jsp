<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
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
	
	if (id == null || !id.equals("admin")) {
		response.sendRedirect("../index.jsp");
		return;
	}
	
	String search = request.getParameter("search");
	if (search == null) {
		search = "";
	}
	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null) {
		strPageNum = "1";
	}
	int pageNum = Integer.parseInt(strPageNum);
	
	MemberDao memberDao = MemberDao.getInstance();
	
	int pageSize = 20;
	int startRow = (pageNum-1) * pageSize + 1;
	int count = memberDao.getMemberCount(search);
	
	List<MemberVO> memberList = memberDao.getAllMembers(startRow, pageSize, search);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1>List of Members</h1></legend>
		<form action="dropOutProcess.jsp" name="frm" method="post" >
			<table id="m_information" border="1">
			<tr class="board-th">
				<th>\</th><th>C</th><th>ID</th><th>Name</th><th>Birth</th><th>Gender</th><th>Email</th><th>Reg_date</th><th>Writes</th>
			</tr>
<%
	if (count > 0) {
		for (MemberVO memberVO : memberList) {
%>
			<tr class="content-tr" id="mp" >
				<td class="board-th" id="dtr-i"><img src="../upload/profile/<%=memberVO.getfName()!=null?memberVO.getfName():"default.jpg"%>" height="20"/></td>
				<td class="dtr"><input type="checkbox" name="dropout" value="<%=memberVO.getId() %>" /></td>
				<td class="dtr"><a href="javascript:popupLogin('memberpage.jsp?id=<%=memberVO.getId()%>',1000,1060);"><%=memberVO.getId() %></a></td>
				<td><%=memberVO.getName() %></td>
				<td><%=memberVO.getBirth()!=null?memberVO.getBirth().toString().split(" ")[0]:"-" %></td>
				<td><%=memberVO.getGender()!=null?memberVO.getGender():"-" %></td>
				<td><%=memberVO.getEmail()!=null?memberVO.getEmail():"-" %></td>
				<td><%=memberVO.getRegDate()!=null?sdf.format(memberVO.getRegDate()):"-" %></td>
				<td><%=memberVO.getWrites() %></td>
			</tr>
<%
		}
	} else {
%>
			<tr>
				<td colspan="9">No Members</td>
			</tr>
<%
	}
%>
			</table>
		</form>
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
			%><a href="adminpage.jsp?pageNum=1&search=<%=search%>">[First]</a>
			<a href="adminpage.jsp?pageNum=<%=startPage-pageBlock %>&search=<%=search%>">[Back]</a><%
		}
		
		// 블록의 크기만큼 계산된 스타트페이지와 엔드페이지만큼 반복됨
		for (int i = startPage; i<=endPage; i++){
			if (i == pageNum) {
%>
			<b>
				<a href="adminpage.jsp?pageNum=<%=i%>&search=<%=search%>">[<%=i %>]</a>
			</b>
<%
			} else {
%>
			<a href="adminpage.jsp?pageNum=<%=i%>&search=<%=search%>"><%=i %></a>
<%
			}
		}
		
		// 다음은 엔드페이지가 페이지카운트와 같을때 나타나지 않음
		if (endPage != pageCount){
%>
			<a href="adminpage.jsp?pageNum=<%=endPage+1 %>&search=<%=search%>">[Next]</a>
			<a href="adminpage.jsp?pageNum=<%=pageCount %>&search=<%=search%>">[Last]</a>
<%
		}
	}
%>
			</div>
			<form name="sfrm" id="search-form" action="adminpage.jsp" method="get">
				<input type="text" name="search" class="selector" value="<%=search==null?"":search %>" class="input_box" />
				<button type="submit">Search</button>
				<div>
				<button type="button" onclick="dropOutSubmit()">Drop out selected</button>
				</div>
			</form>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
<script>
	function dropOutSubmit() {
		var result = true;
		result = confirm('Are you sure you want to withdraw the selected members?');
		if (result) {
			frm.submit();
		}
	}
</script>
</body>
</html>