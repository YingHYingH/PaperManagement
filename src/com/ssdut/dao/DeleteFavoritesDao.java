package com.ssdut.dao;

import java.sql.Connection;

import org.junit.Test;

import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class DeleteFavoritesDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static DeleteFavoritesDao instance = null;

	public static DeleteFavoritesDao getInstance() {
		if (instance == null) {
			instance = new DeleteFavoritesDao();
		}
		return instance;
	}

	public boolean DeleteFavorites(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set flag=2 where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("删除Favoritespaper！" + e);
		}
	}

	@Test
	public void DeleteDaotest() throws Exception {
		Integer id = 5;
		// DeleteDao.getInstance().Delete(id);
		new DeleteDao().Delete(id);
	}
}
