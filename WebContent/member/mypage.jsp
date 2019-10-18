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
	String[] interesteds = memberVO.getInterested();
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
			<table border="1">
			<caption>회원정보</caption>
			<tr><th>Name</th><td><%=memberVO.getName() %></td></tr>
			<tr><th>Regi-Date</th><td><%=memberVO.getRegDate() %></td></tr>
			<tr><th>Age</th><td><%=memberVO.getAge()!=0?memberVO.getAge():"-" %></td></tr>
			<tr><th>Gender</th><td><%=memberVO.getGender()!=null?memberVO.getGender():"-" %></td></tr>
			<tr><th>Address</th><td><%=memberVO.getAddress()!=null?memberVO.getAddress():"-" %></td></tr>
			<tr><th>TEL</th><td><%=memberVO.getTel()!=null?memberVO.getTel():"-" %></td></tr>
			<tr><th>Phone Number</th><td><%=memberVO.getMtel()!=null?memberVO.getMtel():"-" %></td></tr>
			<tr><th>Birth Day</th><td><%=memberVO.getBirth()!=null?memberVO.getBirth():"-" %></td></tr>
			<tr><th>Interesteds</th><td>
<% 			
		if (interesteds.length != 0) {
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
			out.print("-");
		}
%>
			</td></tr>
			</table>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>