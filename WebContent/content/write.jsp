<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Special People's Place</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	if (id == null) {
		%> <script>
		alert('If you want to write,\nyou have to log in.');
		location.href='../index.jsp';
		</script><%
		return;
	}
	
	String boardnum = request.getParameter("boardnum");
	session.setAttribute("boardnum", boardnum);
	String boardAddr = "";
	if (boardnum != null) {
		switch (boardnum) {
			case "1" : boardAddr = "news"; break;
			case "2" : boardAddr = "community"; break;
			case "3" : boardAddr = "gallery"; break;
			default : boardAddr = "main";
		}
	} else {
		boardAddr = "main";
	}
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	// 보드넘 기준 주소의 페이지넘 화면
	String loc = "../"+boardAddr+"/"+boardAddr+".jsp?pageNum="+pageNum;

%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1><%=boardAddr.substring(0, 1).toUpperCase()+boardAddr.substring(1) %></h1></legend>
			<form action="writeProcess.jsp" name="wfrm" method="post" onsubmit="return checkInsBoard()" enctype="multipart/form-data">
			<input type="hidden" name="boardnum" value="<%=boardnum%>" />
			<table border="1" id="m_content" style="margin-bottom: 25px">
				<tr>
					<th width="200" class="board-th">Subject</th><td id="content-page" colspan="2"><input type="text" name="subject" style="font-size: 30px; padding: 10px; padding-left: 30px; padding-right: 30px; margin: 10px; width: 640px;" /></td>
				</tr>
				<tr>
					<th class="board-th">Content</th><td id="content-page" colspan="2"><textarea rows="22" cols="64" name="content" style="background-color: #DDDDDD; font-size: 20px; padding: 20px; margin-top: 10px; margin-bottom: 4px;"></textarea></td>
				</tr>
				<tr>
					<th class="board-th">File</th><td id="f-cont"><input type="file" name="filename1" id="input-file" style="font-size: 20px; margin-top: 7px; width: 540px;"/></td>
					<td id="content-page" width="150"><button type="button" onclick="addFileElement();" style="font-size: 18px">Add File</button></td>
				</tr>
			</table>
			<button type="reset">Reset</button>
			<button type="submit">Write</button>
			</form>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
<script>
//board Write시 파일 추가 함수
var num = 2;
function addFileElement() {
	if (num > 5) {
		alert('Up to 5 uploads are possible.');
		return;
	}
	// id속성값이 file_container인 div요소의 참조 구하기
	var fileContainer = document.getElementById('f-cont');
	// div요소에 file타입 input요소를 추가하기
	var input = '<br /><input type="file" name="filename'+num+'" id="input-file" style="font-size: 20px; margin-top: 7px; width: 540px;">';
	num++;	// 다음번 추가를 위해 값 1 증가
	fileContainer.innerHTML += input;
}

//board Write시 submit 이벤트로 호출되는 함수
function checkInsBoard() {
	if (wfrm.subject.value.length == 0) {
		alert('Entering a subject is a requirement.');
		return false;
	}
	if (wfrm.content.value.length == 0) {
		alert('You must write at least one character.');
		return false;
	}
}
</script>
</body>
</html>