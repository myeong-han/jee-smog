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
			sql += "FROM member ";
			sql += "WHERE id=? ";
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
		sb.append("SELECT passwd ");
		sb.append("FROM member ");
		sb.append("WHERE id = ? ");
		
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
			sql += "INSERT INTO member ";
			sql += "(id, passwd, name, reg_date, age, gender, email, address, ";
			sql	+= " tel, mtel, birth_, interested, f_uuid, f_path, f_name) ";
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
		MemberVO memberVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql += "SELECT * ";
			sql += "FROM member ";
			sql += "WHERE id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setRegDate(rs.getTimestamp("reg_date"));
				memberVO.setAge(rs.getInt("age"));
				memberVO.setGender(rs.getString("gender"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setTel(rs.getString("tel"));
				memberVO.setMtel(rs.getString("mtel"));
				memberVO.setBirth(rs.getTimestamp("birth_"));
				if (rs.getString("interested")!=null) {
					String[] interesteds = rs.getString("interested").split("/");
					memberVO.setInterested(interesteds);
				}
				memberVO.setfUuid(rs.getString("f_uuid"));
				memberVO.setfPath(rs.getString("f_path"));
				memberVO.setfName(rs.getString("f_name"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			
			sb.append("UPDATE 	member ");
			sb.append("SET 		passwd=?,name=?,birth_=?,age=?,gender=?,email=?,address=?, ");
			sb.append("			tel=?,mtel=?,interested=?,f_uuid=?,f_path=?,f_name=? ");
			sb.append("WHERE 	id=? ");
			
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
		String sql = "DELETE FROM member WHERE id = ? ";
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
	
	public List<MemberVO> getAllMembers() {
		List<MemberVO> memberList = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * ");
		sb.append("FROM member ");
		
		try {
			con = DBManager.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sb.toString());
			
			while(rs.next()) {
				MemberVO memberVO = new MemberVO();
				
				memberVO.setfName(rs.getString("f_name"));
				memberVO.setId(rs.getString("id"));
				memberVO.setRegDate(rs.getTimestamp("reg_date"));
				memberVO.setName(rs.getString("name"));
				memberVO.setBirth(rs.getTimestamp("birth_"));
				memberVO.setGender(rs.getString("gender"));
				memberVO.setEmail(rs.getString("email"));
				if (rs.getString("interested")!=null) {
					String[] interesteds = rs.getString("interested").split("/");
					memberVO.setInterested(interesteds);
				}
				memberVO.setWrites(0);
				
				memberList.add(memberVO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		
		return memberList;
	}
}
