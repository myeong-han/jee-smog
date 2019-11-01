<%@page import="com.exam.Tools"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDao memberDao = MemberDao.getInstance();
	MemberVO memberVO = memberDao.getMember(id);
	
	String boardName = request.getServletPath().toString().split("/")[1];		// nav 이미지버튼 검증용
	String pageName = request.getServletPath().toString().split("/")[2];	// nav 하이퍼링크 검증용
	String h = "hover";
	String b = "button";
	
	String boardnum = request.getParameter("boardnum");
	if (boardnum != null) {
		boardName = Tools.getBoardName(boardnum);
	}
%>
<nav>
	<fieldset class="f0" id="navf">
	<ul>
		<li>
			<a href="../index.jsp">
			<img id="home-btn" class="nav_btn" src="../images/include/home_button.png" alt="home_button.png" />
			</a>
		</li>
		<li>
			<a href="../news/news.jsp">
			<img id="news-btn" class="nav_btn" src="../images/include/news_<%=boardName.equals("news")?h:b%>.png" alt="news_button.png" />
			</a>
		</li>
		<li>
			<a href="../community/community.jsp">
			<img id="comm-btn" class="nav_btn" src="../images/include/community_<%=boardName.equals("community")?h:b%>.png" alt="community_button.png" />
			</a>
		</li>
		<li>
			<a href="../gallery/gallery.jsp">
			<img id="gall-btn" class="nav_btn" src="../images/include/gallery_<%=boardName.equals("gallery")?h:b%>.png" alt="gallery_button.png" />
			</a>
		</li>
		<li>
			<a href="../supporter/supporter.jsp">
			<img id="supp-btn" class="nav_btn" src="../images/include/supporter_<%=boardName.equals("supporter")?h:b%>.png" alt="support_button.png" />
			</a>
		</li>
	</ul>
	<span id="s-hyp">
<%
		if (id == null) { // 로그인 안한경우
%>
			<div id="hyp1" class="hyp">
			<a href="javascript:popupLogin('../member/login.jsp',350,210);">Login</a> | 
			<a href="../member/join.jsp" <%=pageName.equals("join.jsp")?"style=\"color: #EFEFEF\"":""%>>Join</a>
			</div>
<%
		} else {		  // 로그인 한 경우
%>
			<div id="crop"><img src="../upload/profile/<%=memberVO.getfName()==null?"default.jpg":memberVO.getfName() %>" alt="profileImage" /></div>
			<div id="hyp2" class="hyp">
			<span id="welcome">
			<%=memberVO.getName() %>(<%=id %>)님,<br />어서오세요<br />
			</span>
<%
			if (id.equals("admin")) {	// 관리자 계정일 경우
%>
				<a href="../member/adminpage.jsp" <%=pageName.equals("adminpage.jsp")?"style=\"color: #EFEFEF\"":""%>>Admin</a>
<%
			} else {					// 일반 계정일 경우
%>
				<a href="../member/mypage.jsp" <%=pageName.equals("mypage.jsp")?"style=\"color: #EFEFEF\"":""%>>My page</a>
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