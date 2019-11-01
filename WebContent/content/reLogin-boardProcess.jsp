<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String boardnum = request.getParameter("boardnum");
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	
	// delete를 판단하기 위한 파라미터값 가져오기 
	String where = request.getParameter("where");
	
	// 세션의 아이디와 재입력받은 비밀번호 가져오기
	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	
	MemberDao memberDao = MemberDao.getInstance();
	
	int userCheck = memberDao.userCheck(id, passwd);
%>
	<script>
	var addr = '../content/content.jsp?boardnum='+<%=boardnum%>+'&num='+<%=num%>+'&pageNum='+<%=pageNum%>;
	</script>
<%
	if (userCheck == 1) { 	// 아이디와 비밀번호가 일치하는 경우
%>
		<script>
		var result = false;		// delete confirm용 js변수 선언
		</script>
<%
		if (where.equals("editBoard")) {
%>
 			<script>
 			addr = '../content/updateContent.jsp?num='+<%=num%>;
 			</script>
<%
		} else if (where.equals("delBoard")) {	// update의 경우 주소 입력
%>
			<script>
			result = confirm('Are you sure you want to delete this content?');
			
			if (result) {
				addr = '../content/deleteContent.jsp?num='+<%=num%>; // 주소 입력
			}
			</script>
<%
		}
	} else {							// passwd가 세션id와 일치하지 않는 경우 이전페이지로
%>
		<script>
		alert('Password does not match');
		</script>
<%
	}
%>
<script>
	location.href = addr;
</script>
