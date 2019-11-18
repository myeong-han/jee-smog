package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.exam.vo.CommentVO;

public class CommentDao {
	
	private final static CommentDao INSTANCE = new CommentDao();
	
	private CommentDao() {}
	
	public CommentDao getInstance() {
		return INSTANCE;
	}
	
	private int nextSeq(int bno) {
		int seq = 1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("SELECT MAX(seq) ");
			sb.append("FROM comments ");
			sb.append("WHERE bno = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				seq = rs.getInt(1)+1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return seq;
	}
	
	public void insertComment(CommentVO commentVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("INSERT INTO comments (seq, id, content, bno) ");
			sb.append("VALUES (?,?,?,?) ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, nextSeq(commentVO.getBno()));
			pstmt.setString(2, commentVO.getId());
			pstmt.setString(3, commentVO.getContent());
			pstmt.setInt(4, commentVO.getBno());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
	}
	
}
