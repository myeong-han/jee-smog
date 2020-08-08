package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.AttachVO;

public class AttachDao {
	private static final AttachDao INSTANCE = new AttachDao();
	
	public static AttachDao getInstance() {
		return INSTANCE;
	}
	
	private AttachDao() {}
	
	public void insertAttach(AttachVO attachVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sb = new StringBuffer();
		try {
			con = DBManager.getConnection();
			sb.append("INSERT INTO ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) ");
			sb.append("VALUES (?,?,?,?,?) ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, attachVO.getUuid());
			pstmt.setString(2, attachVO.getUploadpath());
			pstmt.setString(3, attachVO.getFilename());
			pstmt.setString(4, attachVO.getFiletype());
			pstmt.setInt(5, attachVO.getBno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public void deleteAttach(int bno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("DELETE ");
			sb.append("FROM ATTACHS ");
			sb.append("WHERE BNO = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public List<AttachVO> getAttachsByBno(int bno) {
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("SELECT * ");
			sb.append("FROM ATTACHS ");
			sb.append("WHERE BNO = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AttachVO attachVO = new AttachVO();
				attachVO.setUuid(rs.getString("UUID"));
				attachVO.setUploadpath(rs.getString("UPLOADPATH"));
				attachVO.setFiletype(rs.getString("FILETYPE"));
				attachVO.setFilename(rs.getString("FILENAME"));
				attachVO.setBno(bno);
				
				attachList.add(attachVO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return attachList;
	}
	
	public String getFirstImageByBno(int bno) {
		String firstImage = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("SELECT * ");
			sb.append("FROM ATTACHS ");
			sb.append("WHERE BNO = ? ");
			sb.append("AND FILETYPE = 'I' ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				firstImage = rs.getString("FILENAME");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return firstImage;
	}
	
	public int getAttachCount(int bno) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("SELECT COUNT(*) ");
			sb.append("FROM ATTACHS ");
			sb.append("WHERE BNO = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}
}
