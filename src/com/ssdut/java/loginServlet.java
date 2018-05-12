package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssdut.dao.loginDao;

public class loginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		login(request, response);

	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String psw = request.getParameter("psw");
		// String pswFromSQL = loginDao.getInstance().findUser(username);
		loginDao loginer = new loginDao();
		boolean islogined = loginer.login(username, psw);
		if (islogined) {
			// request.getRequestDispatcher("/home.jsp").forward(request, response);
			// response.sendRedirect("home.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("home.jsp");
		}
		// 校验没写
	}
}
