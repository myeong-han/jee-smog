<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Smog</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
<div class="all">
	<fieldset class="f2">
	<legend><h2 id="login-title">Log In</h2></legend>4--+
	<form action="" name="frm" method="post">
		<p class="login-text">ID</p>
		<input type="text" name="id" placeholder="Insert ID here" /><br />
		<p class="login-text">Password</p>
		<input type="password" name="passwd" placeholder="Insert Password" /><br />
		<div class="frm_b">
			<button type="button" class="login-button" onclick="history.back();">Back</button>
			<button type="button" class="login-button" id="sumt" onclick="login();">Submit</button>
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