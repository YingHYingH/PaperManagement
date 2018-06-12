package com.ssdut.dao;

import java.sql.Connection;

import org.junit.Test;

import bean.Paper;
import com.ssdut.dao.pdfDao;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import utils.MyTextStripper;

public class addPaperDao extends AbstractDao {
	public static DbHelper helper = new DbHelper();
	private static addPaperDao instance = null;
	static pdfDao pdf = new pdfDao();

	public static addPaperDao getInstance() {
		if (instance == null) {
			instance = new addPaperDao();
		}
		return instance;
	}

	public boolean addPaper(Paper paper) throws Exception {
		try {
			return new PaperDao().addPaper(paper) == true ? true : false;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取Paper信息！" + e);
		}
	}
	
	public boolean addToMyPage(Paper paper) throws Exception {
		try {
			return new PaperDao().addToMyPage(paper) == true ? true : false;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取Paper信息！" + e);
		}
	}
	
	public boolean updatePaper(Paper paper,int user_id) throws Exception {
		try {
			return new PaperDao().updatePaper(paper,user_id) == true ? true : false;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取Paper信息！" + e);
		}
	}

	public static void addDoiAbstractTitle(String filepdfPath, String url) throws Exception {

		String DOI = pdf.getDOI(pdf.pdf(filepdfPath));
		String Abstract = pdf.getAbstract(pdf.pdf(filepdfPath));
		String title = MyTextStripper.setTitle(filepdfPath);
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set title=?,  DOI=?,abs=? where url=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { title, DOI, Abstract, url };
			query.update(conn, sql, params);
			DbHelper.release(conn);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("修改paper！" + e);
		}

	}

}
