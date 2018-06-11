package com.ssdut.java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssdut.dao.DeleteDao;
import com.ssdut.dao.DiscussDao;
import com.ssdut.dao.FolderDao;
import com.ssdut.dao.FolderPaperDao;
import com.ssdut.dao.PaperDao;

public class DeleteFolderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer folderId = (Integer.parseInt(request.getParameter("folderId")));
		Integer flag = (Integer.parseInt(request.getParameter("flag")));
		try {
			//删除文件夹（文件夹和文件对应关系不删除，防止日后进行恢复）
			FolderDao folderDao = new FolderDao();
			folderDao.deleteFolder(folderId);
			//根据flag判断是否删除文件夹中的文件，0为删除1为不删除
			if(flag==0) {
				PaperDao paperDao = new PaperDao();
				paperDao.deletePaperWithFolderId(folderId);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
