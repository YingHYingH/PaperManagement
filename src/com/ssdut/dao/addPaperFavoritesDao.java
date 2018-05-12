package com.ssdut.dao;

import org.junit.Test;

import bean.Paper;
import dbhelper.DbHelper;

public class addPaperFavoritesDao extends AbstractDao {
	public DbHelper helper = new DbHelper();
	private static addPaperFavoritesDao instance = null;

	public static addPaperFavoritesDao getInstance() {
		if (instance == null) {
			instance = new addPaperFavoritesDao();
		}
		return instance;
	}

	public boolean addPaperFavorites(Paper paper) throws Exception {
		try {
			return new PaperDao().addPaperFavorites(paper) == true ? true : false;
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("获取Paper信息！" + e);
		}
	}

	@Test
	public void addPaperFavoritesDaotest() throws Exception {
		Paper paper = new Paper();

		paper.setTitle("title");
		paper.setAuthor("author");
		paper.setDOI("DOI");
		paper.setClassification1("classification1");
		paper.setUser_id(4);
		paper.setPubDate("0001/00/00");
		new addPaperFavoritesDao().addPaperFavorites(paper);
		paper = new PaperDao().getPaperById(1);

		System.out.println(paper);
	}
}
