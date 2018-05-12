package com.ssdut.dao;

import java.sql.Connection;

import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class UploadDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static UploadDao instance = null;

	public static UploadDao getInstance() {
		if (instance == null) {
			instance = new UploadDao();
		}
		return instance;
	}

	public boolean Upload(Integer id, String url, String uploadDate) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set url=?, uploadDate=? where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { url, uploadDate, id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取用户信息！" + e);
		}
	}
}
