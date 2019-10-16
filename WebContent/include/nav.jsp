<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDao memberDao = MemberDao.getInstance();
	MemberVO memberVO = memberDao.getMember("imagetester");
%>
<nav>
	<fieldset class="f0" id="navf">
	<ul>
		<li><a href="../index.jsp"><img class="nav_btn" src="../images/include/home_button.png" alt="home_button.png" /></a></li>
		<li><a href="../news/news.jsp"><img class="nav_btn" src="../images/include/news_button.png" alt="news_button.png" /></a></li>
		<li><a href="../community/community.jsp"><img class="nav_btn" src="../images/include/community_button.png" alt="community_button.png" /></a></li>
		<li><a href="../gallery/gallery.jsp"><img class="nav_btn" src="../images/include/gallery_button.png" alt="gallery_button.png" /></a></li>
		<li><a href="#"><img class="nav_btn" src="../images/include/support_button.png" alt="support_button.png" /></a></li>
	</ul>
	<span id="s-hyp">
	<%
		if (id == null) {
	%>
			<div id="hyp1" class="hyp">
			<a href="javascript:popupLogin('../member/login.jsp',350,200);">Login</a> | 
			<a href="../member/join.jsp">Join</a>
			</div>
	<%
		} else {
	%>
			<span id="crop"><img src="../upload/profile/<%=memberVO.getfName()==null?"default.jpg":memberVO.getfName() %>" alt="profileImage" /></span>
			<div id="hyp2" class="hyp">
			<span id="welcome">
			<%=memberVO.getName() %>(<%=id %>)님,<br />어서오세요<br />
			</span>
		<%
			if (id!=null && id.equals("admin")) {
		%>
				<a href="../selfpage/adminpage.jsp">Admin</a>
		<%
			} else {
		%>
				<a href="../selfpage/mypage.jsp">My page</a>
		<%
			}
		%>
			 | <a href="../member/logoutProcess.jsp">Logout</a>
			</div>
	<%
		}
	%>
	</span>
	</fieldset>
</nav>