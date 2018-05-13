package com.ssdut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Paper;
import dbhelper.DbHelper;

public class suggestDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static suggestDao instance = null;

	public static suggestDao getInstance() {
		if (instance == null) {
			instance = new suggestDao();
		}
		return instance;
	}

	public ResultSet suggest(int radioPaper_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			Paper paper = new PaperDao().getPaperById(radioPaper_id);
			StringBuffer sql = new StringBuffer();
			sql.append("select * ,(watches + downloadcnt) as score from paper where");
			if(paper.getClassification1()!="") {
				sql.append("select * ,(watches + downloadcnt) as score from paper where");
			}
			
			
			
			/*String sql = "select * ,(watches + downloadcnt) as score from paper where classification1 like '%"
					+ searchKeyword + "%' OR author like '%" + searchKeyword + "%' ORDER BY score desc";*/
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			DbHelper.release(conn);
			ResultSet rs = pstmt.executeQuery();
			return rs;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("精确查找！" + e);
		}
	}
}
