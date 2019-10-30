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
			sb.append("INSERT INTO attachs (uuid,uploadpath,filename,filetype,bno) ");
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
	
	public List<AttachVO> getFileInfosFromBno(int bno) {
		List<AttachVO> fileInfos = new ArrayList<AttachVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();
		try {
			con = DBManager.getConnection();
			sb.append("SELECT * ");
			sb.append("FROM attachs ");
			sb.append("WHERE bno = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AttachVO attachVO = new AttachVO();
				attachVO.setUuid(rs.getString("uuid"));
				attachVO.setUploadpath(rs.getString("uploadpath"));
				attachVO.setFilename(rs.getString("filename"));
				attachVO.setFiletype(rs.getString("filetype"));
				attachVO.setBno(bno);
				
				fileInfos.add(attachVO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return fileInfos;
	}
	
	
}
