<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String rememberMe = request.getParameter("rememberMe");
	
	MemberDao memberDao = MemberDao.getInstance();
	
	
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
	// 보드넘 기준 주소의 페이지넘 화면
	String loc = "../"+boardAddr+"/"+boardAddr+".jsp?pageNum="+pageNum;
	
	
	int userCheck = memberDao.userCheck(id, passwd);
	
	if (userCheck == 1) { // 로그인 가능
		session.setAttribute("id", id);
		
		if (rememberMe != null && rememberMe.equals("true")) {
			Cookie cookie = new Cookie("id",id);
			cookie.setMaxAge(60*10);// 초단위 : 10분
			cookie.setPath("/"); // 쿠키의 패스정보를 루트로 설정 : 최상위 디렉토리 : 어떤 페이지든 접근 가능
			response.addCookie(cookie); // response시 쿠키정보를 같이 응답함
		}
	
		// index.jsp로 이동
		response.sendRedirect(loc);
		
	} else if (userCheck==0){ // 패스워드 틀림
		%> <script>
		alert('Password does not match');
		location.href='<%=loc%>';
		</script><%
	} else { // userCheck == -1 (아이디 존재하지않음)
		%> <script>
		alert('ID is missing');
		location.href='<%=loc%>';
		</script><%
	}
%>