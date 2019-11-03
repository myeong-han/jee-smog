<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<fieldset class="f1">
		<legend><h1>Supporters</h1></legend>
			<fieldset class="f2-1">
				<h3 style="margin-bottom: 2px;">References</h3>
				<p>Cafe</p><a href="https://cafe.naver.com/zencoding" target="_blank">Zen-Coding</a><br />
				<h3 style="margin-bottom: 2px;">My Web Log</h3>
				<p>Github</p><a href="https://github.com/myeong-han" target="_blank">myeong-han</a><br />
				<p>Tistory</p><a href="https://cod-fact.tistory.com/" target="_blank">Code-Factory</a><br />
				<p>Email</p><a href="mailto:codfact@naver.com" target="_blank">codfact@naver.com</a><br />
				<br />
			</fieldset><br />
		</fieldset>
	</fieldset>
	<jsp:include page="../include/topbar.jsp" />
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>