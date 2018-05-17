package com.ssdut.dao;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import bean.User;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;
import handlers.BeanListHandler;

public class UserDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	
	public User getUserById(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from user where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			User user = query.query(conn, sql, new BeanHandler<User>(User.class), params);
			DbHelper.release(conn);
			return user != null ? user : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取用户信息！" + e);
		}
	}

	public ArrayList<User> getAllUsers() throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from user";
			QueryRunner query = new QueryRunner();
			ArrayList<User> users = (ArrayList<User>) query.query(conn, sql, new BeanListHandler<User>(User.class));
			DbHelper.release(conn);
			return users != null ? users : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取所有用户信息失败！" + e);
		}
	}
	
	public User getUserByUsername(String username) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from user where username=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { username };
			User user = query.query(conn, sql, new BeanHandler<User>(User.class), params);
			DbHelper.release(conn);
			return user != null ? user : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取用户信息！" + e);
		}
	}

	@Test
	public void testGetUserById() throws Exception {
		UserDao userDao = new UserDao();
		User user = userDao.getUserById(5);
		System.out.println(user);
	}
	
	@Test
	public void testGetUserByUsername() throws Exception {
		UserDao userDao = new UserDao();
		User user = userDao.getUserByUsername("YingHYingH");
		System.out.println(user);
	}

	@Test
	public void testGetAllUsers() throws Exception {
		UserDao userDao = new UserDao();
		ArrayList<User> users = userDao.getAllUsers();
		System.out.println(users);
	}
	
	public void addFollowed(User user) {
		try {
		String followed = user.getFollowed();
		int userId = user.getId();
		Connection conn = helper.getConnection();
		String sql = "update user set followed=? where id=?";
		QueryRunner query = new QueryRunner();
		Object[] params = { followed,userId };
		query.update(conn, sql, params);
		DbHelper.release(conn);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
