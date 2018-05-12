package com.ssdut.java;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.PaperDao;

import bean.Paper;

public class MarkReadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        //获取从页面传递的参数
        String id = request.getParameter("id");
        /*
        * 执行操作
        * */
        try {
        	PaperDao paperDao = new PaperDao();
			Paper paper = paperDao.getPaperById(Integer.valueOf(id));
			int ifRead = paper.getIfRead();
			if(ifRead==0) {
				paper.setIfRead(1);
			}else {
				paper.setIfRead(0);
			}
			paperDao.updatePaper(paper,paper.getUser_id());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}
