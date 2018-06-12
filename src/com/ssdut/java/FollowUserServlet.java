package com.ssdut.java;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.DiscussDao;
import com.ssdut.dao.UserDao;

import bean.Discuss;
import bean.User;

public class FollowUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, UnsupportedEncodingException{
		//设置数据编码方式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置数据类型
        response.setContentType("text/plain");
        //设置禁用缓存
        response.setHeader("Cache-control","no-cache");
		//获取从页面传递的参数
        String flag = request.getParameter("flag");
        String authorUsername = request.getParameter("authorUsername");
        Integer user_id = Integer.valueOf(request.getParameter("user_id"));
        /*
        * 执行操作
        * */
        try {
        	UserDao userDao = new UserDao(); 
        	User user = userDao.getUserById(user_id);
        	User followingUser = userDao.getUserByUsername(authorUsername);
        	Integer isAdd = Integer.parseInt(flag);
        	String followed = user.getFollowed();
        	String following = followingUser.getFollowing();
        	if(isAdd==1) {
        		if(followed==null) {
            		followed =authorUsername+",";
            	}else {
            		followed +=authorUsername+",";
            	}
        		if(following==null) {
        			following = user.getUsername()+",";
        		}else {
        			following += user.getUsername()+",";
        		}
        	}else if(isAdd==0) {
//        		int index = followed.indexOf(authorUsername);
//        		followed = followed.substring(index, authorUsername.length()+1);
        		followed = followed.replaceFirst(authorUsername+",", "");
        		following = following.replaceFirst(user.getUsername()+",", "");
        	}
        	user.setFollowed(followed);
        	userDao.addFollowed(user);
        	followingUser.setFollowing(following);
        	userDao.addFollowing(followingUser);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
