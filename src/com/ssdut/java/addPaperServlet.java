package com.ssdut.java;

import java.io.IOException;

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

public class addPaperServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String DOI = request.getParameter("DOI");
		String classification1 = request.getParameter("classification1");
		String classification2 = request.getParameter("classification2");
		String classification3 = request.getParameter("classification3");
		String abs = request.getParameter("abs");
		String pubDate = request.getParameter("pubDate");
		String uploadDate = request.getParameter("uploadDate");
		String url = (String) session.getAttribute("url");
		Integer user_id = (Integer.parseInt(request.getParameter("user_id")));
		// User user = new UserDao().getUserById(user_id);
		Paper paper = new Paper();
		paper.setTitle(title);
		paper.setAuthor(author);
		paper.setDOI(DOI);
		paper.setClassification1(classification1);
		paper.setClassification2(classification2);
		paper.setClassification3(classification3);
		paper.setAbs(abs);
		paper.setPubDate(pubDate);
		paper.setUploadDate(uploadDate);
		paper.setUrl(url);
		paper.setUser_id(user_id);
		try {
			boolean res = addPaperDao.getInstance().updatePaper(paper, user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("title", title);
		request.setAttribute("author", author);
		request.setAttribute("DOI", DOI);
		request.setAttribute("classification1", classification1);
		request.setAttribute("classification2", classification2);
		request.setAttribute("classification3", classification3);
		request.setAttribute("abs", abs);
		request.setAttribute("pubDate", pubDate);
		// request.getRequestDispatcher("/login.jsp").forward(request, response);

		try {
			paper = new PaperDao().getPaperByurl(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(paper);
		session.setAttribute("id", paper.getId());
		session.setAttribute("title", title);
		session.setAttribute("author", author);
		session.setAttribute("DOI", DOI);
		session.setAttribute("classification1", classification1);
		session.setAttribute("classification2", classification2);
		session.setAttribute("classification3", classification3);
		session.setAttribute("abs", abs);
		session.setAttribute("pubDate", pubDate);
		request.getRequestDispatcher("allDocuments.jsp").forward(request, response);
		// response.sendRedirect("addPaper2.jsp");
	}
}
