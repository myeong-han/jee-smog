<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorLocation = (String)session.getAttribute("errorLocation");
%>
<script>
	alert('The file size is bigger than the limit.(100mb)');
	location.href="../"+<%=errorLocation%>;
</script>