package com.exam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
}
