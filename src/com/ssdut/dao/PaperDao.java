package com.ssdut.dao;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import bean.Paper;
import dbhelper.DbHelper;
import dbhelper.QueryRunner;
import handlers.BeanHandler;
import handlers.BeanListHandler;

public class PaperDao extends AbstractDao {
	public DbHelper helper = new DbHelper();

	public Paper getPaperByUser_Id(Integer user_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from paper where user_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { user_id };
			Paper paper = query.query(conn, sql, new BeanHandler<Paper>(Paper.class), params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return paper;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	public Paper getPaperByAll(String title, String author, Integer user_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from paper where title=? AND author=? AND user_id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { title, author, user_id };
			Paper paper = query.query(conn, sql, new BeanHandler<Paper>(Paper.class), params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return paper;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	/*
	 * public boolean addPaper(Paper paper) throws Exception { try { Connection conn
	 * = helper.getConnection(); String sql =
	 * "insert into paper(title,author,DOI,classification1,classification2,classification3,abs,pubDate,user_id,flag) values(?,?,?,?,?,?,?,?,?,0)"
	 * ; QueryRunner query = new QueryRunner(); Object[] params = {
	 * paper.getTitle(), paper.getAuthor(), paper.getDOI(),
	 * paper.getClassification1(), paper.getClassification2(),
	 * paper.getClassification3(), paper.getAbs(), paper.getPubDate(),
	 * paper.getUser_id() }; query.update(conn, sql, params);
	 * DbHelper.release(conn); // return paper != null ? paper : null; return true;
	 * } catch (Exception e) { // TODO: handle exception throw new Exception("添加论文！"
	 * + e); } }
	 */

	public boolean addPaper(Paper paper) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into paper(title,author,DOI,classification1,classification2,classification3,abs,pubDate, uploadDate,url,flag,notes,ifRead) values('','','','','','','','',?,?,0,'',0)";
			QueryRunner query = new QueryRunner();
			Object[] params = { paper.getUploadDate(), paper.getUrl() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("添加论文！" + e);
		}
	}
	
	public boolean addToMyPage(Paper paper) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into paper(title,author,DOI,classification1,classification2,classification3,abs,pubDate, uploadDate,url,user_id,flag,notes,ifRead) values(?,?,?,'','','',?,?,?,?,?,0,'',0)";
			QueryRunner query = new QueryRunner();
			Object[] params = { paper.getTitle(),paper.getAuthor(),paper.getDOI(),paper.getAbs(),paper.getPubDate(),paper.getUploadDate(), paper.getUrl(),paper.getUser_id() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("添加论文！" + e);
		}
	}


	public boolean updatePaper(Paper paper, int user_id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set title=?,author=?,DOI=?,classification1=?,classification2=?,classification3=?,abs=?,pubDate=?,user_id=?,ifRead=?  where url=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { paper.getTitle(), paper.getAuthor(), paper.getDOI(), paper.getClassification1(),
					paper.getClassification2(), paper.getClassification3(), paper.getAbs(), paper.getPubDate(), user_id,paper.getIfRead(),
					paper.getUrl() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("修改论文！" + e);
		}
	}

	public boolean addPaperFavorites(Paper paper) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "insert into paper(title,author,DOI,classification1,classification2,classification3,abs,pubDate, uploadDate,url,flag,notes,ifRead) values('','','','','','','','',?,?,1,'',0)";
			QueryRunner query = new QueryRunner();
			Object[] params = { paper.getUploadDate(), paper.getUrl() };
			query.update(conn, sql, params);
			DbHelper.release(conn);
			// return paper != null ? paper : null;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("添加论文！" + e);
		}
	}

	public Paper getPaperById(Integer id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from paper where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			Paper paper = query.query(conn, sql, new BeanHandler<Paper>(Paper.class), params);
			DbHelper.release(conn);
			return paper != null ? paper : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	public Paper getPaperByurl(String url) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from paper where url=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { url };
			Paper paper = query.query(conn, sql, new BeanHandler<Paper>(Paper.class), params);
			DbHelper.release(conn);
			return paper != null ? paper : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	public void increWatches(int id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set watches=watches+1 where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	public void increDownloadcnt(int id) throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "update paper set downloadcnt=downloadcnt+1 where id=?";
			QueryRunner query = new QueryRunner();
			Object[] params = { id };
			query.update(conn, sql, params);
			DbHelper.release(conn);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取论文信息！" + e);
		}
	}

	public ArrayList<Paper> getAllPapers() throws Exception {
		try {
			Connection conn = helper.getConnection();
			String sql = "select * from paper";
			QueryRunner query = new QueryRunner();
			ArrayList<Paper> papers = (ArrayList<Paper>) query.query(conn, sql,
					new BeanListHandler<Paper>(Paper.class));
			DbHelper.release(conn);
			return papers != null ? papers : null;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取所有论文信息失败！" + e);
		}
	}

	@Test
	public void testGetPaperByUser_Id() throws Exception {
		PaperDao paperDao = new PaperDao();
		Paper paper = paperDao.getPaperByUser_Id(2);
		System.out.println(paper);
	}

	@Test
	public void testGetAllPapers() throws Exception {
		PaperDao paperDao = new PaperDao();
		ArrayList<Paper> papers = paperDao.getAllPapers();
		System.out.println(papers);
	}

	@Test
	public void testgetPaperByAll() throws Exception {
		PaperDao paperDao = new PaperDao();
		Paper paper = paperDao.getPaperByAll("title", "author", 4);
		System.out.println(paper);
	}

	@Test
	public void testincreDownloadcnt() throws Exception {
		int id = 40;
		increDownloadcnt(id);
	}
}
