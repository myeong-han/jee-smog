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
	String id = (String)session.getAttribute("id");
	
	if (id == null || !id.equals("admin")) {
		response.sendRedirect("../index.jsp");
		return;
	}
	
	MemberDao memberDao = MemberDao.getInstance();
	List<MemberVO> memberList = memberDao.getAllMembers();
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1>List of Members</h1></legend>
			<table id="m_information" border="1">
			<tr class="board-th">
				<th>Profile</th><th>Reg_date</th><th>ID</th><th>Name</th><th>Birth</th><th>Gender</th><th>Email</th><th>Writes</th>
			</tr>
<%
		for (MemberVO memberVO : memberList) {
%>
			<tr>
				<td><img src="../upload/profile/<%=memberVO.getfName()!=null?memberVO.getfName():"default.jpg"%>" height="20"/></td>
				<td><%=memberVO.getRegDate()!=null?memberVO.getRegDate().toString().split(" ")[0]:"-" %></td>
				<td><%=memberVO.getId() %></td>
				<td><%=memberVO.getName() %></td>
				<td><%=memberVO.getBirth()!=null?memberVO.getBirth().toString().split(" ")[0]:"-" %></td>
				<td><%=memberVO.getGender()!=null?memberVO.getGender():"-" %></td>
				<td><%=memberVO.getEmail()!=null?memberVO.getEmail():"-" %></td>
				<td><%=memberVO.getWrites() %></td>
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