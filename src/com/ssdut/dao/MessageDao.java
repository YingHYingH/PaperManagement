package com.ssdut.dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import bean.Comment;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class MessageDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public void addMessageWithComment(Comment comment) throws Exception {
		try {
			//根据帖子id获取发帖人
			int receiveUserId = new DiscussDao().getDiscussById(comment.getDiscuss_id()).getUser_id();
			String receiveUsername = new UserDao().getUserById(receiveUserId).getUsername();
			String sentUsername = new UserDao().getUserById(comment.getUser_id()).getUsername();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(comment.getTime());
			Connection conn = helper.getConnection();
			String sql = "insert into message(receive_username,sent_username,type,message_time,state,content,related) values(?,?,2,?,0,?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = { receiveUsername,sentUsername,time,comment.getContent(),comment.getDiscuss_id()};
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("新增消息！" + e);
		}
	}
}