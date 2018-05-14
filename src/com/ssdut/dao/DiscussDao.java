package com.ssdut.dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import bean.Discuss;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;

public class DiscussDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addDiscuss(Discuss discuss) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into discuss(title,content,time,user_id) values(?,?,?,?)";
			QueryRunner query = new QueryRunner();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String date = sdf.format(discuss.getTime());
			Object[] params = { discuss.getTitle(), discuss.getContent(),date,discuss.getUser_id() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("新增帖子！" + e);
		}
	}
	
	public Discuss getDiscussById(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from discuss where discuss_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			Discuss discuss = query.query(conn, sql, new BeanHandler<Discuss>(Discuss.class), params);
			DbHelper.release(conn);
			return discuss != null ? discuss : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取帖子信息！" + e);
		}
	}
}
