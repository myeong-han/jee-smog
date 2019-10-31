<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// update 혹은 delete를 판단하기 위한 파라미터값 가져오기 
	String where = request.getParameter("where");
	
	// 세션의 아이디와 재입력받은 비밀번호 가져오기
	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	
	MemberDao memberDao = MemberDao.getInstance();
	
	int userCheck = memberDao.userCheck(id, passwd);
%>
	<script>
	var addr = '../member/mypage.jsp';
	</script>
<%
	if (userCheck == 1) { 	// 아이디와 비밀번호가 일치하는 경우
%>
		<script>
		var result = false;		// delete confirm용 js변수 선언
		</script>
<%
		if (where.equals("update")) {	// update의 경우 주소 입력
%>
			<script>
			addr = '../member/updateMember.jsp';
			</script>
<%
		} else if (where.equals("delete")) {	// delete의 경우
%>
			<script>						// js confirm으로 재차 확인
			result = confirm('Are you sure you want to drop out?');
		
			if (result) {
				addr = '../member/deleteMember.jsp'; // 주소 입력
			}
			</script>
<%
		}
%>
		<script>
		location.href = addr;
		</script>
<%
	} else {							// passwd가 세션id와 일치하지 않는 경우 이전페이지로
%>
		<script>
		alert('Password does not match');
		location.href = addr;
		</script>
<%
	}
%>