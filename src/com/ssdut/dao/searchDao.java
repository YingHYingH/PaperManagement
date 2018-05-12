package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

import dbhelper.DbHelper;

public class searchDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static searchDao instance = null;

	public static searchDao getInstance() {
		if (instance == null) {
			instance = new searchDao();
		}
		return instance;
	}

	public ResultSet search(String searchKeyword) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * ,(watches + downloadcnt) as score from paper where title like '%"+searchKeyword+"%' OR author like '%"+searchKeyword+"%' ORDER BY score desc";	
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, searchKeyword);
			//pstmt.setString(2, searchKeyword);
			DbHelper.release(conn);
			ResultSet rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("精确查找！" + e);
		}
	}
	
	
}
