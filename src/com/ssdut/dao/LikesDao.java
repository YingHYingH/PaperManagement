package com.ssdut.dao;

import java.sql.Connection;

import bean.Folder;
import bean.Paper;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class LikesDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addLikes(Integer discuss_id,Integer user_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into likes(discuss_id,user_id) values(?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = { discuss_id, user_id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("点赞！" + e);
		}
	}
	
	public boolean cancelLikes(Integer discuss_id,Integer user_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "delete from likes where discuss_id=? and user_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { discuss_id, user_id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("取消赞！" + e);
		}
	}
}
