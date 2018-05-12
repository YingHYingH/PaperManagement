package com.ssdut.java;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssdut.dao.suggestDao;

public class suggestServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int paper_id = (Integer.parseInt(request.getParameter("radioPaper_id")));
		System.out.println(paper_id);
		try {
			ResultSet rs = suggestDao.getInstance().suggest(paper_id);
			HttpSession session = request.getSession();
			session.setAttribute("rs", rs);
			response.sendRedirect("suggestResult.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
