package com.ssdut.java;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.MessageDao;
import com.ssdut.dao.PaperDao;

import bean.Paper;

public class MarkMessageReadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        //获取从页面传递的参数
        String messageId = request.getParameter("messageId");
        /*
        * 执行操作
        * */
        try {
        	new MessageDao().updateMessageRead(Integer.valueOf(messageId));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}
