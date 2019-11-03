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
			sb.append("(num, boardnum, username, subject, content, ");
			sb.append(" readcount, ip, reg_date, re_ref, re_lev, re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?) ");
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardVO.getNum());
			pstmt.setInt(2, boardVO.getBoardnum());
			pstmt.setString(3, boardVO.getUsername());
			pstmt.setString(4, boardVO.getSubject());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setInt(6, boardVO.getReadcount());
			pstmt.setString(7, boardVO.getIp());
			pstmt.setTimestamp(8, boardVO.getRegDate());
			pstmt.setInt(9, boardVO.getReRef());
			pstmt.setInt(10, boardVO.getReLev());
			pstmt.setInt(11, boardVO.getReSeq());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public void insertReply(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("UPDATE boards ");
			sb.append("SET re_seq = re_seq+1 ");
			sb.append("WHERE re_ref = ? ");
			sb.append("AND re_seq > ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardVO.getReRef());
			pstmt.setInt(2, boardVO.getReSeq());
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sb.setLength(0);
			sb.append("INSERT INTO boards ");
			sb.append("(num, boardnum, username, subject, content, ");
			sb.append(" readcount, ip, reg_date, re_ref, re_lev, re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?) ");
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardVO.getNum());
			pstmt.setInt(2, boardVO.getBoardnum());
			pstmt.setString(3, boardVO.getUsername());
			pstmt.setString(4, boardVO.getSubject());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setInt(6, boardVO.getReadcount());
			pstmt.setString(7, boardVO.getIp());
			pstmt.setTimestamp(8, boardVO.getRegDate());
			pstmt.setInt(9, boardVO.getReRef());
			pstmt.setInt(10, boardVO.getReLev()+1);
			pstmt.setInt(11, boardVO.getReSeq()+1);
			
			pstmt.executeUpdate();	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
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
	// 게시판 목록 구현용
	public List<BoardVO> getBoards(int boardnum, int startRow, int pageSize, String whatS, String search) {
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			String sql = "SET @rownum:=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.executeUpdate(); 	// rownum값 세팅
			pstmt.close();
			
			sb.append("SELECT *, @rownum:=@rownum+1 AS \"rownum\" ");
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
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setIp(rs.getString("ip"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
				boardVO.setRownum(rs.getInt("rownum"));
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
	// 전체게시글 검색용
	public List<BoardVO> getAllBoards(int startRow, int pageSize, String whatS, String search) {
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			String sql = "SET @rownum:=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.executeUpdate(); 	// rownum값 세팅
			pstmt.close();
			
			sb.append("SELECT *, @rownum:=@rownum+1 AS \"rownum\" ");
			sb.append("FROM boards ");
		if (!(search == null || search.equals(""))) {
			sb.append("WHERE ");
			sb.append(whatS.equals("subject")?"subject ":"username ");
			sb.append("LIKE ? ");
		}
			sb.append("ORDER BY re_ref DESC, re_seq ");
			sb.append("LIMIT ? OFFSET ? ");
			
			pstmt = con.prepareStatement(sb.toString());
		if (!(search==null || search.equals(""))) {
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, pageSize);
			pstmt.setInt(3, startRow-1);
		} else {
			pstmt.setInt(1, pageSize);
			pstmt.setInt(2, startRow-1);
		}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setBoardnum(rs.getInt("boardnum"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setIp(rs.getString("ip"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
				boardVO.setRownum(rs.getInt("rownum"));
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
	
	public List<BoardVO> getAllBoards() {
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			stmt = con.createStatement();
			
			sb.append("SELECT * ");
			sb.append("FROM boards ");
			sb.append("ORDER BY num DESC ");
			rs = stmt.executeQuery(sb.toString());
			
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setBoardnum(rs.getInt("boardnum"));
				boardVO.setUsername(rs.getString("username"));
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
			DBManager.close(con, stmt, rs);
		}
		
		return boardList;
	}
	
	// rownum 불러오기용
	public List<BoardVO> getRownums(int boardnum) {
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			String sql = "SET @rownum:=0";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate(); 	// rownum값 세팅
			pstmt.close();
			
			sb.append("SELECT num, boardnum, username, subject, @rownum:=@rownum+1 AS \"rownum\" ");
			sb.append("FROM boards ");
			sb.append("WHERE boardnum = ? ");
			sb.append("ORDER BY re_ref DESC, re_seq ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setBoardnum(rs.getInt("boardnum"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setRownum(rs.getInt("rownum"));
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
	
	// 각 게시판의 글 수
	public int getBoardCount(int boardnum, String whatS, String search) {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			
			sql = "SELECT count(*) FROM boards ";
			sql += "WHERE boardnum = ? ";
		if (!(search == null || search.equals(""))) {
			sql += "AND ";
			sql += whatS.equals("subject")?"subject ":"username "; 
			sql += "LIKE ? ";
		}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
		if (!(search == null || search.equals(""))) {
			pstmt.setString(2, "%"+search+"%");
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
	
	// 전체검색용
	public int getAllBoardCount(String whatS, String search) {
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
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("DELETE ");
			sb.append("FROM boards ");
			sb.append("WHERE num = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
	}
	
	public int getBoardnum(int num) {
		int boardnum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("SELECT boardnum ");
			sb.append("FROM boards ");
			sb.append("WHERE num = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			rs.next();
			boardnum = rs.getInt("boardnum");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return boardnum;
	}
	
	public void updateReadCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("UPDATE boards ");
			sb.append("SET readcount = readcount+1 ");
			sb.append("WHERE num = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public int getWriteCount(String username) {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("SELECT COUNT(*) ");
			sb.append("FROM boards ");
			sb.append("WHERE username = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, username);
			
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
	
	public void updateBoard(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("UPDATE boards ");
			sb.append("SET subject=?, content=? ");
			sb.append("WHERE num=? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, boardVO.getSubject());
			pstmt.setString(2, boardVO.getContent());
			pstmt.setInt(3, boardVO.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
}
