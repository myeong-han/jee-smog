<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dup Check</title>
</head>
<body>
<%
	String id = request.getParameter("id");
%>
<input type="text" name="dup" value="<%=id %>" /> <button type="button">submit</button><br />
</body>
</html>