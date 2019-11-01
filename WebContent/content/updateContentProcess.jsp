<%@page import="java.io.IOException"%>
<%@page import="com.exam.Tools"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.exam.vo.AttachVO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	
	if (id == null) {
		response.sendRedirect("write.jsp");
		return;
	}
	
	String boardnum = (String) session.getAttribute("boardnum");
	String boardName = Tools.getBoardName(boardnum);
	
	String realPath = application.getRealPath("/upload/"+boardName);
	
	final int MAX_SIZE = 1024*1024*100; // 100mb
	
	MultipartRequest multi = null;
	try {
		multi = new MultipartRequest(
			request, realPath, MAX_SIZE, "utf-8", new DefaultFileRenamePolicy()
		);
	} catch(IOException e) {
		String errorLocation = request.getServletPath()+"?boardnum="+boardnum;
		session.setAttribute("errorLocation", errorLocation);
		response.sendRedirect("errorMessage.jsp");
		e.printStackTrace();
		return;
	}
	BoardVO boardVO = new BoardVO();
	
	boardVO.setUsername(id);
	boardVO.setSubject(multi.getParameter("subject"));
	boardVO.setContent(multi.getParameter("content"));
	boardVO.setBoardnum(Integer.parseInt(multi.getParameter("boardnum")));
	
	// 글 등록날짜, ip주소값 저장
	boardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
	boardVO.setIp(request.getRemoteAddr());
	
	// dao객체 준비
	BoardDao boardDao = BoardDao.getInstance();
	int num = boardDao.nextBoardNum();
	
	boardVO.setNum(num);
	boardVO.setReadcount(0);
	boardVO.setReRef(num);
	boardVO.setReLev(0);
	boardVO.setReSeq(0);
	
	boardDao.insertBoard(boardVO);// board 테이블에 인서트
	
	
	//====================파일업로드=================================
	
	Enumeration<String> enu = multi.getFileNames();
	
	while (enu.hasMoreElements()) { // 다음요소가 있으면
		String str = enu.nextElement();
		
		// 파라미터이름으로 실제로 업로드된 파일이름 구하기
		// 해당 파라미터 이름을 업로드에 사용 안했으면 null이 리턴
		String realFileName = multi.getFilesystemName(str);
		if (realFileName != null) {
			
			// 자바빈 AttachVO 객체 생성
			AttachVO attachVO = new AttachVO();
			
			UUID uuid = UUID.randomUUID();
			attachVO.setUuid(uuid.toString());
		// 	attachVO.setUploadpath(REAL_PATH); 	// 실제 업로드한 경로
			attachVO.setFilename(realFileName); // 실제 생성된 파일이름
			attachVO.setBno(num);				// 게시글 번호
			
			// 이미지 파일여부 확인하기
			File file = new File(realPath, realFileName);
			
			String contentType = Files.probeContentType(file.toPath());
			if (contentType != null) {
				boolean isImage = contentType.startsWith("image");
				if (isImage) {
					attachVO.setFiletype("I"); // image
				} else {
					attachVO.setFiletype("O"); // order type
				}
			} else {
				attachVO.setFiletype("O");
			}
			
			// AttachDao 준비
			AttachDao attachDao = AttachDao.getInstance();
			// 첨부파일 정보 한개 등록하는 메소드 호출
			attachDao.insertAttach(attachVO);
		}
	}
	
	// ================== 첨부파일 등록 처리 종료 ==========================
	
	response.sendRedirect("content.jsp?boardnum="+boardnum+"&num="+num+"&pageNum=1");
%>