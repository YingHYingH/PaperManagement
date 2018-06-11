package com.ssdut.dao;

import java.sql.Connection;

import bean.Discuss;
import bean.Folder;
import bean.Paper;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;

public class FolderDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addFolder(Folder folder) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into folder(folder_title,user_id,flag) values(?,?,1)";
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
	
	public Folder getFolderById(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from folder where folder_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			Folder folder = query.query(conn, sql, new BeanHandler<Folder>(Folder.class), params);
			DbHelper.release(conn);
			return folder != null ? folder : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取文件夹信息！" + e);
		}
	}
	
	public void modifyFolderTitle(Integer folderId,String title) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update folder set folder_title=? where folder_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = {title,folderId};
			query.update(conn, sql, params);
			DbHelper.release(conn);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("修改文件夹名！" + e);
		}
	}
	
	public void deleteFolder(Integer folderId) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update folder set flag=0 where folder_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = {folderId};
			query.update(conn, sql, params);
			DbHelper.release(conn);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("删除文件夹" + e);
		}
	}
}
