package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utilold.MySQLDBcon;

public class registerDao {
	private static registerDao instance = null;

	public static registerDao getInstance() {
		if (instance == null) {
			instance = new registerDao();
		}
		return instance;
	}

	public boolean saveUser(UserInfo user) {
		Connection conn = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "insert into user(username,email,psw)values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPsw());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
