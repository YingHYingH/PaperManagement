package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utilold.MySQLDBcon;

public class resetNPDao {
	private static resetNPDao instance = null;

	public static resetNPDao getInstance() {
		if (instance == null) {
			instance = new resetNPDao();
		}
		return instance;
	}

	public boolean resetNP(UserInfo user) {
		Connection conn = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "update user set psw=? where email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getPsw());
			pstmt.setString(2, user.getEmail());
			pstmt.executeUpdate();
			return true;
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
		return false;
	}
}
