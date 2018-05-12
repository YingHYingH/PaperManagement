package com.ssdut.dao;

import java.sql.Connection;

import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class disFavoritesDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static disFavoritesDao instance = null;

	public static disFavoritesDao getInstance() {
		if (instance == null) {
			instance = new disFavoritesDao();
		}
		return instance;
	}

	public boolean disFavorites(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set flag=0 where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("取消收藏paper！" + e);
		}
	}
}
