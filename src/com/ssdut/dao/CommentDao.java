package com.ssdut.dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import bean.Comment;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class CommentDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addComment(Comment comment) throws Exception {
		try {
			//新增评论
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(comment.getTime());
			Connection conn = helper.getConnection();
			String sql = "insert into comment(discuss_id,content,time,user_id) values(?,?,?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = { comment.getDiscuss_id(),comment.getContent(),time,comment.getUser_id()};
			query.update(conn, sql, params);
			DbHelper.release(conn);
			//新增评论对应消息
			MessageDao messageDao = new MessageDao();
			messageDao.addMessageWithComment(comment);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("新增评论！" + e);
		}
	}
}
