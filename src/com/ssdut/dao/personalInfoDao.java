package com.ssdut.dao;

import java.sql.Connection;

import org.junit.Test;

import bean.User;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
public class personalInfoDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static personalInfoDao instance = null;

	public static personalInfoDao getInstance() {
		if (instance == null) {
			instance = new personalInfoDao();
		}
		return instance;
	}

	public boolean personalInfo(User user) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update user set email=?, academicstatus=?, discipline=? ,intro=? where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { user.getEmail(), user.getAcademicstatus(), user.getDiscipline(),
					user.getIntro(), user.getId() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取用户信息！" + e);
		}
	}
}
