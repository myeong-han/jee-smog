package com.exam.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

class DBManager {

	public static Connection getConnection() throws Exception {
		Connection con = null;
		
		Context context = new InitialContext();
		// ds : 커넥션을 미리 일정갯수 보유함
		DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/mysqldb");
		con = ds.getConnection(); // 커넥션 한개 빌려오기
		
		return con;
	}
	
	// SELECT문 수행 후 리소스해제를 위한 메소드
	public static void close(Connection con, Statement stmt, ResultSet rs) {
//		try {	// 이러면 위험함!
//			rs.close();
//			stmt.close();
//			con.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// SELECT 이외에 사용되는 리소스 해제
	public static void close(Connection con, Statement stmt) {	// pstmt가 stmt를 상속하므로 stmt형에 pstmt형 입력 가능
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
