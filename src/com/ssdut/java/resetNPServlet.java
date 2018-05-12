package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.User;

import com.ssdut.dao.UserInfo;
import com.ssdut.dao.registerDao;
import com.ssdut.dao.resetNPDao;

public class resetNPServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String psw = request.getParameter("psw");
		String email = request.getParameter("email");
		String re_psw = request.getParameter("re_psw");
		if(psw.equals(re_psw)) {
			UserInfo user = new UserInfo();
			user.setEmail(email);
			user.setPsw(psw);
			boolean res = resetNPDao.getInstance().resetNP(user);
			//request.getRequestDispatcher("/login.jsp").forward(request, response);
			//System.out.println(user.getEmail());
			response.sendRedirect("login.jsp");
		}else {
			request.getRequestDispatcher("/registerError.jsp").forward(request, response);
		}
		// 没写注册校验（唯一性校验 合法性校验）
	}
}
