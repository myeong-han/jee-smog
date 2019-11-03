<%@page import="com.exam.vo.AttachVO"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.io.File"%>
<%@page import="com.exam.Tools"%>
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
	
	String boardnum = Tools.getBoardnum(session, request);
	String boardName = Tools.getBoardName(boardnum);
	
	String pageNum = request.getParameter("pageNum");
	
	// 보드넘 기준 주소의 페이지넘 화면
	String loc = Tools.getBoardLocation(boardName, pageNum);
	
	String id = (String)session.getAttribute("id");
	if (id == null) {
		%> <script>
		alert('If you want to write,\nyou have to log in.');
		location.href= '<%=loc%>';
		</script><%
		return;
	}
	
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao boardDao = BoardDao.getInstance();
	BoardVO boardVO = boardDao.getBoard(num);
	
	AttachDao attachDao = AttachDao.getInstance();
	int fileCount = attachDao.getAttachCount(num);
	List<AttachVO> attachList = attachDao.getAttachsByBno(num);
%>
<body>
	<div id="all">
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	<fieldset class="f0">
		<article>
		<fieldset class="f1">
		<legend><h1><%=boardName.substring(0, 1).toUpperCase()+boardName.substring(1) %></h1></legend>
			<form action="updateContentProcess.jsp" name="wfrm" method="post" onsubmit="return checkInsBoard()" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=num%>" />
			<input type="hidden" name="boardnum" value="<%=boardnum%>" />
			<table border="1" id="m_content" style="margin-bottom: 25px">
				<tr>
					<th width="200" class="board-th">Subject</th>
					<td id="content-page" colspan="2">
					<input type="text" name="subject" value="<%=boardVO.getSubject()%>" style="font-size: 30px; padding: 10px; padding-left: 30px; padding-right: 30px; margin: 10px; width: 640px;" />
					</td>
				</tr>
				<tr>
					<th class="board-th">Content</th>
					<td id="content-page" colspan="2">
					<textarea rows="22" cols="64" name="content" style="background-color: #DDDDDD; font-size: 20px; padding: 20px; margin-top: 10px; margin-bottom: 4px;"><%=boardVO.getContent()%></textarea>
					</td>
				</tr>
<%
		if (attachList != null && attachList.size() > 0) {
			List<AttachVO> fileList = new ArrayList<>();
%>
				<tr>
					<th class="board-th">Old file<br /><span>*해당기능 미구현으로<br />모든 파일이 삭제됩니다.</span></th>
					<td id="" colspan="2">
<%
				for (AttachVO attachVO : attachList) {
					if (attachVO.getFiletype().equals("I")) {
%>
						<div id="crop-con" class="crop-float" style="z-index: 0;">
						<img src="../upload/<%=boardName+"/"+attachVO.getFilename()%>" style="z-index: -1;"/>
						<a href="javascript:delSelectedFile()" id="a-w" style="padding-left: 72px;">X</a>
						</div>
<%
					} else {
						fileList.add(attachVO);
					}
				}
				for (AttachVO attachVO : fileList) {
%>
					<p style="text-align: right; margin: 0px; margin-right: 10px; color: #777777;"><%=attachVO.getFilename() %> <a href="javascript:delSelectedFile()" id="a-w">X</a></p>
<%
				}
%>
					</td>
				</tr>
<%
		}
%>
				<tr>
					<th class="board-th">File</th><td id="f-cont"><input type="file" name="filename1" class="inputF" id="input-file" style="font-size: 20px; margin-top: 7px; width: 540px;"/></td>
					<td id="content-page" width="150">
					<button type="button" onclick="addFileElement();" style="font-size: 18px">Add File</button><br />
					<div id="fileSize" style="color: #DDDDDD;">MaxSize: 100Mb<!-- (0Mb/100Mb) --></div>
					</td>
				</tr>
			</table>
			<button type="reset">Reset</button>
			<button type="submit">update</button>
			</form>
		</fieldset>
		</article>
	</fieldset>
	<jsp:include page="../include/topbar.jsp" />
	<jsp:include page="../include/footer.jsp" />
	</div>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="../scripts/main.js"></script>
<script>
// x버튼 클릭시 ajax통신으로 파일을 삭제하고 DB에서 튜플을 삭제하기위한 함수
// 미구현 : 여기서 바로 삭제시키는게 아니라 삭제할 파일의 정보를 저장한 후에 submit 시키고, 그 정보가 있을때에 삭제를 실행해야 함
// 현재 미구현으로 모든 파일은 삭제되고 새로 업로드한 파일만 업로드됨
function delSelectedFile() {
	alert('현재 해당 기능 미구현입니다.');
}

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
	var input = '<br /><input type="file" name="filename'+num+'" class="inputF" id="input-file" style="font-size: 20px; margin-top: 7px; width: 540px;">';
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