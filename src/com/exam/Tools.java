package com.exam;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.exam.vo.AttachVO;
import com.exam.vo.BoardVO;
import com.exam.vo.MemberVO;

// DB에 접속하지 않지만 반복해서 등장하는 덩치큰 코드 모음
public class Tools {
	
	public static String getBoardName(String boardnum) {
		String boardName = "";
		if (boardnum != null) {
			switch (boardnum) {
				case "1" : boardName = "news"; break;
				case "2" : boardName = "community"; break;
				case "3" : boardName = "gallery"; break;
				default : boardName = "main";
			}
		} else {
			boardName = "main";
		}
		return boardName;
	}
	
	public static String getBoardLocation(String boardName, String pageNum) {
		if (boardName == null) {
			boardName = "main";
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		return "../"+boardName+"/"+boardName+".jsp?pageNum="+pageNum;
	}
	
	public static String getBoardnum(HttpSession session, HttpServletRequest request) {
		String boardnum = (String)session.getAttribute("boardnum");
		if (boardnum == null) {
			boardnum = request.getParameter("boardnum");
		}
		session.setAttribute("boardnum", boardnum);
		
		return boardnum;
	}
	
	public static void delFilesForBoard(ServletContext application, List<AttachVO> attachList, String boardName) {
		final String REAL_PATH = application.getRealPath("/upload/"+boardName);
		
		for (AttachVO attachVO : attachList) {
			// 파일 객체에 해당 경로와 이름을 지정
			File file = new File(REAL_PATH, attachVO.getFilename());
			
			if (file.exists()) { // 해당 경로에 파일이 있는지 확인
				file.delete(); // 해당경로에 있는 파일 삭제 수행
			}
		}
	}
	
	public static void delFilesWhenException(ServletContext application, String fileName, String boardName) {
		final String REAL_PATH = application.getRealPath("/upload/"+boardName);
		
		if (fileName != null) {
			// 파일 객체에 해당 경로와 이름을 지정
			File file = new File(REAL_PATH, fileName);
			
			if (file.exists()) { // 해당 경로에 파일이 있는지 확인
				file.delete(); // 해당경로에 있는 파일 삭제 수행
			}
		}
	}
	
	public static void delFileToProfile(ServletContext application, MemberVO memberVO) {
		final String REAL_PATH = application.getRealPath("/upload/profile");
		
		if (memberVO.getfName() != null) {
			// 파일 객체에 해당 경로와 이름을 지정
			File file = new File(REAL_PATH, memberVO.getfName());
			
			if (file.exists()) { // 해당 경로에 파일이 있는지 확인
				file.delete(); // 해당경로에 있는 파일 삭제 수행
			}
		}
	}
	
	public static void delFileToProfile(ServletContext application, String fileName) {
		final String REAL_PATH = application.getRealPath("/upload/profile");
		
		if (fileName != null) {
			// 파일 객체에 해당 경로와 이름을 지정
			File file = new File(REAL_PATH, fileName);
			
			if (file.exists()) { // 해당 경로에 파일이 있는지 확인
				file.delete(); // 해당경로에 있는 파일 삭제 수행
			}
		}
	}
}
