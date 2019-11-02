<%@page import="com.exam.dao.BoardDao"%>
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
	String id = (String)session.getAttribute("id");
	
	if (id == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
	
	MemberVO memberVO = new MemberVO();
	MemberDao memberDao = MemberDao.getInstance();
	memberVO = memberDao.getMember(id);
	
	BoardDao boardDao = BoardDao.getInstance();
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1>Your Information</h1></legend>
			<table id="information" border="1">
			<caption><img id="inf-profile" src="../upload/profile/<%=memberVO.getfName()==null?"default.jpg":memberVO.getfName() %>" alt="profileImage" /></caption>
			<tr><th class="board-th2">Registered Date</th><td><%=memberVO.getRegDate().toString().split(" ")[0] %></td></tr>
			<tr><th class="board-th2">Nick Name</th><td><%=memberVO.getName() %></td></tr>
			<tr><th class="board-th2">Age</th><td><%=memberVO.getAge()!=0?"<span>만</span> "+memberVO.getAge()+"<span>세</span>":"" %></td></tr>
			<tr><th class="board-th2">Gender</th><td><%=memberVO.getGender()!=null&&!memberVO.getGender().equals("")?memberVO.getGender():"" %></td></tr>
			<tr><th class="board-th2">Address</th><td><%=memberVO.getAddress()!=null&&!memberVO.getGender().equals("")?memberVO.getAddress():"" %></td></tr>
			<tr><th class="board-th2">TEL</th><td><%=memberVO.getTel()!=null&&!memberVO.getGender().equals("")?memberVO.getTel():"" %></td></tr>
			<tr><th class="board-th2">Phone Number</th><td><%=memberVO.getMtel()!=null&&!memberVO.getGender().equals("")?memberVO.getMtel():"" %></td></tr>
			<tr><th class="board-th2">Birth Day</th><td><%=memberVO.getBirth()!=null?memberVO.getBirth().toString().split(" ")[0]:"" %></td></tr>
			<tr><th class="board-th2">Interested</th><td>
<% 			
		String[] interesteds = null;
		if ((interesteds = memberVO.getInterested()) != null && !interesteds.equals("")) {
			int i = 0;
			for(String interest : interesteds) {
				i++;
				out.print(interest);
				if (i == interesteds.length) {
					break;
				}
				out.print(", ");
			}
		} else {
			out.print("");
		}
%>
			</td></tr>
			<tr><th class="board-th2">Writes</th><td><%=boardDao.getWriteCount(id)%></td></tr>
			</table>
			<button type="button" onclick="popupLogin('reLogin.jsp?where=update',350,165)">Modify Information</button>
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
