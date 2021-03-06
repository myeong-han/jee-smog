<%@page import="com.exam.Tools"%>
<%@page import="com.exam.vo.MemberVO"%>
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
		MemberVO memberVO = memberDao.getMember(dropId);
		
		Tools.delFileToProfile(application, memberVO);
		
		memberDao.deleteMember(dropId);
	}
%>

<script>
	alert('<%=dropOutIds.length %> IDs deleted');
	location.href='adminpage.jsp';
</script>