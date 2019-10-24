<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[] dropOutIds = request.getParameterValues("dropout");
	
	if (dropOutIds == null || dropOutIds.length == 0) {
%>
		<script>
		alert('Checkbox not selected');
		history.back();
		</script>
<%
		return;
	}
	
	MemberDao memberDao = MemberDao.getInstance();
	for (String dropId : dropOutIds) {
		memberDao.deleteMember(dropId);
	}
%>

<script>
	alert('<%=dropOutIds.length %>개의 아이디가 삭제되었습니다.');
	location.href='adminpage.jsp';
</script>