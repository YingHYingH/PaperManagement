package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

import utilold.MySQLDBcon;

public class forgortDao {
	private static forgortDao instance = null;

	public static forgortDao getInstance() {
		if (instance == null) {
			instance = new forgortDao();
		}
		return instance;
	}

	public String getUserPswByEmail(String email) {
		Connection conn = null;
		String pswFromSQL = null;
		ResultSet rs = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "select * from user where email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs == null) {
				return null;
			}
			if (rs.next()) {
				pswFromSQL = rs.getString("psw");
			} else {
				pswFromSQL = null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pswFromSQL;
	}

	public Integer getUseridByEmail(String email) {
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "select id from user where email=? limit 1";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return -1;
	}
	public String getUserNameByEmail(String email) {
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "select username from user where email=? limit 1";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString("username");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "";
	}
}
