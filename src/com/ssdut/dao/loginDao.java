package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

import bean.User;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;
import utilold.MySQLDBcon;

public class loginDao extends AbstractDao {
	private static loginDao instance = null;
	public DbHelper dbhelper = new DbHelper();

	public static loginDao getInstance() {
		if (instance == null) {
			instance = new loginDao();
		}
		return instance;
	}

	public boolean login(String username, String password) {
		try {
			Connection conn = dbhelper.getConnection();
			String sql = "select * from user where username=? and psw=?";
			Object[] params = { username, password };
			QueryRunner query = new QueryRunner();
			User user = query.query(conn, sql, new BeanHandler<User>(User.class), params);
			return user != null ? true : false;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public String findUser(String username) {
		Connection conn = null;
		String pswFromSQL = null;
		ResultSet rs = null;
		try {
			conn = MySQLDBcon.getConn();
			String sql = "select * from user where username=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
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

	@Test
    public void testLogin() throws Exception {
    	loginDao loginer = new loginDao();
    	boolean isexisted = loginer.login("YingHaYingH", "Ww18842829699");
    	System.out.println(isexisted);
    }
}
