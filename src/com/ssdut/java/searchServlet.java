package com.ssdut.java;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssdut.dao.searchDao;

public class searchServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("searchKeyword");
		int user_id = (Integer.parseInt(request.getParameter("user_id")));
		System.out.println(user_id);
		System.out.println(searchKeyword);
		try {
			ResultSet rs = searchDao.getInstance().search(searchKeyword);
			HttpSession session = request.getSession();
			session.setAttribute("rs", rs);
			response.sendRedirect("searchResult.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
