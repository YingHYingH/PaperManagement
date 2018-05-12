package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.PaperDao;
import com.ssdut.dao.paperInfoDao;

import bean.Paper;

public class paperInfoServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer id = (Integer.parseInt(request.getParameter("id")));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String DOI = request.getParameter("DOI");
		String classification1 = request.getParameter("classification1");
		String classification2 = request.getParameter("classification2");
		String classification3 = request.getParameter("classification3");
		String abs = request.getParameter("abs");
		String pubDate = request.getParameter("pubDate");
		String notes = request.getParameter("notes");
		Paper paper;
		try {
			paper = new PaperDao().getPaperById(id);
			paper.setTitle(title);
			paper.setAuthor(author);
			paper.setDOI(DOI);
			paper.setClassification1(classification1);
			paper.setClassification2(classification2);
			paper.setClassification3(classification3);
			paper.setAbs(abs);
			paper.setPubDate(pubDate);
			paper.setNotes(notes);
			boolean res = paperInfoDao.getInstance().paperInfo(paper);
			response.sendRedirect("allDocuments.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// request.getRequestDispatcher("/login.jsp").forward(request, response);
		// System.out.println(user.getEmail());

		// 没写注册校验（唯一性校验 合法性校验）
	}
}
