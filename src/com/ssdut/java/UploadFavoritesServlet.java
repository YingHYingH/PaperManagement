package com.ssdut.java;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ssdut.dao.addPaperDao;
import com.ssdut.dao.addPaperFavoritesDao;

import bean.Paper;
import utils.RenameUtil;

public class UploadFavoritesServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String DOI = request.getParameter("DOI");
		String classification1 = request.getParameter("classification1");
		String classification2 = request.getParameter("classification2");
		String classification3 = request.getParameter("classification3");
		String abs = request.getParameter("abs");
		String pubDate = request.getParameter("pubDate");
		String uploadDate = request.getParameter("uploadDate");
		String url = request.getParameter("url");

		/*
		 * String uploadPath = getServletContext().getRealPath("/") + "upload"; //
		 * 定义上传文件的地址
		 */
		String uploadPath = "E:\\Workspaces\\PaperManagement\\WebContent\\upload";
		String fname; // 获取文件名
		String prefix;// 获取文件格式 没有"."
		String filePath;
		String fNewname;
		String fileNewPath = "";
		String filepdfPath = "";
		File folder = new File(uploadPath);
		if (!folder.exists())
			folder.mkdirs();
		String message = null;
		if (ServletFileUpload.isMultipartContent(request)) { // 判断是否获取的是文件
			DiskFileItemFactory disk = new DiskFileItemFactory();
			disk.setSizeThreshold(20 * 1024); // 设置内存可存字节数
			disk.setRepository(disk.getRepository()); // 设置临时文件目录
			ServletFileUpload up = new ServletFileUpload(disk);
			int maxsize = 20 * 1024 * 1024;
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
					fname = fm.getName(); // 获取文件名
					prefix = fname.substring(fname.lastIndexOf(".") + 1);// 获取文件格式 没有"."
					fNewname = RenameUtil.TimeRename();
					filePath = "E:\\Workspaces\\PaperManagement\\WebContent\\upload\\" + fm.getName(); // 获取文件全路径名
					fileNewPath = "E:/Workspaces/PaperManagement/WebContent/upload/" + fNewname + "." + prefix;
					filepdfPath = "E:\\Workspaces\\PaperManagement\\WebContent\\upload\\" + fNewname + "." + prefix;
					// System.out.println(filePath);
					// System.out.println(fname);
					String fileName = "";
					// 更新Paper url uploadDate字段
					Calendar c = Calendar.getInstance();
					uploadDate = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DATE)
							+ " " + c.get(Calendar.HOUR_OF_DAY) + ":"
							+ (c.get(Calendar.MINUTE) < 10 ? ("0" + c.get(Calendar.MINUTE)) : c.get(Calendar.MINUTE))
							+ ":"
							+ (c.get(Calendar.SECOND) < 10 ? ("0" + c.get(Calendar.SECOND)) : c.get(Calendar.SECOND));
					// String uploadDate = year + "/" + month + "/" + day;
					Paper paper = new Paper();
					paper.setUrl(fileNewPath);
					paper.setUploadDate(uploadDate);

					int startIndex = filePath.lastIndexOf("\\");
					if (startIndex != -1) { // 对文件名进行截取
						fileName = filePath.substring(startIndex + 1);
					} else {
						fileName = filePath;
					}
					if (fm.getSize() > maxsize) {
						message = "文件太大了，不要超过20MB";
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
						boolean res = addPaperFavoritesDao.getInstance().addPaperFavorites(paper);

					} catch (Exception e1) {
						e1.printStackTrace();
					}

					File file = new File("E:/Workspaces/PaperManagement/WebContent/upload/" + fname);
					file.renameTo(
							new File("E:/Workspaces/PaperManagement/WebContent/upload/" + fNewname + "." + prefix));
				}

			}
		}
		try {
			addPaperDao.addDoiAbstractTitle(filepdfPath, fileNewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url = fileNewPath;
		request.setAttribute("title", title);
		request.setAttribute("DOI", DOI);
		request.setAttribute("abs", abs);
		request.setAttribute("url", url);
		request.setAttribute("result", message);
		HttpSession session = request.getSession();
		session.setAttribute("title", title);

		session.setAttribute("DOI", DOI);

		session.setAttribute("abs", abs);
		session.setAttribute("url", url);
		System.out.println(url);
		String address = "addPaperFavorites2.jsp?first=url";
		request.getRequestDispatcher(address).forward(request, response);
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
