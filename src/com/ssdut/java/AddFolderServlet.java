package com.ssdut.java;

import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.FolderDao;

import bean.Folder;

public class AddFolderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, UnsupportedEncodingException{
		//设置数据编码方式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置数据类型
        response.setContentType("text/plain");
        //设置禁用缓存
        response.setHeader("Cache-control","no-cache");
		//获取从页面传递的参数
        String title = request.getParameter("name");
        String userId = request.getParameter("userId");
        /*
        * 执行操作
        * */
        try {
			Folder folder = new Folder();
			folder.setFolder_title(title);
			folder.setUser_id(Integer.valueOf(userId));
			FolderDao folderDao = new FolderDao();
			folderDao.addFolder(folder);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}
