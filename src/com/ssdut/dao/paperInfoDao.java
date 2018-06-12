package com.ssdut.dao;

import java.sql.Connection;

import bean.Paper;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;

public class paperInfoDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static paperInfoDao instance = null;

	public static paperInfoDao getInstance() {
		if (instance == null) {
			instance = new paperInfoDao();
		}
		return instance;
	}

	public boolean paperInfo(Paper paper) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set title=?, author=?, DOI=?, classification1=? ,classification2=? ,classification3=? ,abs=? ,pubDate=? ,notes=? where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { paper.getTitle(), paper.getAuthor(), paper.getDOI(), paper.getClassification1(),
					paper.getClassification2(), paper.getClassification3(), paper.getAbs(), paper.getPubDate(),
					paper.getNotes(), paper.getId() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("修改paper！" + e);
		}
	}
}
