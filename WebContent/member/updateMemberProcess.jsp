<%@page import="java.util.Enumeration"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO" />
<%
	final String REAL_PATH = application.getRealPath("/upload/profile");
	final int MAX_SIZE = 1024*1024*10; // 10mb
	MultipartRequest multi = new MultipartRequest(
		request, REAL_PATH, MAX_SIZE, "utf-8", new DefaultFileRenamePolicy()
	);
	
	memberVO.setId(multi.getParameter("id"));
	memberVO.setPasswd(multi.getParameter("passwd"));
	memberVO.setName(multi.getParameter("name"));
	memberVO.setGender(multi.getParameter("gender"));
	memberVO.setEmail(multi.getParameter("email"));
	memberVO.setAddress(multi.getParameter("address"));
	memberVO.setTel(multi.getParameter("tel"));
	memberVO.setMtel(multi.getParameter("mtel"));
	memberVO.setInterested(multi.getParameterValues("interested"));
	
	// set : birth_ (param: birth_, VO: birth)
	String birth = multi.getParameter("birth_");
	boolean isInsertedBirth = birth!=null && !birth.equals("");
	if ( isInsertedBirth ) {
		birth += " 00:00:00.0";
		memberVO.setBirth(Timestamp.valueOf(birth));
		
		// set : age (param: null, VO: age)	
		int age = MemberDao.getAgeFromBirthday(memberVO.getBirth());
		memberVO.setAge(age);
	} else {
		memberVO.setAge(0);
	}
	
	// set : f_name, f_path, f_uuid (param: f_name, null, null, VO: fName, fPath, fUuid)
	Enumeration<String> enu = multi.getFileNames();
	while (enu.hasMoreElements()) {
		String realFileName = multi.getFilesystemName(enu.nextElement());
		if (realFileName != null) { // 파일 널여부 검증
			File file = new File(REAL_PATH, realFileName);
			String contentType = Files.probeContentType(file.toPath());
			boolean isImage = contentType.startsWith("image");
			
			if (isImage) { // 이미지파일 여부 검증
				UUID uuid = UUID.randomUUID();
				memberVO.setfUuid(uuid.toString());
//	 			memberVO.setfPath(fPath);
				memberVO.setfName(realFileName);
				// 기존 프로필 이미지 삭제 메소드 필요
			} else {
			%><script>
				alert('It\'s not image format');
				history.back();
			</script><%
				// 방금 올린 파일 삭제 메소드 필요함
				return;
			}
		}
	}
	
	// memberDao의 insertMember 실행
	MemberDao memberDao = MemberDao.getInstance();
	memberDao.updateMember(memberVO);
%>

<script type="text/javascript">
	alert('Member information has been modified.');
	location.href='../index.jsp';
</script>