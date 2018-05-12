package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;

import bean.User;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;
import utilold.MySQLDBcon;

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
			String sql = "update user set username=?, email=?, academicstatus=?, discipline=? ,intro=? where id=?";
			QueryRunner query = new QueryRunner();
			System.out.println(user);
			Object[] params = { user.getUsername(), user.getEmail(), user.getAcademicstatus(), user.getDiscipline(),
					user.getIntro(), user.getId() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取用户信息！" + e);
		}
	}
	@Test
	public void personalInfoDaotest() throws Exception {
		User user = new UserDao().getUserById(4);
		user.setIntro("1111111111");
		new personalInfoDao().personalInfo(user);
		user=new UserDao().getUserById(4);
		
		System.out.println(user);
	}
}
