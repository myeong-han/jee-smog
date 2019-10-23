package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.BoardVO;

public class BoardDao {
	private final static BoardDao INSTANCE = new BoardDao();
	
	private BoardDao() {}
	
	public static BoardDao getInstance() {
		return INSTANCE;
	}
	
	public int nextBoardNum() {
		int num = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			
			sql = "SELECT MAX(num) FROM boards ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		
		return num;
	}
	
	public void insertBoard(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("INSERT INTO boards ");
			sb.append("(num, boardnum, username, passwd, subject, content, ");
			sb.append(" readcount, ip, reg_date, re_ref, re_lev, re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ");
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardVO.getNum());
			pstmt.setInt(2, boardVO.getBoardnum());
			pstmt.setString(3, boardVO.getUsername());
			pstmt.setString(4, boardVO.getPasswd());
			pstmt.setString(5, boardVO.getSubject());
			pstmt.setString(6, boardVO.getContent());
			pstmt.setInt(7, boardVO.getReadcount());
			pstmt.setString(8, boardVO.getIp());
			pstmt.setTimestamp(9, boardVO.getRegDate());
			pstmt.setInt(10, boardVO.getReRef());
			pstmt.setInt(11, boardVO.getReLev());
			pstmt.setInt(12, boardVO.getReSeq());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public BoardVO getBoard(int num) {
		BoardVO boardVO = new BoardVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("SELECT * ");
			sb.append("FROM boards ");
			sb.append("WHERE num = ?");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				boardVO.setNum(rs.getInt("num"));
				boardVO.setBoardnum(rs.getInt("boardnum"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setPasswd(rs.getString("passwd"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setIp(rs.getString("ip"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return boardVO;
	}
	
	public List<BoardVO> getBoards(int boardnum, int startRow, int pageSize, String whatS, String search) {
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("SELECT * ");
			sb.append("FROM boards ");
			sb.append("WHERE boardnum = ? ");
		if (!(search == null || search.equals(""))) {
			sb.append("AND ");
			sb.append(whatS.equals("subject")?"subject ":"username ");
			sb.append("LIKE ? ");
		}
			sb.append("ORDER BY re_ref DESC, re_seq ");
			sb.append("LIMIT ? OFFSET ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
		if (!(search==null || search.equals(""))) {
			pstmt.setString(2, "%"+search+"%");
			pstmt.setInt(3, pageSize);
			pstmt.setInt(4, startRow-1);
		} else {
			pstmt.setInt(2, pageSize);
			pstmt.setInt(3, startRow-1);
		}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setBoardnum(rs.getInt("boardnum"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setPasswd(rs.getString("passwd"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setIp(rs.getString("ip"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
				
				boardList.add(boardVO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return boardList;
	}
	
	public int getBoardCount(String whatS, String search) {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			
			sql = "SELECT count(*) FROM boards ";	
		if (!(search == null || search.equals(""))) {
			sql += "WHERE ";
			sql += whatS.equals("subject")?"subject ":"username "; 
			sql += "LIKE ? ";
		}
			
			pstmt = con.prepareStatement(sql);
		if (!(search == null || search.equals(""))) {
			pstmt.setString(1, "%"+search+"%");
		}
			rs = pstmt.executeQuery();
			rs.next();
			
			count = rs.getInt(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return count;
	}
}
