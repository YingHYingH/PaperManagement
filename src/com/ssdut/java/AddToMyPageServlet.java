package com.ssdut.java;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssdut.dao.PaperDao;
import com.ssdut.dao.UserDao;
import com.ssdut.dao.addPaperDao;
import com.ssdut.dao.addPaperFavoritesDao;

import bean.Paper;
import bean.User;

public class AddToMyPageServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String paperId = request.getParameter("paperId");
		String userId = request.getParameter("userId");
		String authorUsername = request.getParameter("authorUsername");
		PaperDao paperDao = new PaperDao();
		try {
			Paper paper = paperDao.getPaperById(Integer.parseInt(paperId));
			paper.setId(null);
			paper.setUrl(paper.getUrl()+"_"+userId);
			paper.setUser_id(Integer.parseInt(userId));
			// 更新Paper url uploadDate字段
			Calendar c = Calendar.getInstance();
			String uploadDate = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DATE)
					+ " " + c.get(Calendar.HOUR_OF_DAY) + ":"
					+ (c.get(Calendar.MINUTE) < 10 ? ("0" + c.get(Calendar.MINUTE)) : c.get(Calendar.MINUTE))
					+ ":"
					+ (c.get(Calendar.SECOND) < 10 ? ("0" + c.get(Calendar.SECOND)) : c.get(Calendar.SECOND));
			// String uploadDate = year + "/" + month + "/" + day;
			paper.setUploadDate(uploadDate);
			addPaperDao.getInstance().addToMyPage(paper);
			//response.sendRedirect("personalHome.jsp?authorUsername="+authorUsername);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
