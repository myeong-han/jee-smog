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
	String boardnum = (String)session.getAttribute("boardnum");
%>
<body class="popup">
<div class="all">
	<fieldset class="f2">
	<legend><h2 id="login-title">Log In</h2></legend>
	<form action="" name="frm" method="post">
		<input type="hidden" name="boardnum" value="<%=boardnum %>" />
		<p class="login-text">ID</p>
		<input type="text" name="id" placeholder="Insert ID here" /><br />
		<p class="login-text">Password</p>
		<input type="password" name="passwd" placeholder="Insert Password" /><br />
		<div class="frm_b">
			<p id="rmm" class="login-text"><input type="checkbox" name="rememberMe" value="true" />Remember Me</p>
			<button type="button" class="login-button" onclick="window.close()" >Cancel</button>
			<button type="button" class="login-button" id="sumt" onclick="login()">Submit</button>
		</div>
	</form>
	</fieldset>
</div>
<script>
	// login에서 loginProcess로 post시 submit 함수
	function login() {
		window.opener.name = "parent";
		frm.target = "parent";
		frm.action = "../member/loginProcess.jsp";
		frm.submit();
		window.close();
	}
</script>
</body>
</html>