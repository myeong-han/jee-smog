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
	
	String[] inters = null;
	String[] checker = {"","","","",""};
	if ((inters = memberVO.getInterested()) != null) {
		int i = 0;
		for (String inter : inters) {
			switch(inter) {
				case "vape" : 		checker[0] = "checked"; break;
				case "motocycle" : 	checker[1] = "checked"; break;
				case "cycle" : 		checker[2] = "checked"; break;
				case "camera" : 	checker[3] = "checked"; break;
				case "fishing_gear" : checker[4] = "checked"; break;
			}
		}
	}
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<fieldset class="f1">
		<legend><h1>Modify Information</h1></legend>
		<form action="updateMemberProcess.jsp" id="frm" method="post" onsubmit="return updateCheck();" enctype="multipart/form-data">
			<fieldset class="f2">
				<br />
				Profile Image<br />
				<input type="file" name="f_name" id="input-file" class="input-width" /><br /><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				ID<br />
				<input type="text" name="id" id="input-id" maxlength="12" value="<%=memberVO.getId() %>" readonly /><br />
				<p id="id-check" class="input-check">&nbsp;</p><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				Password<br />
				<input type="password" name="passwd" id="input-passwd" class="cp" placeholder="Insert new Password" maxlength="15" /><br />
				<input type="password" name="confilm" id="confilm-passwd" class="cp" placeholder="Confirm it" maxlength="15" /><br />
				<p id="passwd-check" class="input-check">&nbsp;</p><br />
				<span class="notnull">*&nbsp;&nbsp;</span>
				Nick Name<br />
				<input type="text" name="name" id="input-name" placeholder="Insert new name" maxlength="10" value="<%=memberVO.getName() %>" /><br />
				<p id="name-check" class="input-check">&nbsp;</p><br />
				Birth<br />
				<input type="date" name="birth_" id="birth" class="input-width" value="<%=memberVO.getBirth()!=null?memberVO.getBirth().toString().split(" ")[0]:"" %>" /><br /><br />
				Gender<br /> <input type="radio" name="gender" value="male" <%=memberVO.getGender()!=null&&memberVO.getGender().equals("male")?"checked":""%>/><span>Male</span>
				<input type="radio" name="gender" value="female" <%=memberVO.getGender()!=null&&memberVO.getGender().equals("female")?"checked":""%>/><span>Female</span>
				<input type="radio" name="gender" value="other" <%=memberVO.getGender()!=null&&memberVO.getGender().equals("other")?"checked":""%>/><span>Other</span><br /><br />
				E-Mail<br />
				<input type="email" name="email" placeholder="example@examail.com" value="<%=memberVO.getEmail()!=null?memberVO.getEmail():"" %>" /><br /><br />
				Address<br />
				<input type="text" name="address" placeholder="Insert your home address" value="<%=memberVO.getAddress()!=null?memberVO.getAddress():"" %>" /><br /><br />
				Tel<br />
				<input type="tel" name="tel" placeholder="Telephone number" value="<%=memberVO.getTel()!=null?memberVO.getTel():"" %>" /><br /><br />
				Phone Number<br />
				<input type="tel" name="mtel" placeholder="Mobilephone number" value="<%=memberVO.getMtel()!=null?memberVO.getMtel():"" %>" /><br /><br />
				Choose Interested<br />
				<input type="checkbox" name="interested" value="vape" <%=checker[0] %> /><span>Vape</span>
				<input type="checkbox" name="interested" value="motocycle" <%=checker[1] %> /><span>Motocycle</span>
				<input type="checkbox" name="interested" value="cycle" <%=checker[2] %> /><span>Cycle</span><br />
				<input type="checkbox" name="interested" value="camera" <%=checker[3] %> /><span>Camera</span>
				<input type="checkbox" name="interested" value="fishing_gear" <%=checker[4] %> /><span>Fishing Gear</span><br /><br />
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