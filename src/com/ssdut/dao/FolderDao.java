package com.ssdut.dao;

import java.sql.Connection;

import bean.Folder;
import bean.Paper;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class FolderDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addFolder(Folder folder) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into folder(folder_title,user_id) values(?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = { folder.getFolder_title(), folder.getUser_id() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("添加文件夹！" + e);
		}
	}
}
