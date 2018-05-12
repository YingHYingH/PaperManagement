package com.ssdut.dao;

import java.sql.Connection;

import bean.Folder;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class FolderPaperDao extends AbstractDao{
	
	public DbHelper helper = new DbHelper();
	
	public boolean addFolderPaper(int folderId,int paperId) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into folder_paper(paper_id,folder_id) values(?,?)";
			QueryRunner query = new QueryRunner();
			Object[] params = {paperId,folderId};
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("添加文件夹与论文对应关系！" + e);
		}
	}
}
