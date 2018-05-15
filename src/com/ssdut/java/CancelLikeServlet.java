package com.ssdut.java;

import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.FolderDao;
import com.ssdut.dao.LikesDao;

import bean.Folder;

public class CancelLikeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, UnsupportedEncodingException{
		//设置数据编码方式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置数据类型
        response.setContentType("text/plain");
        //设置禁用缓存
        response.setHeader("Cache-control","no-cache");
		//获取从页面传递的参数
        String user_id = request.getParameter("user_id");
        String discussId = request.getParameter("discussId");
        /*
        * 执行操作
        * */
        try {
			LikesDao likesDao = new LikesDao();
			likesDao.cancelLikes(Integer.parseInt(discussId), Integer.parseInt(user_id));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}
