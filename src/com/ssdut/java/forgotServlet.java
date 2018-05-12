package com.ssdut.java;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.forgortDao;

public class forgotServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		forgot(request,response);
	}
	

	public void forgot(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			request.setAttribute("email", email);
			Integer userid = forgortDao.getInstance().getUseridByEmail(email);
			request.setAttribute("userid", userid);
			String username = forgortDao.getInstance().getUserNameByEmail(email);
			request.setAttribute("username", username);
			String pswFromSQL = forgortDao.getInstance().getUserPswByEmail(email);
			if (pswFromSQL!=null) {
				request.getRequestDispatcher("/resetNP.jsp").forward(request, response);
			}
			//校验没写
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
