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

}
