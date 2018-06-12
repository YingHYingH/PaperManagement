package com.ssdut.java;

import java.io.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ssdut.dao.UploadDao;
import com.ssdut.dao.addPaperDao;

import utils.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;

public class testServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("id");

		/*
		 * String uploadPath = getServletContext().getRealPath("/") + "upload"; //
		 * 定义上传文件的地址
		 */
		String uploadPath = "E:\\Workspaces\\PaperManagement\\WebContent\\upload";
		File folder = new File(uploadPath);
		if (!folder.exists())
			folder.mkdirs();
		String message = null;
		if (ServletFileUpload.isMultipartContent(request)) { // 判断是否获取的是文件
			DiskFileItemFactory disk = new DiskFileItemFactory();
			disk.setSizeThreshold(20 * 1024); // 设置内存可存字节数
			disk.setRepository(disk.getRepository()); // 设置临时文件目录
			ServletFileUpload up = new ServletFileUpload(disk);
			int maxsize = 2 * 1024 * 1024;
			List list = null;
			try {
				list = up.parseRequest(request); // 获取上传列表
			} catch (Exception e) {
				e.printStackTrace();
			}
			Iterator i = list.iterator(); // 创建列表的迭代器
			while (i.hasNext()) {
				FileItem fm = (FileItem) i.next(); // 遍历列表
				if (!fm.isFormField()) {
					String fname = fm.getName(); // 获取文件名
					String filePath = "E:\\Workspaces\\PaperManagement\\WebContent\\upload\\" + fm.getName(); // 获取文件全路径名
					String fileName = "";
					// 更新Paper url uploadDate字段
					Calendar c = Calendar.getInstance();
					String uploadDate = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/"
							+ c.get(Calendar.DATE) + " " + c.get(Calendar.HOUR) + ":" + c.get(Calendar.MINUTE) + ":"
							+ c.get(Calendar.SECOND);

					/*
					 * String year = String.format("%tY", date);
					 * 
					 * String month = String.format("%tb", date);
					 * 
					 * String day = String.format("%te", date);
					 */
					// String uploadDate = year + "/" + month + "/" + day;
					try {
						boolean res = UploadDao.getInstance().Upload(id, filePath, uploadDate);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					int startIndex = filePath.lastIndexOf("\\");
					if (startIndex != -1) { // 对文件名进行截取
						fileName = filePath.substring(startIndex + 1);
					} else {
						fileName = filePath;
					}
					if (fm.getSize() > maxsize) {
						message = "文件太大了，不要超过2MB";
						break;
					}
					String fileSize = new Long(fm.getSize()).toString();
					if ((fname == null) || (fname.equals("")) && (fileSize.equals("0"))) {
						message = "文件名不能为空，文件大小也不能为零！";
						break;
					}
					File saveFile = new File(uploadPath, fileName);
					try {
						fm.write(saveFile); // 向文件中写入数据
						message = "文件上传成功！";
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
			}
		}

		request.setAttribute("result", message);
		RequestDispatcher rd = request.getRequestDispatcher("library.jsp");
		rd.forward(request, response);
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
