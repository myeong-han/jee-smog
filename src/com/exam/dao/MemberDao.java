package com.exam.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;

import com.exam.vo.MemberVO;

public class MemberDao {
	private final static MemberDao INSTANCE = new MemberDao();
	
	public static MemberDao getInstance() {
		return INSTANCE;
	}
	
	public static int getAgeFromBirthday(Timestamp birth) {
		Date birthday = birth;
	    Calendar calBirth = new GregorianCalendar();
	    Calendar calToday = new GregorianCalendar();

	    calBirth.setTime(birthday);
	    calToday.setTime(new Date());

	    int factor = 0;
	    if (calToday.get(Calendar.DAY_OF_YEAR) < calBirth.get(Calendar.DAY_OF_YEAR)) {
	        factor = -1;
	    }

	    return calToday.get(Calendar.YEAR) - calBirth.get(Calendar.YEAR) + factor;
	}
	
	private MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean isIdDuplicated(String id) {
		boolean isDuplicated = false;
		MemberVO memberVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql += "SELECT * ";
			sql += "FROM MEMBERS ";
			sql += "WHERE ID=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isDuplicated = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return isDuplicated;
	}
	
	public int userCheck(String id, String passwd) {
		int userCheck = -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT PASSWD ");
		sb.append("FROM MEMBERS ");
		sb.append("WHERE ID = ? ");
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (passwd.equals(rs.getString(1))) {
					userCheck = 1; // 비밀번호 일치
				} else {
					userCheck = 0; // 비밀번호 불일치
				}
			} else {
				userCheck = -1; // 아이디 없음
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return userCheck;
	}

	public void insertMember(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql += "INSERT INTO MEMBERS ";
			sql += "(ID, PASSWD, NAME, REG_DATE, AGE, GENDER, EMAIL, ADDRESS, ";
			sql	+= " TEL, MTEL, BIRTH_, INTERESTED, F_UUID, F_PATH, F_NAME) ";
			sql += "VALUES ";
			sql += "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getId());
			pstmt.setString(2, memberVO.getPasswd());
			pstmt.setString(3, memberVO.getName());
			pstmt.setTimestamp(4, memberVO.getRegDate());
			pstmt.setInt(5, memberVO.getAge());
			pstmt.setString(6, memberVO.getGender());
			pstmt.setString(7, memberVO.getEmail());
			pstmt.setString(8, memberVO.getAddress());
			pstmt.setString(9, memberVO.getTel());
			pstmt.setString(10, memberVO.getMtel());
			pstmt.setTimestamp(11, memberVO.getBirth());
			
			String[] interesteds = memberVO.getInterested();
			String str = "";
			if (interesteds != null) {
				int i = 0;
				for (String interested : interesteds) {
					i++;
					str += interested;
					if (interesteds.length == i) break;
					str += "/";
				}
			}
			pstmt.setString(12, str);
			
			pstmt.setString(13, memberVO.getfUuid());
			pstmt.setString(14, memberVO.getfPath());
			pstmt.setString(15, memberVO.getfName());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public MemberVO getMember(String id) {
		MemberVO memberVO = new MemberVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql += "SELECT * ";
			sql += "FROM MEMBERS ";
			sql += "WHERE ID = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVO.setId(rs.getString("ID"));
				memberVO.setPasswd(rs.getString("PASSWD"));
				memberVO.setName(rs.getString("NAME"));
				memberVO.setRegDate(rs.getTimestamp("REG_DATE"));
				memberVO.setAge(rs.getInt("AGE"));
				memberVO.setGender(rs.getString("GENDER"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setAddress(rs.getString("ADDRESS"));
				memberVO.setTel(rs.getString("TEL"));
				memberVO.setMtel(rs.getString("MTEL"));
				memberVO.setBirth(rs.getTimestamp("BIRTH_"));
				if (rs.getString("INTERESTED")!=null) {
					String[] interesteds = rs.getString("INTERESTED").split("/");
					memberVO.setInterested(interesteds);
				}
				memberVO.setfUuid(rs.getString("F_UUID"));
				memberVO.setfPath(rs.getString("F_PATH"));
				memberVO.setfName(rs.getString("F_NAME"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			memberVO.setfName(null);
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return memberVO;
	}
	
	public void updateMember(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			
			sb.append("UPDATE 	MEMBERS ");
			sb.append("SET 		PASSWD=?,NAME=?,BIRTH_=?,AGE=?,GENDER=?,EMAIL=?,ADDRESS=?, ");
			sb.append("			TEL=?,MTEL=?,INTERESTED=?,F_UUID=?,F_PATH=?,F_NAME=? ");
			sb.append("WHERE 	ID=? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, memberVO.getPasswd());
			pstmt.setString(2, memberVO.getName());
			pstmt.setTimestamp(3, memberVO.getBirth());
			pstmt.setInt(4, memberVO.getAge());
			pstmt.setString(5, memberVO.getGender());
			pstmt.setString(6, memberVO.getEmail());
			pstmt.setString(7, memberVO.getAddress());
			pstmt.setString(8, memberVO.getTel());
			pstmt.setString(9, memberVO.getMtel());
			String[] interesteds = memberVO.getInterested();
			String str = "";
			if (interesteds != null) {
				int i = 0;
				for (String interested : interesteds) {
					i++;
					str += interested;
					if (interesteds.length == i) break;
					str += "/";
				}
			}
			pstmt.setString(10, str);
			pstmt.setString(11, memberVO.getfUuid());
			pstmt.setString(12, memberVO.getfPath());
			pstmt.setString(13, memberVO.getfName());
			
			pstmt.setString(14, memberVO.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}

	public void deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MEMBERS WHERE ID = ? ";
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	}
	
	public List<MemberVO> getAllMembers(int startRow, int pageSize, String search) {
		List<MemberVO> memberList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			
			sb.append("SELECT * ");
			sb.append("FROM MEMBERS ");
		// 검색어 search가 있을때는 검색조건절 where를 추가함
		if (!(search == null || search.equals(""))) {
			sb.append("WHERE ID LIKE ? ");
		}
			sb.append("ORDER BY REG_DATE DESC ");
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
			
			
			while(rs.next()) {
				MemberVO memberVO = new MemberVO();
				
				memberVO.setfName(rs.getString("F_NAME"));
				memberVO.setId(rs.getString("ID"));
				memberVO.setRegDate(rs.getTimestamp("REG_DATE"));
				memberVO.setName(rs.getString("NAME"));
				memberVO.setBirth(rs.getTimestamp("BIRTH_"));
				memberVO.setGender(rs.getString("GENDER"));
				memberVO.setEmail(rs.getString("EMAIL"));
				if (rs.getString("INTERESTED")!=null) {
					String[] interesteds = rs.getString("INTERESTED").split("/");
					memberVO.setInterested(interesteds);
				}
				memberList.add(memberVO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return memberList;
	}
	
	public int getMemberCount(String search) {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			
			sql = "SELECT COUNT(*) FROM MEMBERS ";
			
		if (!(search == null || search.equals(""))) {
			sql += "WHERE ID LIKE ? ";
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
