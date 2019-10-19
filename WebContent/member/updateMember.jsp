<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<%
	String id = (String)session.getAttribute("id");
	MemberVO memberVO = new MemberVO();
	MemberDao memberDao = MemberDao.getInstance();
	memberVO = memberDao.getMember(id);
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<fieldset class="f1">
		<legend><h1>Modify Information</h1></legend>
		<form action="joinProcess.jsp" id="frm" method="post" onsubmit="return joinCheck();" enctype="multipart/form-data">
			<fieldset class="f2">
				<br />
				Profile Image<br />
				<input type="file" name="f_name" id="input-file" class="input-width" /><br /><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				ID<br />
				<input type="text" name="id" id="input-id" placeholder="Insert ID here" maxlength="12" value="<%=memberVO.getId() %>" readonly /><br />
				<p id="id-check" class="input-check">&nbsp;</p><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				Password<br />
				<input type="password" name="passwd" id="input-passwd" class="cp" placeholder="Insert Password" maxlength="15" /><br />
				<input type="password" name="confilm" id="confilm-passwd" class="cp" placeholder="Confilm it" maxlength="15" /><br />
				<p id="passwd-check" class="input-check">&nbsp;</p><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				Nickname<br />
				<input type="text" name="name" id="input-name" placeholder="What's your Nickname?" maxlength="10" /><br />
				<p id="name-check" class="input-check">&nbsp;</p><br />
				Birth<br />
				<input type="date" name="birth_" id="birth" class="input-width" /><br /><br />
				Gender<br /> <input type="radio" name="gender" value="male" checked /><span>Male</span>
				<input type="radio" name="gender" value="female" /><span>Female</span>
				<input type="radio" name="gender" value="other" /><span>Other</span><br /><br />
				E-Mail<br />
				<input type="email" name="email" placeholder="example@examail.com" /><br /><br />
				Address <br />
				<input type="text" name="address" placeholder="Insert your home address" /><br /><br />
				Tel <br />
				<input type="tel" name="tel" placeholder="Telephone number" /><br /><br />
				Mobile <br />
				<input type="tel" name="mtel" placeholder="Mobilephone number" /><br /><br />
				Choose Interested <br />
				<input type="checkbox" name="interested" value="vape" checked /><span>Vape</span>
				<input type="checkbox" name="interested" value="motocycle" /><span>Motocycle</span>
				<input type="checkbox" name="interested" value="cycle" /><span>Cycle</span><br />
				<input type="checkbox" name="interested" value="camera" /><span>Camera</span>
				<input type="checkbox" name="interested" value="fishing_gear" /><span>Fishing Gear</span><br /><br />
			</fieldset><br />
			<div class="frm_b">
			<button type="button" onclick="history.back();">Back</button>
			<button type="reset" >Reset</button>
			<button type="submit" id="sumt" >Submit</button>
			</div>
		</form>
		</fieldset>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
</body>
</html>