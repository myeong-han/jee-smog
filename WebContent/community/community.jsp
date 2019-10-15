<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Special People's Place</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<table border="1">
		<tr>
			<th>aaa</th>
			<th>bbb</th>
			<th>ccc</th>
			<th>aaa</th>
			<th>bbb</th>
			<th>ccc</th>
			<th>aaa</th>
			<th>bbb</th>
			<th>aaa</th>
			<th>bbb</th>
		</tr>
		<%
		for(int i=0; i<10; i++) {
			%>
			<tr>
			<%
			for(int j=0; j<10; j++) {
				%>
				<td><%=i %>, <%=j %></td>
				<%
			}
			%>
			</tr>
			<%
		}
		%>
		</table>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>