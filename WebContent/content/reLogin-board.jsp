<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Smog</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<%
	String where = request.getParameter("where");
	String num = request.getParameter("num");
	String boardnum = request.getParameter("boardnum");
	String pageNum = request.getParameter("pageNum");
%>
<body class="popup">
<div class="all">
	<fieldset class="f2">
	<legend><h2 id="login-title">Warning!</h2></legend>
	<form action="" name="frm" method="post">
		<input type="hidden" name="where" value="<%=where%>" />
		<input type="hidden" name="num" value="<%=num%>" />
		<input type="hidden" name="boardnum" value="<%=boardnum%>" />
		<input type="hidden" name="pageNum" value="<%=pageNum%>" />
		<p class="login-text">Password</p>
		<input type="password" name="passwd" placeholder="Insert Password" /><br />
		<div class="frm_b">
			<button type="button" class="login-button" onclick="window.close()" >Cancel</button>
			<button type="button" class="login-button" id="sumt" onclick="reLogin()">Submit</button>
		</div>
	</form>
	</fieldset>
</div>
<script>
	// login에서 loginProcess로 post시 submit 함수
	function reLogin() {
		window.opener.name = "parent";
		frm.target = "parent";
		frm.action = "../content/reLogin-boardProcess.jsp";
		frm.submit();
		window.close();
	}
</script>
</body>
</html>