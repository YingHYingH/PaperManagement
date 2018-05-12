package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.UserInfo;
import com.ssdut.dao.registerDao;

public class registerServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String psw = request.getParameter("psw");
		String email = request.getParameter("email");
		String re_psw = request.getParameter("re_psw");
		if(psw.equals(re_psw)) {
			UserInfo user = new UserInfo();
			user.setUsername(username);
			user.setEmail(email);
			user.setPsw(psw);
			boolean res = registerDao.getInstance().saveUser(user);
			//request.getRequestDispatcher("/login.jsp").forward(request, response);
			response.sendRedirect("login.jsp");
		}else {
			request.getRequestDispatcher("/registerError.jsp").forward(request, response);
		}
		// 没写注册校验（唯一性校验 合法性校验）
	}

}
