package com.ssdut.dao;

import java.sql.Connection;

import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class FavoritesDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static FavoritesDao instance = null;

	public static FavoritesDao getInstance() {
		if (instance == null) {
			instance = new FavoritesDao();
		}
		return instance;
	}

	public boolean Favorites(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set flag=1 where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("收藏paper！" + e);
		}
	}
}
