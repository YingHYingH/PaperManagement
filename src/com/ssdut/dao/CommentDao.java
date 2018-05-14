package com.ssdut.dao;

import java.sql.Connection;

import bean.Comment;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class CommentDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addComment(Comment comment) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into comment(discuss_id,content,time,user_id) values(?,?,?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = { comment.getDiscuss_id(),comment.getContent(),comment.getTime(),comment.getUser_id()};
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("新增评论！" + e);
		}
	}
}
