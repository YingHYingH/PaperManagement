package com.ssdut.java;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.DiscussDao;

import bean.Discuss;

public class AddDiscussServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, UnsupportedEncodingException{
		//设置数据编码方式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置数据类型
        response.setContentType("text/plain");
        //设置禁用缓存
        response.setHeader("Cache-control","no-cache");
		//获取从页面传递的参数
        String title = request.getParameter("discussTitle");
        String content = request.getParameter("discussContent");
        Integer user_id = Integer.valueOf(request.getParameter("user_id"));
        Date date = new Date();
        /*
        * 执行操作
        * */
        try {
        	Discuss discuss = new Discuss();
        	discuss.setTitle(title);
        	discuss.setContent(content);
        	discuss.setUser_id(user_id);
        	discuss.setTime(date);
        	DiscussDao discussDao = new DiscussDao();
        	discussDao.addDiscuss(discuss);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
