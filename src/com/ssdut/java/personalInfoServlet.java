package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.UserDao;
import com.ssdut.dao.personalInfoDao;

import bean.User;

public class personalInfoServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer id = (Integer.parseInt(request.getParameter("id")));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String academicstatus = request.getParameter("academicstatus");
		String discipline = request.getParameter("discipline");
		String intro = request.getParameter("intro").toString().trim();
		User user;
		try {
			user = new UserDao().getUserById(id);
			user.setIntro(intro);
			user.setAcademicstatus(academicstatus);
			user.setDiscipline(discipline);
			user.setEmail(email);
			user.setUsername(username);
			boolean res = personalInfoDao.getInstance().personalInfo(user);
			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// request.getRequestDispatcher("/login.jsp").forward(request, response);

		// 没写注册校验（唯一性校验 合法性校验）
	}
}
